#' @title Unite multiple columns into one keeping only unique values
#' @description This function unites multiple columns into one keeping only unique values. 
#' unite_unique is heavily based on tidyr::unite().  
#' @param data A data frame
#' @param col Quoted name of the new column
#' @param ... Quoted columns to unite
#' @param sep Separator to use between values.
#' @param remove If TRUE, remove input columns from output data frame.
#' @param na.rm If TRUE, missing values will be removed prior to uniting each value.
unite_unique = function(data, col, ..., sep = ", ", remove = FALSE, na.rm = TRUE) {
  if (missing(col) | missing(...)) {
    cli::cli_abort("'col' arg and tree-dots must be specified.")
  }
  values = lapply(
    as.data.frame(t(data[, c(...)])), 
    function(x) unique(as.vector(x))
  )
  if (na.rm) {
    values = lapply(values, na.omit)
  }    
  values = sapply(values, function(x) paste(x, collapse = sep), USE.NAMES = FALSE)
  
  values[values == ""] <- NA_character_
  
  data[[col]] <- values
  
  if (remove) data[,!names(data) %in% c(...)]
  else return(data)
}
