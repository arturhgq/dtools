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

#' @title Select objects in lists
#' @description `r lifecycle::badge('stable')`
#'
#' This function selects named or unnamed objects in lists. It is equivalent to
#' \code{list[c("object")]} or \code{list[c(1,2)]}
#' @param .list a list
#' @param ... objects
#' @export
list_select <- function(.list, ...){
  .list[c(...)]
}

#' Remove objects in lists
#' @description `r lifecycle::badge('stable')`
#'
#' This function removes named or unnamed objects in lists
#' @param .list a list
#' @param ... objects
#' @export
list_remove <- function(.list, ...){
  if ("" %in% allNames(.list)) {
    .list[-c(...)]
  } else{
    within(.list, rm(...))
  }

}
