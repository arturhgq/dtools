#' @title Update documentation, Rmarkdown files and raw data; check, test,
#' build and reinstall the running package locally.
#'
#' @description `r lifecycle::badge('stable')`
#'
#' This function updates documentation, Rmarkdown files and raw data; check, test,
#' build and reinstall the running package locally.
#'
#' @param .update_data Update raw data
#' @param .update_readme Update the README file
#' @param .update_rmd Build Rmarkdown files inside the package
#' @param .update_site Build the pkgdown website
#' @param .check Check the package
#' @param .unit_test Execute \code{testthat} tests
#' @export
update_package <- function(
    .update_data = FALSE,
    .update_readme = FALSE,
    .update_rmd = FALSE,
    .update_site = FALSE,
    .check = FALSE,
    .unit_test = FALSE
) {

  if (.update_data) data_update()
  if (.update_readme) devtools::build_readme()
  if (.update_rmd) devtools::build_rmd()

  devtools::document()

  if(.check) devtools::check() else devtools::build()
  if (.unit_test) devtools::test()
  devtools::install()
  if (.update_site) pkgdown::build_site()

  .rs.restartR()
  rm(list = ls())
}


#' @title Update the raw data of a package
#'
#' @description `r lifecycle::badge('stable')`
#'
#' This function updates the raw data of a package
#' @param ... data
#' @param .from_scratch reads each R script inside \code{.path}
#' @param .path path
#' @export
update_data <- function(.path = "data-raw", .from_scratch, ...) {

  if (missing(.from_scratch)) {
    fs::dir_ls(.path, glob = "*.R") %>%
      purrr::map(source)
  }else{
    usethis::use_data(..., overwrite = TRUE)
  }
  devtools::load_all()
}
