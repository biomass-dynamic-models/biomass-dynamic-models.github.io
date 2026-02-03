# Compile stan model code in `bdm` object

This function calls
[`stan_model`](https://mc-stan.org/rstan/reference/stan_model.html) to
compile the model.

## Usage

``` r
compiler(object, ...)

# S4 method for class 'bdm'
compiler(object, ...)
```

## Arguments

- object:

  a `bdm` class object that contains the model code in
  `object@model_code`

- ...:

  additional arguments to `stan_model`

## Value

A `bdm` class object with a compiled DSO in `object@dso`.

## Examples

``` r
library(bdm)

# initialise default model object
mdl <- bdm()

# compile Stan model code
if (FALSE) { # \dontrun{
mdl <- compiler(mdl)
} # }
```
