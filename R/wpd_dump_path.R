#' wpd_dump_path
#'
#' Store and retrieve path to Wikipedia dump SQLite databases.
#'
#' @param path path to set - location of Wikipedia dump SQLite databases
#'
#' @export
#' @examples
#'
#' # setting path - #1
#' options("./")
#'
#' # setting path - #2
#' wpd_dump_path("./")
#'
#' # getting path - #1
#' options("wpd.path")
#'
#' # getting path - #2
#' wpd_dump_path()
#'
wpd_dump_path <-
  function(path) {
    if ( missing(path) ){
      getOption(
        "wpd.path",
        stop("Option 'wpd.path' not set. Use options(wpd.path='path/to/wpd/dumps') to set option)"))
    }else{
      unlist(
        options(wpd.path = path)
      )
    }
  }