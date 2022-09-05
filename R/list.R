#' @title List files stored in a directory according to a naming pattern
#' @description `r lifecycle::badge('stable')`
#'
#' This function lists files stored in a directory according to a naming pattern
#' @param .path directory tree
#' @param .ext  file extension
#' @export
list_files <- function(.path, .ext = ".csv") {

  paste0(.ext, "$") -> .ext_
  list.files(
    path = .path,
    full.names = T,
    pattern = .ext_,
    ignore.case = TRUE
  ) -> .files_tree
  gsub(".*/", "", .files_tree) -> .files

  .files_tree |>
    as.list() |>
    purrr::set_names(.files)
}
