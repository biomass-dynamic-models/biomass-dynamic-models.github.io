# Plot index and harvest data

This function provides a `plot` method for the `bdmData` object class.
It returns a `ggplot` object that can be assigned and manipulated using
functions provided by ggplot2.

## Usage

``` r
# S3 method for class 'bdmData'
plot(x, ...)
```

## Arguments

- x:

  an
  [`bdmData`](https://github.com/biomass-dynamic-models/bdm/reference/bdmData-class.md)
  object class

- ...:

  required by the generic function

## Examples

``` r
# load Indian Ocean albacore data
data(albio)

# create bdmData object
dat <- bdmData(harvest = albio$catch, index = albio$cpue, time = albio$year)

# plot
plot(dat)
#> Warning: no non-missing arguments to min; returning Inf
#> Warning: no non-missing arguments to max; returning -Inf

```
