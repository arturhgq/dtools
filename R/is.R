#' @title Are x elements in y?
#' @description `r lifecycle::badge("stable")`
#'
#' This function indicates which elements are not in \R objects
#' @param x an \R object to be tested
#' @param y an \R object
#' @export
#'
not_in <- function(x, y) {
  `%ni%` <- Negate(`%in%`)
  x %ni% y
}
