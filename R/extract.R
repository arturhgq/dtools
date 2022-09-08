#' @title Extract numerical sequences from strings
#' @description `r lifecycle::badge('stable')`
#'
#' This function extracts numerical sequences from strings
#' @param .var variable of type 'character'´
#' @export

extract_numbers <- \(.var) {
  if (!is.character(.var)) {
    substitute(.var) |>
      deparse()-> .var_string
    cli::cli_abort("'{(.var_string)}' must be 'character'.")
  }

  gsub('[^0-9]+',"", .var) |>
    dplyr::na_if("NA")
}
