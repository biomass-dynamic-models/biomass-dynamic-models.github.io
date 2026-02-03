# Fit `bdm` model

Execute a Bayesian model fit using rstan.

By default a Bayesian fit is executed through a call to
[`sampling`](https://mc-stan.org/rstan/reference/stanmodel-method-sampling.html),
which implements an MCMC algorithm. Default values for `chains`, `iter`,
`warmup` and `thin` follow those for rstan.

The `init` argument can be a `list`, `function` or `character` string.
If it is a function then it should take no arguments and return a named
list of intial values for the estimated parameters. Alternatively the
list can be specified directly. This behaviour matches that for
[`sampling`](https://mc-stan.org/rstan/reference/stanmodel-method-sampling.html).
If a character string is supplied it should be either `'random'` or
`'fixed'`. If the model is the default model and `init = 'fixed'` then
sensible starting values for `r`, `logK` and `x` are produced using
[`getr`](https://github.com/biomass-dynamic-models/bdm/reference/getr.md),
[`getlogK`](https://github.com/biomass-dynamic-models/bdm/reference/getlogK.md)
and
[`getx`](https://github.com/biomass-dynamic-models/bdm/reference/getx.md).
If the model is the default model and `init = 'random'` then sensible
starting values are obtained by sampling from the priors for
`r, logK, x`. If the model is not the default model, then the user
should specify a function or list, otherwise starting values will be
randomly generated.

## Usage

``` r
sampler(object, ...)

# S4 method for class 'bdm'
sampler(
  object,
  data = list(),
  run = character(),
  init,
  chains,
  iter,
  warmup,
  thin,
  ...
)
```

## Arguments

- object:

  a `bdm` model object

- ...:

  further arguments to
  [`sampling`](https://mc-stan.org/rstan/reference/stanmodel-method-sampling.html)

- data:

  a `list` object containing the model inputs

- run:

  optional character vector to label the run

- init:

  an initialisation `list`, `function` or `character` string

- chains:

  number of MCMC chains

- iter:

  number of iterations per chain

- warmup:

  number of iterations to be discarded

- thin:

  sampling interval from chains

## Value

Returns a `bdm` object containing posterior samples contained in
`object@trace`.

## Examples

``` r
# get some data
data(albio)
dat <- bdmData(harvest = albio$catch, index = albio$cpue, time = albio$year)

# initialize and fit default model
if (FALSE) { # \dontrun{
mdl <- bdm()
mdl <- compiler(mdl)
mdl <- sampler(mdl, dat)
} # }
```
