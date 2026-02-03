# Survivorship accessor function

This function can be used to access the survivorship at age contained
within a `lhm` object. The survivorship is calculated following an
assignment of the natural mortality (using
[`nmort`](https://github.com/biomass-dynamic-models/lhm/reference/nmort.md))
and assumed to be one for the first age class.

## Usage

``` r
survivorship(object, ...)

# S4 method for class 'lhm'
survivorship(object)
```

## Arguments

- object:

  a `lhm` class object

- ...:

  arguments to generic function

## Examples

``` r
# M at age vector input
dat <- lhm(ainf = 10,iter=1)
nmort(dat) <- c(0.1,0.1,0.2)
nmort(dat)
#>       [,1]
#>  [1,]  0.1
#>  [2,]  0.1
#>  [3,]  0.2
#>  [4,]  0.2
#>  [5,]  0.2
#>  [6,]  0.2
#>  [7,]  0.2
#>  [8,]  0.2
#>  [9,]  0.2
#> [10,]  0.2

# extract survivorship
survivorship(dat)
#>            [,1]
#>  [1,] 1.0000000
#>  [2,] 0.9048374
#>  [3,] 0.8187308
#>  [4,] 0.6703200
#>  [5,] 0.5488116
#>  [6,] 0.4493290
#>  [7,] 0.3678794
#>  [8,] 0.3011942
#>  [9,] 0.2465970
#> [10,] 0.2018965
```
