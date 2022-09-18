#' @title  Fill merged Excel cells down
#' @description `r lifecycle::badge('stable')`
#'
#' This function fills merged Excel cells down
#' @param  ... One or more Excel sheets with merged cells
#' @export
fill_merged_cells <- function(...) {
  rlang::enquos(...) -> .data_enquos
  length(.data_enquos) -> .data_length
  purrr::map(.data_enquos, rlang::as_label) -> .data_names

  rlang::list2(...) |>
    purrr::map(
      ~ .x |>
        tidyr::fill(
          dplyr::everything(),
          .direction = "down"
        )
    ) |>
    purrr::set_names(.data_names) -> .data_list

  if (.data_length == 1) {
    .data_list[[1]]
  } else {
    .data_list
  }
}
