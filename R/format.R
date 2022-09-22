#' @title Round and set a minimum number of digits
#' @description `r lifecycle::badge('stable')`
#'
#' This function round and set a minimum number of digits
#' @param .var a numeric vector
#' @param .digits the minimum number of digits that will be set
#' @export

format_digits <- \(.var, .digits){
  if (!is.numeric(.var)) {
    cli::cli_abort(
      ".var must be numeric"
    )
  }
  janitor::round_half_up(.var, .digits) |>
    format(nsmall = .digits)
}
