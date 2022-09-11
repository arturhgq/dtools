#' @title Check if the running R version contains the native pipe
#' @description `r lifecycle::badge('stable')`
#'
#'  This function checks if the running R version contains the native pipe
#' @param .rversion prints the running R version
#' @examples
#' check_r_pipe(T)
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

#' @title Check if a variable exists within a data frame
#' @description `r lifecycle::badge('stable')`
#'
#' This function checks if a variable exists within a data frame
#' @param .data data frame
#' @param .var variable on which existence will be checked
#' @export
#'
check_var <- function(.data, .var){
  deparse(
    substitute(.var)
  ) -> .var_string
  any(names(.data) == .var_string)
}
