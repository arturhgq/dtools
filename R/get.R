#' @title Get the variable's index
#' @description `r lifecycle::badge('stable')`
#'
#' This function returns the index of a variable
#' @param .data data frame
#' @param .var variable on which index will be returned
#' @examples
#' get_index(mtcars, cyl)
#' @export
get_index <- function(.data, .var) {
  .var_string = deparse(substitute(.var))
  .index = which(colnames(.data) == .var_string)
  if (length(.index) > 0) {
    return(.index)
  } else{
    NA
  }
}

#' @title Get the name of a variable by its index
#' @description `r lifecycle::badge('stable')`
#'
#' This function returns the name of a variable by its index
#' @param .data data frame
#' @param .index index of a variable
#' @examples
#' get_varname(mtcars, 2)
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
#' @examples
#' data.frame(
#'    var1 = c(1,1,1,1),
#'    var2 = c(2,2,2,3)
#' ) -> data
#'
#'  get_duplicates(data)
#' @export
get_duplicates <- \(.data) {
  .data[duplicated(.data),] |>
  tibble::as_tibble()
}
