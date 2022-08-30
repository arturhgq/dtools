#' @title Checks if the running R version contains the native pipe
#' @description `r lifecycle::badge('stable')`
#'
#'  This function checks if the running R version contains the native pipe
#' @param .print prints the running R version
#' @export
check_r_pipe <- function(.print = FALSE) {

  R.Version()[["major"]] -> .rv.major
  as.numeric(R.Version()[["minor"]]) -> .rv_minor

  if (.rv.major < 4 &  .rv_minor < 0) {
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
  if (isTRUE(.print)) cli::cli_alert_info(
    "R version: {R.Version()[['major']]}.{R.Version()[['minor']]}"
  )
}
