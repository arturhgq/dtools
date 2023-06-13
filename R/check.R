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

#' @title Check if a quoted or unquoted element exists within a \code{r} object
#' @description `r lifecycle::badge('stable')`
#' This function checks if a quoted or unquoted element exists within a \code{r} object
#' @param obj \code{r} object
#' @param x a quoted or unquoted element on which existence will be checked
#' @examples
#' check_var(mtcars, cyl)
#'
#' data_list = list(dat1 = mtcars, dat2 = airmiles)
#' check_var(data_list, dat1)
#' check_element(data_list, dat3)
#'
#' @export
#'
check_var <- function(obj, x){
  x_substitute = substitute(x)
  if (is.symbol(x_substitute)) x_string = deparse(x_substitute)
  else x_string = x
  any(names(obj) == x_string)
}

#' @rdname check_var
#' @export
check_element <- function(obj, x){
  x_substitute = substitute(x)
  if (is.symbol(x_substitute)) x_string = deparse(x_substitute)
  else x_string = x
  any(names(obj) == x_string)
}

#' @title Check if a vector of quoted elements exists within a \code{r} object
#' @description `r lifecycle::badge('stable')`
#' This function checks if a vector of quoted elements exists within a \code{r} object
#' @param obj \code{r} object
#' @param x a vector fo quoted elements on which existence will be checked
#' @examples
#' check_var(mtcars, cyl)
#'
#' data_list = list(dat1 = mtcars, dat2 = airmiles)
#' check_vars(data_list, c("dat12", "dat1"))
#' check_elements(data_list, c("dat12", "dat1"))
#'
#' @export
#'
check_vars = function(obj, x) {
  mapply(
    check_var, 
    x = x,
    MoreArgs = list(obj = obj),
    SIMPLIFY = FALSE
  )
}

#' @rdname check_vars
#' @export
check_elements = function(obj, x) {
  mapply(
    check_var, 
    x = x,
    MoreArgs = list(obj = obj),
    SIMPLIFY = FALSE
  )
}
