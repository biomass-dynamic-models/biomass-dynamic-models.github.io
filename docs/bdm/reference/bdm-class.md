# Class definition for `bdm` object

This is the primary object class for the bdm package. It inherits from
the
[`stanmodel`](https://mc-stan.org/rstan/reference/stanmodel-class.html)
superclass.

## Usage

``` r
bdm(path, model_code, model_name = "")
```

## Arguments

- path:

  path to stan code

- model_code:

  model code as a character string

- model_name:

  optional model name

## Slots

- `data`:

  a `list` of input data

- `inits`:

  a `list` of initial values

- `chains`:

  the number of chains

- `iter`:

  the number of samples for each chain

- `warmup`:

  the 'burnin' period for each chain

- `thin`:

  the period of sampling from each chain

- `nsamples`:

  the resultant number of samples retained from the sample run

- `trace`:

  `list` holding the processed samples from
  [`extract(..., permuted = TRUE, inc_warmup = FALSE)`](https://mc-stan.org/rstan/reference/stanfit-method-extract.html).

- `trace_array`:

  `array` holding the processed samples from
  [`extract(..., permuted = FALSE, inc_warmup = TRUE)`](https://mc-stan.org/rstan/reference/stanfit-method-extract.html).
  This should rarely be needed for direct access but is used for
  diagnostic plots.

- `pars`:

  `character` vector of estimated parameters.

- `map`:

  list containing the maximum a posterior model fit

- `model_name`:

  `character` string giving the model name.

- `model_code`:

  the model code in the Stan modelling language.

- `model_cpp`:

  translation of Stan code into C++.

- `dso`:

  object of class `cxxdso` holding the compiled C++ code as a dynamic
  shared object.

## Examples

``` r
# initialise default model object
mdl <- bdm()

# inspect Stan model code
```
