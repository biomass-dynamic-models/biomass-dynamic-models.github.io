# Estimate an initial vector of depletion values

This function can be applied to a `list` or `bdmData` object to provide
a rough estimate of the depletion time series \\x\\.

This function assumes a logistic production function and uses input
values for the intrinsic growth and carrying capacity. These would
usually be obtained through calls to
[`rCalc`](https://github.com/biomass-dynamic-models/lhm/reference/rCalc.html)
in the lhm package and
[`getlogK`](https://github.com/biomass-dynamic-models/bdm/reference/getlogK.md).

## Usage

``` r
getx(object, ...)

# S3 method for class 'bdm'
getx(object, ...)

# S3 method for class 'list'
getx(object, r, logK, ...)
```

## Arguments

- object:

  either a `bdm` class object or a `list` object containing a `harvest`
  vector

- ...:

  additional arguments to generic function

- r:

  an assumed value for the intrinsic growth rate \\r\\

- logK:

  an assumed value for the carrying capacity \\ln(K)\\

## Examples

``` r
# get some data
data(albio)
dat <- bdmData(harvest = albio$catch, index = albio$cpue, time = rownames(albio))

# default model
mdl <- bdm()

# extract depletion from
# bdm object
getx(mdl)
#> $`E[x]`
#> NULL
#> 

# extract with data
mdl@data <- dat
getx(mdl)
#> $`E[x]`
#>  [1] 1.0000000 0.9261007 0.8323391 0.7522531 0.7120474 0.6728058 0.6006560
#>  [8] 0.5596146 0.5605478 0.5716640 0.5738626 0.5652514 0.5501181 0.5384287
#> [15] 0.5271278 0.5109924 0.4695252 0.4960767 0.5285484 0.4900741 0.4230526
#> [22] 0.3403675 0.3042546
#> 

# calculate depletion from
# catches and assumed parameters
getx(dat, logK = 6, r = exp(-1))
#>  [1] 1.0000000 0.9605878 0.9108114 0.8700513 0.8528981 0.8370845 0.8047113
#>  [8] 0.7926231 0.8042606 0.8187961 0.8255381 0.8249809 0.8208389 0.8191682
#> [15] 0.8178908 0.8141863 0.7977099 0.8213802 0.8426340 0.8210190 0.7893129
#> [22] 0.7575373 0.7609077
```
