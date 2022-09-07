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
