#' @title Read delimited files stored in a zip file
#' @description This function reads delimited files stored in a zip file
#' @param x zip file.
#' @param ... [vroom::vroom()] args.
#' @param enconding Set the encoding of the delimited files.
#' @param delim See [vroom::vroom()]
#' @param pattern A regular expression to be matched in the given compressed files character vector.
#' @export
read_delim_zip = function(x, encoding = "latin1", delim = ";", pattern = "", ...){
  files_zip = unzip(x, list=TRUE)[["Name"]]
  files_grep = grep(pattern, files_zip, ignore.case=TRUE, value=TRUE)
  files = unzip(x, files= files_grep, exdir = tempdir())
  data = mapply(
    vroom::vroom,
    files,
    MoreArgs = list(
      locale = vroom::locale(encoding = encoding),
      show_col_types = FALSE,
      delim = delim,
      altrep = TRUE,
      ...
    ),
    SIMPLIFY = FALSE
  )
  if (length(data) == 1) return(data[[1]])
  else return(data)
}
