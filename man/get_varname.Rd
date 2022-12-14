% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get.R
\name{get_varname}
\alias{get_varname}
\title{Get the name of a variable by its index}
\usage{
get_varname(.data, .index)
}
\arguments{
\item{.data}{data frame}

\item{.index}{index of a variable}
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#stable}{\figure{lifecycle-stable.svg}{options: alt='[Stable]'}}}{\strong{[Stable]}}

This function returns the name of a variable by its index
}
\examples{
get_varname(mtcars, 2)
}
