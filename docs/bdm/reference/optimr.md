# Obtain a point estimate by maximizing the joint posterior

Execute a Bayesian (MAP) model fit using
[`optimizing`](https://mc-stan.org/rstan/reference/stanmodel-method-optimizing.html).

## Usage

``` r
optimr(object, ...)

# S4 method for class 'bdm'
optimr(object, data = list(), run = character(), init = "random", ...)
```

## Arguments

- object:

  compiled `bdm` class object

- ...:

  arguments to generic function (not used)

- data:

  a `list` object containing the model inputs

- run:

  optional character vector to label the run

- init:

  an initialisation `list`, `function` or `character` string

## Value

Returns a `bdm` object containing MAP estimates.

## See also

\[compiler()\],
[`optimizing`](https://mc-stan.org/rstan/reference/stanmodel-method-optimizing.html)

## Examples

``` r
# get some data
data(albio)
dat <- bdmData(harvest = albio$catch, index = albio$cpue, time = albio$year)

# initialize and fit default model
if (FALSE) { # \dontrun{
mdl <- bdm()
mdl <- compiler(mdl)
mdl <- optimr(mdl, dat)
} # }
```
