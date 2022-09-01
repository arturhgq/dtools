
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dtools

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/dtools)](https://CRAN.R-project.org/package=dtools)
[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
[![R-CMD-check](https://github.com/arturhgq/dtools/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/arturhgq/dtools/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/arturhgq/dtools/branch/master/graph/badge.svg)](https://app.codecov.io/gh/arturhgq/dtools?branch=master)

<!-- badges: end -->

The goal of `dtools` is to provide useful tools to make data analysis
faster and easier.

## Installation

You can install the development version of tools like so:

``` r
remotes::install_github("arturhgq/dtools")
```

## Examples

### Check

``` r
library(dtools)

check_r_pipe(T)
#> ℹ This R version contain the native pipe.
#> ℹ R version: 4.2.1
```

### Get

``` r
get_index(mtcars, cyl)
#> [1] 2
get_varname(mtcars, 2)
#> [1] "cyl"
```
