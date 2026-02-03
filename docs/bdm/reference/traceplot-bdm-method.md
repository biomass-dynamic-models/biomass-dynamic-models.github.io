# Traceplot for MCMC output

Plots the trace outputs from an MCMC run implemented using
[`sampler`](https://github.com/biomass-dynamic-models/bdm/reference/sampler.md).

This function uses the S4 generic
[`traceplot`](https://mc-stan.org/rstan/reference/stanfit-method-traceplot.html)
provided by rstan.

## Usage

``` r
# S4 method for class 'bdm'
traceplot(
  object,
  pars = c("r", "logK", "lp__"),
  inc_warmup = TRUE,
  nrow = NULL,
  ncol = NULL,
  ...
)
```

## Arguments

- object:

  a `bdm` object

- pars:

  parameters to be plotted

- inc_warmup:

  logical value indicating whether the warmup values should be included

- nrow:

  passed to
  [`facet_wrap`](https://ggplot2.tidyverse.org/reference/facet_wrap.html)

- ncol:

  passed to
  [`facet_wrap`](https://ggplot2.tidyverse.org/reference/facet_wrap.html)

- ...:

  optional arguments to
  [`geom_line`](https://ggplot2.tidyverse.org/reference/geom_path.html)

## Value

Returns a `ggplot` object that can be displayed or assigned and
manipulated using further arguments from the ggplot2 package.
