% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/wpd_get_exact.R, R/wpd_get_worker.R
\name{wpd_get_exact}
\alias{wpd_get_exact}
\alias{wpd_get_search}
\alias{wpd_get_worker}
\title{wpd_get_exact}
\usage{
wpd_get_exact(page = NULL, lang = NULL, data = TRUE, comp = "=")

wpd_get_search(page = NULL, lang = NULL, data = FALSE)

wpd_get_worker(page, lang, comp = "=", data = TRUE)
}
\arguments{
\item{page}{page name or SQL search string
(https://www.techonthenet.com/sqlite/like.php,
https://sqlite.org/lang_expr.html#like)}

\item{lang}{language vector, see: wpd_languages}

\item{data}{should time series data be returned in addition to page_id,
lang and page_name}

\item{comp}{the SQL comparison operator to be used '=' or like}
}
\description{
wpd_get_exact

wpd_get_search

wpd_get_worker
}
\examples{

\dontrun{
wpd_get_exact("angela_merkel", c("de", "en"))
wpd_get_exact("angela_merkel", c("de", "en"), data = FALSE)

wpd_get_search("\%peter\%", c("de", "en"))
wpd_get_search("angela\%", c("cs"), data = TRUE)
}

}
