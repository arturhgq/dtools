#' @title Read delimited files stored in a zip file
#' @description This function reads delimited files stored in a zip file
#' @param x zip file.
#' @param enconding Set the encoding of the delimited files.
#' @param delim See [vroom::vroom()]
#' @param pattern A regular expression to be matched in the given compressed files character vector.
#' @export
read_delim_zip = function(x, encoding = "latin1", delim = NULL, pattern = ""){
  files = unzip(x, exdir = tempdir())
  files = grep(pattern, files, value = TRUE)
  data = mapply(
    vroom::vroom,
    files,
    MoreArgs = list(
      locale = vroom::locale(encoding = encoding),
      show_col_types = FALSE,
      delim = delim
    ),
    SIMPLIFY = FALSE
  )
  if (length(data) == 1) return(data[[1]])
  else return(data)
}
