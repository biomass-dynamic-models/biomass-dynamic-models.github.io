# Plot estimated dynamics from `bdm` model fit

Plots the dynamics over time of the estimated biomass, depletion,
harvest rate or surplus production.

## Usage

``` r
dynplot(object, ...)

# S3 method for class 'bdm'
dynplot(object, ..., pars = "depletion", labels = character())
```

## Arguments

- object:

  `bdm` class object.

- ...:

  additional `bdm` class objects

- pars:

  character vector of model parameters to be plotted. Must be one or
  more of `'depletion'`, `'biomass'`, `'harvest_rate'` or
  `'surplus_production'`.

- labels:

  character vector of labels per model run

## Value

Returns a `ggplot` object that can be displayed or assigned and
manuipulated using further arguments from the ggplot2 package. The
plotted dynamics are summarised as the median and the 75th and 95th
percentiles. The posterior mean is shown as a dashed line.

## Details

Depletion is measured as the biomass over the carrying capacity, harvest
rate is the catch over the estimated biomass, and surplus production is
the production function multiplied by the process error residual.
Multiple model runs can be provided, in which case the are superimposed.
