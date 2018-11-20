
## Convenience Access to Wikipedia Dump Databases

**Status**

*lines of R code:* 126, *lines of test code:* 0

[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
<a href="https://travis-ci.org/petermeissner/wpdaccess"><img src="https://api.travis-ci.org/petermeissner/wpdaccess.svg?branch=master"><a/>
<!--<a href="https://cran.r-project.org/package=wpdaccess"><img src="http://www.r-pkg.org/badges/version/wpdaccess"></a>
[![cran checks](https://cranchecks.info/badges/summary/reshape)](https://cran.r-project.org/web/checks/check_results_reshape.html)
<a href="https://codecov.io/gh/petermeissner/wpdaccess"><img src="https://codecov.io/gh/petermeissner/wpdaccess/branch/master/graph/badge.svg" alt="Codecov" /></a>
<img src="http://cranlogs.r-pkg.org/badges/grand-total/wpdaccess">
<img src="http://cranlogs.r-pkg.org/badges/wpdaccess">
-->

**Development version**

0.1.0 - 2018-11-20 / 23:30:17

**Description**

This package allows to query wikipedia dump data bases. Via functions:
`wpd_get_exact()` and `wpd_get_search()`.

**License**

    ## MIT + file LICENSE
    ## c(
    ##     person(
    ##       "Peter", 
    ##       "Meissner", 
    ##       role  = c("aut", "cre"),
    ##       email = "retep.meissner@gmail.com"
    ##     ),
    ##     person(
    ##       "Simon", 
    ##       "Munzert", 
    ##       role  = c("cph"),
    ##       email = "simon.munzert@gmail.com"
    ##     )
    ##   )

**Citation**

``` r
citation("wpdaccess")
```

**BibTex for citing**

``` r
toBibtex(citation("wpdaccess"))
```

## Installation

**Installation and start - development version**

``` r
devtools::install_github("petermeissner/wpdaccess")
library(wpdaccess)
```

## Usage

``` r
?wpd_get_exact
```
