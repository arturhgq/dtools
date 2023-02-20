#' @title Download a set of files from the internet
#' @description This function downloads a set of files from the internet.
#' The result is a named list with the tempfile path of each downloaded file.
#' @param x A character vector of urls.
#' @export
download.files = function(x) {
  make = function(x) {
    tempfile = tempfile()
    httr::GET(
      x,
      httr::write_disk(path = tempfile, overwrite = TRUE),
      httr::progress()
    )
    return(tempfile)
  }
  files = sapply(x, make, simplify = F)
  return(files)
}
