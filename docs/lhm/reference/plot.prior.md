# Plot prior distribution

This function provides a simple `plot` method for the `prior` object
class.

## Usage

``` r
# S3 method for class 'prior'
plot(x, ...)
```

## Arguments

- x:

  an
  [`prior`](https://github.com/biomass-dynamic-models/lhm/reference/prior-class.md)
  object class

- ...:

  additional arguments for
  [`hist`](https://rdrr.io/r/graphics/hist.html)

## Examples

``` r
# create object containing
# vector of r values
iter <- 1000
mu <- 0.1
cv <- 0.2
sd <- sqrt(log(1+cv^2))
x <- rlnorm(iter,log(mu)-sd^2/2,sd)
r <- prior(x)

# plot
if (FALSE) { # \dontrun{
plot(r, xlab = 'r', ylab = '', yaxt = 'n', main = '')
} # }
```
