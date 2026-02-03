# Convert a `stanfit` object into a `bdm` object

Useful for producing plots with the bdm package functions such as
[`histplot`](https://github.com/biomass-dynamic-models/bdm/reference/histplot.md)

## Usage

``` r
as.bdm(object, ...)

# S3 method for class 'stanfit'
as.bdm(object, ...)
```

## Arguments

- object:

  [`stanfit`](https://mc-stan.org/rstan/reference/stanfit-class.html)
  class object.

- ...:

  additional arguments to the generic function

## Value

Returns a `bdm` object containing MCMC outputs
