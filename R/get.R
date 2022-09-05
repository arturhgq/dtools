#' @title Get the variable's index
#' @description `r lifecycle::badge('stable')`
#'
#' This function returns the index of a variable
#' @param .data data frame
#' @param .var variable on which index will be returned
#' @export
get_index <- function(.data, .var) {
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

#' @title Get the name of each variable in a data frame
#' @description `r lifecycle::badge('stable')`
#'
#' This function gests the name of each variable in a data frame
#' @param .data data frame
#' @export
get_colnames <- function(.data) {
  tibble::tibble(
    names = names({{.data}})
  )
}
