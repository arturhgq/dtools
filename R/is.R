#' @title Are the elements of x contained in y?
#' @description `r lifecycle::badge("stable")`
#'
#' This function indicates which elements of x are not in y
#' @param x an \R object to be tested
#' @param y an \R object
#' @export
#'
not_in <- function(x, y) {
  `%ni%` <- Negate(`%in%`)
  x %ni% y
}
