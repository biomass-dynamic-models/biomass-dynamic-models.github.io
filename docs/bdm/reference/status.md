# Extract status and reference point estimates

These functions can be used to extract output values following a model
fit. The `status` function will look for and return model elements
`current_biomass`, `current_depletion` and `current_harvest_rate`. The
`refpoints` function will look for and return model elements `msy`,
`depletion_at_msy`, `biomass_at_msy` and `harvest_rate_at_msy`. These
are returned by the default bdm model, but the function will also work
if a user-specified model contains potentially different elements in the
`'generated quantities {}'` block of the code, as long as they are
specified in the `pars` argument.

## Usage

``` r
status(object, ...)

# S4 method for class 'bdm'
status(object, pars)

refpoints(object, ...)

# S4 method for class 'bdm'
refpoints(object, pars)
```

## Arguments

- object:

  a `bdm` model object

- ...:

  additional arguments to the generic function

- pars:

  a `character` vector specifiying the parameters to be returned

## Value

Returns a `list` containing the specified elements, each of which is a
vector equal to the number of posterior samples.

## Examples

``` r
data(albio)
dat <- bdmData(harvest = albio$catch, index = albio$cpue, time = rownames(albio))

if (FALSE) { # \dontrun{
# initialize and fit default model
mdl <- bdm()
mdl <- compiler(mdl)
mdl <- sampler(mdl, dat)

# get median status estimates
lapply(status(mdl), median)

# get median reference point estimates
lapply(refpoints(mdl), median)
} # }
```
