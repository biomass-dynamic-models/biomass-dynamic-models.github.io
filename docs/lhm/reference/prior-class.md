# Class containing a prior distribution derived from life-history data

This is an S4 object class that includes both a numeric vector for
storage of derived values generated using Monte Carlo methods, such as
the intrinsic growth rate \\r\\, and a list of parameters describing the
associated parameteric distribution. Currently only a log-normal
distribution is supported.

If `length(x) > 1` then the function creates an object containing values
of `x`, otherwise it creates a vector of zero's of length equal to `x`.

For example, values for \\r\\ can be simulated directly or generated
using the
[`rCalc`](https://github.com/biomass-dynamic-models/lhm/reference/rCalc.md)
function. The class contains an additional slot to hold parameters of
the log-normal distribution, which is used by `bdm` to describe the
prior for \\r\\.

## Usage

``` r
prior(x, ...)
```

## Arguments

- x:

  either an integer specifiying the length of an empty vector or a
  vector of derived values

- ...:

  additional arguments to generic function

## Slots

- `.Data`:

  numeric vector of derived values

- `lognormal_par`:

  log-normal distribution parameter values

## Examples

``` r
# create object containing
# vector of r values
iter <- 100
mu <- 0.1
cv <- 0.2
sd <- sqrt(log(1+cv^2))
x <- rlnorm(iter,log(mu)-sd^2/2,sd)
r <- prior(x)
```
