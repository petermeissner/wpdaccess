#' wpd_get_exact_worker
#'
#' @rdname wpd_get_exact
#'
wpd_get_exact_worker <-
  function(page, lang){
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
        flags    = RSQLite::SQLITE_RO,
        encoding = "UTF-8"
      )

    # query database
    DBI::dbGetQuery(
      con,
      sprintf(
        "select * from dict_%s where page_name = '%s'",
        lang,
        page
      )
    )

  }

