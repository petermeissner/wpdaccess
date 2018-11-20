#' wpd_get_exact
#'
#' @param page page name or SQL search string
#'   (https://www.techonthenet.com/sqlite/like.php,
#'   https://sqlite.org/lang_expr.html#like)
#' @param lang language vector, see: wpd_languages
#' @param data should time series data be returned in addition to page_id,
#'   lang and page_name
#' @param comp the SQL comparison operator to be used '=' or like
#'
#' @export
#' @examples
#'
#' \dontrun{
#' wpd_get_exact("angela_merkel", c("de", "en"))
#' wpd_get_exact("angela_merkel", c("de", "en"), data = FALSE)
#'
#' wpd_get_search("%peter%", c("de", "en"))
#' wpd_get_search("angela%", c("cs"), data = TRUE)
#' }
#'
wpd_get_exact <-
  function(page = NULL, lang = NULL, data = TRUE, comp = "="){

    # check for languages in set of supported languages
    lang <- lang[lang %in% wpd_languages]

    # loop over languages and get matches
    res <- list()
    for ( l in lang ){
      res[[ length(res) + 1 ]] <- wpd_get_worker(page, l, comp = comp, data = data)
    }

    # rbind res
    df <- do.call(rbind, res)

    # sort rows
    if ( "date" %in% names(df) ){
      df_sorted <- dplyr::arrange_(df, "lang", "page_id", "date")
    } else {
      df_sorted <- dplyr::arrange_(df, "lang", "page_id")
    }

    # return
    tibble::as_tibble(df_sorted)
  }


#' wpd_get_search
#'
#' @rdname wpd_get_exact
#'
#' @export
#'
wpd_get_search <-
  function(page = NULL, lang = NULL, data = FALSE){
    wpd_get_exact(page, lang, data = data, comp = "like")
  }