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
#' @param x string vector
#' @param .toupper keeping uppercase characters
#' @param .rm_special_char remove special characters 
#' @param .rm_accent remove accents
#' @param .rm_spaces remove whitespace
#' @export
clean_string = function( 
  x,
  .toupper = FALSE,
  .rm_special_char = TRUE,
  .rm_accent = TRUE,
  .rm_spaces = TRUE) {
  
  if (.rm_accent) x_ascii = stringi::stri_trans_general(x, "Latin-ASCII")
  else x_ascii = x
  
  if(.rm_special_char) x_alnum = gsub("[^A-Za-z0-9 ]", "", x_ascii)
  else x_alnum = x_ascii

  if (.toupper) x_space = toupper(gsub("\\s+"," ", trimws(x_alnum))) 
  else x_space = tolower(gsub("\\s+"," ", trimws(x_alnum))) 
  
  if (.rm_spaces) rm_underscore = gsub(" ", "_", x_space)
  else rm_underscore = x_space
  
  return(rm_underscore)
}

#' @rdname clean_string
#' @export
clean_strings = function( 
  x,
  .toupper = FALSE,
  .keep_alnum = TRUE,
  .rm_accent = TRUE,
  .rm_spaces = TRUE) {
  
  if (.rm_accent) x_ascii = stringi::stri_trans_general(x, "Latin-ASCII")
  else x_ascii = x
  
  if(.rm_special_char) x_alnum = gsub("[^A-Za-z0-9 ]", "", x_ascii)
  else x_alnum = x_ascii

  if (.toupper) x_space = toupper(gsub("\\s+"," ", trimws(x_alnum))) 
  else x_space = tolower(gsub("\\s+"," ", trimws(x_alnum))) 
  
  if (.rm_spaces) rm_underscore = gsub(" ", "_", x_space)
  else rm_underscore = x_space
  
  return(rm_underscore)
}
