#' @title Rename columns in a list of dataframes
#' @description `r lifecycle::badge('stable')`
#'
#' This function renames columns in a list of dataframes.
#' @param list list of data frames
#' @param ... new_name = "old_name"
#' @export
rename_all <- function(list, ...) {

  if (is.data.frame(list)) {
    cli::cli_abort(
      "'rename_all()' is applied to a list of dataframes. Try `list(data1, data2)` instead."
    )
  }
  index = 1
  ilist = 1
  results = list()
  dots_args = c(...)
  for (i in list) {
    for(j in 1:length(dots_args)){
      check_var = NULL
      check_var[index] = do.call("check_var", list(i, str2lang(dots_args[[j]])))
      colnames(i)[colnames(i) == dots_args[[j]]] <- names(dots_args)[[j]]
      index = index + 1
    }
  results[[ilist]] <- i
    ilist = ilist + 1
  }
  if (!is.null(names(list))) {
    names(results) <- names(list)
  }
  return(results)
}








