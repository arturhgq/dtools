#' @title Check if the running R version contains the native pipe
#' @description `r lifecycle::badge('stable')`
#'
#'  This function checks if the running R version contains the native pipe
#' @param .rversion prints the running R version
#' @examples
#' check_r_pipe(TRUE)
#' @export
check_r_pipe <- function(.rversion = FALSE) {

  R.Version()[["major"]] -> .rv.major
  as.numeric(R.Version()[["minor"]]) -> .rv_minor

  if (.rv.major < 4) {
    cli::cli_abort(
      c(
        "This R version does not contain the native pipe.",
        "x" = "R version must be >= 4.1")
    )
  } else if(.rv.major == 4 & .rv_minor < 1) {
    cli::cli_abort(
      c(
        "This R version does not contain the native pipe.",
        "x" = "R version must be >= 4.1")
    )
  } else {
    cli::cli_alert_info(
      "This R version contain the native pipe."
    )
  }
  if (.rversion) cli::cli_alert_info(
    "R version: {R.Version()[['major']]}.{R.Version()[['minor']]}"
  )
}

#' @title Check if a named element exists within a \code{r} object
#' @description `r lifecycle::badge('stable')`
#' This function checks if a named element exists within a \code{r} object
#' @param obj \code{r} object
#' @param x named element on which existence will be checked
#' @examples
#' check_var(mtcars, cyl)
#'
#' data_list = list(dat1 = mtcars, dat2 = airmiles)
#' check_element(data_list, dat1)
#' check_element(data_list, dat3)
#'
#' @export
#'
check_var <- function(obj, x){
  x_string = deparse(substitute(x))
  any(names(obj) == x_string)
}

#' @rdname check_var
#' @export
check_element <- function(obj, x){
  x_string = deparse(substitute(x))
  any(names(obj) == x_string)
}

