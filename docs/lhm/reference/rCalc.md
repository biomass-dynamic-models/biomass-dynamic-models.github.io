# Calculate the intrinsic growth rate

A value for the intrinsic growth rate \\r\\ is calculated using
life-history data as a numerical solution to the Euler-Lotka equation.

## Usage

``` r
rCalc(.Object, ...)

# S4 method for class 'lhm'
rCalc(.Object)

# S4 method for class 'lhmIter'
rCalc(.Object)
```

## Arguments

- .Object:

  an `lhm` object

- ...:

  additional arguments to generic function

## Value

A
[`prior`](https://github.com/biomass-dynamic-models/lhm/reference/prior-class.md)
class object containing a vector of values for \\r\\.

## Examples

``` r
# initialise lhm object
ainf <- 100
iter <- 1
rdat <- lhm(ainf,iter)

# assign life-history data
nmort(rdat)    <- list(mu = 0.18)
size(rdat)     <- list(mu = list(Linf = 106.5, k = 0.229, t0 = 0.01)) 
mass(rdat)     <- list(mu = list(a = 1.7e-9, b = 3.328))
sr(rdat)       <- list(type = 'BH', mu= 0.9)
maturity(rdat) <- list(mu = list(acrit = 8))

# calculate r
r <- rCalc(rdat)
```
