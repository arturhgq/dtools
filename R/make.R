#' @title Make all data frame variables character
#' @description `r lifecycle::badge('deprecated')`
#'
#' This function makes all data frame variables character
#' @param ... A single data frame or a list of data frames
#' @export
make_all_character = function(...) {
  
  lifecycle::deprecate_warn(
    when = "0.0.1",
    what = "make_all_character()",
    details = "Use `dtools::make_all_vars_char()` instead."
  )
  
  rlang::enquos(...) -> data_enquos
  length(data_enquos) -> data_length
  purrr::map(data_enquos, rlang::as_label) -> data_names
  
  rlang::list2(...) |>
    purrr::map(
      ~ .x |>
        dplyr::mutate(
          dplyr::across(
            .cols = dplyr::everything(),
            as.character
          )
        ) |>
        tibble::as_tibble()
    ) |>
    purrr::set_names(data_names) -> data_list
  
  if (data_length == 1) data_list[[1]]
  else data_list
}


#' @title Transform every dataframe variable class into character
#' @description `r lifecycle::badge('stable')`
#'
#' This function transforms every dataframe variable class into character within a list of dataframes
#' @param ... a list of data frames
#' @export
make_all_vars_char = function(list, ...) {
  if (class(list) != "list") {
    cli::cli_abort("You must use a list of dataframes. Try `make_all_vars_char(list(df_name = dataframe))`")
  }
  for (data in 1:length(list)) {
    for (var in names(list[[data]])) {
        list[[data]][[var]] = as.character(list[[data]][[var]])
    }
  }
  return(list)
}

#' @title Transform dataframe variable class into character
#' @description `r lifecycle::badge('stable')`
#'
#' This function transforms dataframe variable class into character within a list of dataframes
#' @param ... a list of data frames
#' @export
make_vars_char = function(list, ...) {
  if (class(list) != "list") {
    cli::cli_abort("You must use a list of dataframes.")
  }
  vars = c(...)
  for (data in 1:length(list)) {
    for (var in names(list[[data]])) {
      if(any(vars == var)) {
        list[[data]][[var]] = as.character(list[[data]][[var]])
      }
    }
  }
  return(list)
}

