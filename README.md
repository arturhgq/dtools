
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

## Fill

``` r
  data.frame(
    var1 = c(NA,2,3,NA),
    var2 = c(NA,NA,3,3),
    var3 = c(NA,1,3,3),
    var4 = c(10,NA, 2,NA),
    group = c(1,1,2,2)
  ) -> data

  fill_by_group(data, group, var1, var3)
#> # A tibble: 4 × 5
#>    var1  var2  var3  var4 group
#>   <dbl> <dbl> <dbl> <dbl> <dbl>
#> 1     2    NA     1    10     1
#> 2     2    NA     1    NA     1
#> 3     3     3     3     2     2
#> 4     3     3     3    NA     2
```

## List

``` r
  here::here("R") |> 
    list_files(".R")
#> $check.R
#> [1] "/home/arturhgq/Desktop/dtools/R/check.R"
#> 
#> $`dtools-package.R`
#> [1] "/home/arturhgq/Desktop/dtools/R/dtools-package.R"
#> 
#> $fill.R
#> [1] "/home/arturhgq/Desktop/dtools/R/fill.R"
#> 
#> $get.R
#> [1] "/home/arturhgq/Desktop/dtools/R/get.R"
#> 
#> $list.R
#> [1] "/home/arturhgq/Desktop/dtools/R/list.R"
#> 
#> $update.R
#> [1] "/home/arturhgq/Desktop/dtools/R/update.R"
#> 
#> $zzz.R
#> [1] "/home/arturhgq/Desktop/dtools/R/zzz.R"
```

``` r
  list(
    obj1 = mtcars,
    obj2 = airmiles
  ) -> list1
  
    list(
    mtcars,
    airmiles
  ) -> list2
```

``` r
list_remove(list1, "obj1")
#> $obj2
#> Time Series:
#> Start = 1937 
#> End = 1960 
#> Frequency = 1 
#>  [1]   412   480   683  1052  1385  1418  1634  2178  3362  5948  6109  5981
#> [13]  6753  8003 10566 12528 14760 16769 19819 22362 25340 25343 29269 30514
```

``` r
list_remove(list2, 1)
#> [[1]]
#> Time Series:
#> Start = 1937 
#> End = 1960 
#> Frequency = 1 
#>  [1]   412   480   683  1052  1385  1418  1634  2178  3362  5948  6109  5981
#> [13]  6753  8003 10566 12528 14760 16769 19819 22362 25340 25343 29269 30514
```
