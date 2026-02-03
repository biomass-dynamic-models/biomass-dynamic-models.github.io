# Plot posterior updates from `bdm` model fit

Plots the posterior updates for \\r\\ and \\ln(K)\\.

Depletion is measured as the biomass over the carrying capacity, harvest
rate is the catch over the estimated biomass, and surplus production is
the production function multiplied by the process error residual.

## Usage

``` r
postplot(object, ...)

# S3 method for class 'bdm'
postplot(object, ..., type = "histogram", labels = character())
```

## Arguments

- object:

  `bdm` class object.

- ...:

  additional arguments to the generic function

- type:

  character vector of plot type. Must be one or more of `'histogram'` or
  `'point'`.

- labels:

  character vector of labels for each model run

## Value

Returns a `ggplot` object that can be displayed or assigned and
manuipulated using further arguments from the ggplot2 package.
