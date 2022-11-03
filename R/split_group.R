#' @title Split data frame by groups
#' @description `r lifecycle::badge("stable")`
#'
#' This function splits data frames by groups and returns a list of data frames
#' @param data A dataframe
#' @param ... group variables
#' @references
#' https://github.com/markfairbanks/tidytable
#' @examples
#' split_group(mtcars, vs, am)
#' @export
split_group = function(data, ...) {
  by_quote = as.list(substitute(...()))
  by = sapply(by_quote, deparse)

  split = vctrs::vec_split(data, data[c(by)])
  out = split[["val"]]
  names = do.call(paste, c(split[["key"]], sep = "_"))
  names(out) = names

  return(out)
}
