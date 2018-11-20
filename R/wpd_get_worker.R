#' wpd_get_worker
#'
#' @rdname wpd_get_exact
#'
wpd_get_worker <-
  function(page, lang, comp = "=", data = TRUE){
    # generate file path
    file_path <-
      file.path(
        wpd_dump_path(),
        sprintf("%s.db", lang)
      )

    # establish connection to database
    con <-
      DBI::dbConnect(
        RSQLite::SQLite(),
        dbname   = file_path,
        flags    = RSQLite::SQLITE_RO
      )
    on.exit(DBI::dbDisconnect(con))


    # generate query
    query <-
      sprintf(
         paste0(
         "select
          a.page_id, '%s' as lang, a.page_name",
         if ( data == TRUE ){
           ", b.year, b.page_views"
         },
         "
         from dict_%s as a ",
          if ( data == TRUE ){
            sprintf(
              "
              LEFT OUTER JOIN
              page_views_daily_%s as b
              on a.page_id = b.page_id
               ",
              lang
            )
          },
          " where a.page_name %s '%s'
          "
         ),
        lang,
        lang,
        comp,
        page
      )

    # query database
    query_res <- DBI::dbGetQuery(con, query)


    # decompress data
    if ( is.null(query_res$page_views) ){
      res  <- query_res
    } else {
      decomp <-
        mapply(
          FUN        = wpd_decompress,
          page_views = query_res$page_views,
          year       = query_res$year,
          page_id    = query_res$page_id,
          lang       = query_res$lang,
          page_name  = query_res$page_name,
          SIMPLIFY   = FALSE,
          USE.NAMES  = FALSE
        )

      # rbind
      res <-
        do.call(
          rbind,
          decomp
        )
    }


  }

