#' @title Make all data frame variables character
#' @description `r lifecycle::badge('stable')`
#'
#' This function makes all data frame variables character
#' @param ... A single data frame or a list of data frames
#' @export
make_all_character <- \(...) {

  rlang::enquos(...) -> .data_enquos
  length(.data_enquos) -> .data_length
  purrr::map(.data_enquos, rlang::as_label) -> .data_names

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
    purrr::set_names(.data_names) -> .data_list

  if (.data_length == 1) {
    .data_list |>
      purrr::pluck(1)
  } else {
    .data_list
  }
}
