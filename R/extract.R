#' @title Extract numerical sequences from strings
#' @description `r lifecycle::badge('stable')`
#'
#' This function extracts numerical sequences from strings
#' @param x a string of type 'character'´
#' @export

extract_numbers <- \(x) {
  if (!is.character(x)) {
    x_string = deparse(substitute(x))
    cli::cli_abort("'{(x_string)}' must be 'character'.")
  }

  numbers = gsub('[^0-9]+',"", x)
  numbers[numbers == ""] = NA
  numbers
}
