# Extract an initial value for the carrying capacity

This function can be applied to a `list` or `bdmData` object to provide
a rough estimate of \\ln(K)\\. It should rarely be required by the user.
Rather, it is designed to be used as part of the initialisation of a
model fit using
[`sampler`](https://github.com/biomass-dynamic-models/bdm/reference/sampler.md).

## Usage

``` r
getlogK(object, ...)

# S3 method for class 'bdm'
getlogK(object, ...)

# S3 method for class 'bdmData'
getlogK(object, r, interval, ...)
```

## Arguments

- object:

  either a `bdm` class object or a `list` object containing the elements
  `index` (an array) and `harvest` (a vector)

- ...:

  additional arguments to generic function

- r:

  an assumed value for the intrinsic growth rate \\r\\

- interval:

  vector containing minimum and maximum values for \\ln(K)\\ over which
  grid search is performed.

## Details

When applied to `bdm` class object, this function uses regual
expresssion matching to extract the interval for \\ln(K)\\ from the the
model code. A value for \\r\\ is similarly extracted using
[`getr`](https://github.com/biomass-dynamic-models/bdm/reference/getr.md).
It then assumes a logistic production function and applies a grid search
over the interval for \\ln(K)\\, using a least-squares measure of fit.

The function can also be applied to a `bdmData` object, in which case a
value for \\r\\ and the search interval must be provided. A value for
\\r\\ would usually be obtained through a call to
[`rCalc`](https://github.com/biomass-dynamic-models/lhm/reference/rCalc.html)
in the lhm package.

## Examples

``` r
# get some data
data(albio)
dat <- bdmData(harvest = albio$catch, index = albio$cpue, time = albio$year)

# default model
mdl <- bdm()

# extract logK from
# bdm object
getlogK(mdl)
#> $`E[logK]`
#> NULL
#> 
#> $`min[logK]`
#> [1] 1
#> 
#> $`max[logK]`
#> [1] 12
#> 

# extract with data
mdl@data <- dat
getlogK(mdl)
#> $`E[logK]`
#> [1] 5.371371
#> 
#> $`min[logK]`
#> [1] 1
#> 
#> $`max[logK]`
#> [1] 12
#> 

# calculate logK from
# catches and assumed r
getlogK(dat, r = getr(mdl)$`E[r]`, interval = c(1, 12))
#> [1] 5.371371
```
