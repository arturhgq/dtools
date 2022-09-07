#' @title Collapse a data frame using group variables
#' @description `r lifecycle::badge('stable')`
#'
#' This function collapses a data frame using group variables
#' @param .data data frame
#' @param ... group variables
#' @note When data is collapsed, missing values are excluded.
#' @export
collapse_duplicates <- \(.data, ...){
  .data |>
    purrr::when(
      "grouped_df" %in% class(.data) ~
        dplyr::ungroup(.),
      ~ .
    ) |>
    make_all_character() |>
    dplyr::group_by(...) |>
    dplyr::mutate(
      dplyr::across(
        .cols = dplyr::everything(),
        ~ dplyr::case_when(
          length(unique(.x)) == 1 & dplyr::row_number() != 1 ~ NA_character_,
          TRUE ~ .x
        )
      )
    ) |>
    dplyr::summarise(
      dplyr::across(
        .cols = dplyr::everything(),
        ~ paste0(unique(na.omit(.x)), collapse = "; ") |>
          dplyr::na_if("")
      ),
      .groups = "drop"
    )
}
