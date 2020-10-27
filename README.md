
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ratetest

<!-- badges: start -->
<!-- badges: end -->

The goal of **ratetest** is to test if the rate of a event in two groups
is significantly different, also calculating the 95% confidence interval
with an exact poisson distribution

## Installation

You can install the released version of ratetest from GitHub with:

``` r
install.packages("ratetest")
```

## Example

``` r
library(ratetest)

rate_test(5,8,182.8,165.1)
#> # A tibble: 3 x 5
#>   var    rate lower upper p.value  
#>   <chr> <dbl> <dbl> <dbl> <chr>    
#> 1 tot    3.74 1.99   6.39 ""       
#> 2 a      2.74 0.888  6.38 ""       
#> 3 b      4.85 2.09   9.55 "0.46007"
```
