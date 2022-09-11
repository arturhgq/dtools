#' @title Clean directory names
#' @description `r lifecycle::badge('experimental')`
#'
#' This function cleans directory names
#' @param .path path
#' @export
clean_dirnames <- \(.path) {
  .path |>
    list.dirs(
      full.names = FALSE,
      recursive = FALSE
    )  -> dirs

  paste0(.path, "/", dirs) -> clean_it

  glue::glue(
    "{dirname(clean_it)}/{clean_strings(basename(clean_it))}"
  ) -> clean_dirs
  file.rename(clean_it, clean_dirs)
}

#' @title Clean file names
#' @description `r lifecycle::badge('experimental')`
#'
#' This function cleans file names
#' @param .path path
#' @export
clean_filenames <- \(.path) {
  .path |>
    list.files(
      full.names = TRUE,
      recursive = TRUE
    ) |>
    purrr::keep(
      stringr::str_detect,
      ".xlsx$") -> files_full

  glue::glue(
    "{dirname(files_full)}/{clean_strings(basename(files_full))}"
  ) -> clean_dirs
  file.rename(files_full, clean_dirs)
}

#' @title Clean string vectors
#' @description `r lifecycle::badge('experimental')`
#'
#' This function cleans up string vectors, removing accents, whitespace, and
#'  transforming characters from uppercase to lowercase.
#' @param .var string vector
#' @param .rm_accent remove accents
#' @param .rm_spaces remove whitespace
#' @export
clean_strings <- \(
  .var,
  .rm_accent = TRUE,
  .rm_spaces = TRUE) {

  if (.rm_accent) {
    stringi::stri_trans_general({{.var}}, "Latin-ASCII") -> .var_
  } else {
    .var -> .var_
  }

  stringr::str_squish(.var_) |>
    tolower() -> string

  if (.rm_spaces) {
    gsub(" ", "_", string)
  } else {
    return(string)
  }
}
