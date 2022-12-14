% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get.R
\name{get_index}
\alias{get_index}
\title{Get the variable's index}
\usage{
get_index(.data, .var)
}
\arguments{
\item{.data}{data frame}

\item{.var}{variable on which index will be returned}
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#stable}{\figure{lifecycle-stable.svg}{options: alt='[Stable]'}}}{\strong{[Stable]}}

This function returns the index of a variable
}
\examples{
get_index(mtcars, cyl)
}
