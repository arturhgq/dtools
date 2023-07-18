#' @title Add leading digits in a vector
#' @description This function adds leading digits in a vector
#' @param x A charecter vector.
#' @param digit The leading digit to be added.
#' @param seq_length required length of sequence of numbers.
#' @examples
#' add_digits("(31) 9-8932-1010", 0, 12)
#' @export
add_digits = function(x, digit = 0, seq_length) {
  x_clean = dtools::extract_numbers(x)
  x_split = stringr::str_split(x_clean, "")
  x_length = purrr::map_dbl(x_split, length)
  x_length_remainder = seq_length - x_length
  n_digits = stringr::str_dup(digit, x_length_remainder)
  paste0(n_digits, x_clean)
}
