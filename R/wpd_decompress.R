#' wpd_decompress
#'
#' @param page_views single cell from column of same name from db query result
#' @param year single cell from column of same name from db query result
#' @param page_id single cell from column of same name from db query result
#' @param lang single cell from column of same name from db query result
#' @param page_name single cell from column of same name from db query result
#'
#'
wpd_decompress <-
  function(page_views, year, page_id, lang, page_name){
    date <-
      if ( year == 2007 ){
        seq.Date(
          from = as.Date(paste0(year, "-12-10")),
          to   = as.Date(paste0(year, "-12-31")),
          by   = "day"
        )
      } else {
        seq.Date(
          from = as.Date(paste0(year, "-01-01")),
          to   = as.Date(paste0(year, "-12-31")),
          by   = "day"
        )
      }

    data.frame(
      page_id    = page_id,
      lang       = lang,
      page_name  = page_name,
      date       = date,
      page_views = unlist(strsplit(page_views, ","))
    )
  }