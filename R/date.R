#' @title Convert years into decades
#' @description `r lifecycle::badge("stable")`
#'
#' Returns a vector by grouping a string of years into decades
#' @param year numeric variable of years
#' @param method 'gregorian' or 'ISO'
#' @examples
#' as_decade(c(2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011))
#' as_decade(c(2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011), method = "ISO")
#' @export
as_decade = function(year, method = "gregorian") {
  if (!is.numeric(year)) {
    cli::cli_abort("'year' must be numeric.")
  }
  subtract_one = function(x) {
    if (!is.integer(x/10)) x - 1
    else x
  }

  if (method == "gregorian") {
    year_fix = sapply(year, subtract_one)
    floor(year_fix/10)*10

  } else if (method == "ISO") {
    floor(year/10)*10

  } else {
    cli::cli_abort("'method' must be 'gregorian' or 'ISO'.")
  }


}
