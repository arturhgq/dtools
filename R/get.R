#' @title Get the variable's index
#' @description `r lifecycle::badge('stable')`
#'
#' This function returns the index of a variable
#' @param .data data frame
#' @param .var variable on which index will be returned
#' @export
get_index <- \(.data, .var) {
  deparse(
    substitute(.var)
  ) -> .var_string
  which(colnames(.data) == .var_string) -> .index
  if (length(.index) > 0) {
    return(.index)
  } else{
    cli::cli_abort("{.var} is nonexistent.")
  }
}

#' @title Get the name of a variable by its index
#' @description `r lifecycle::badge('stable')`
#'
#' This function returns the name of a variable by its index
#' @param .data data frame
#' @param .index index of a variable
#' @export
get_varname <- \(.data, .index){
  colnames(.data[.index])
}
