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
    cli::cli_abort(c("x" = "{(.var_string)} is nonexistent."))
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

#' @title Get the names of columns from a data frame
#' @description `r lifecycle::badge('stable')`
#'
#' This function gets the name of each variable in a data frame and stores them
#' in a tibble
#' @param .data data frame
#' @export
get_colnames <- function(.data) {
  tibble::tibble(
    names = names({{.data}})
  )
}

#' @title Get duplicate rows in a data frame
#' @description `r lifecycle::badge('stable')`
#'
#' This function gets duplicate rows in a data frame
#' @param .data data frame
#' @export
get_duplicates <- \(.data) {
  .data[duplicated(.data),] |>
  tibble::as_tibble()
}
