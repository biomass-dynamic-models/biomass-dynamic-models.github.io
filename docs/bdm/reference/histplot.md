# Plot posterior histograms

Plots histograms of posterior samples from an MCMC chain contained
within a `bdm` class object.

## Usage

``` r
histplot(object, ...)

# S3 method for class 'bdm'
histplot(
  object,
  pars = c("r", "logK", "lp__"),
  inc_warmup = FALSE,
  nrow = NULL,
  ncol = NULL,
  ...
)
```

## Arguments

- object:

  a `bdm` class object.

- ...:

  optional arguments to
  [`geom_histogram`](https://ggplot2.tidyverse.org/reference/geom_histogram.html)

- pars:

  character vector of model parameters to be plotted. Defaults to
  `pars = c('r','logK','lp__')`.

- inc_warmup:

  logical value indicating whether MCMC warmup should be included in the
  plot.

- nrow:

  passed to
  [`facet_wrap`](https://ggplot2.tidyverse.org/reference/facet_wrap.html)

- ncol:

  passed to
  [`facet_wrap`](https://ggplot2.tidyverse.org/reference/facet_wrap.html)

## Value

Returns a `ggplot` object that can be displayed or assigned and
manuipulated using further arguments from the ggplot2 package.
