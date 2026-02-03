# Projection function

This function can be used to project the default bdm model forward in
time assuming a constant catch (harvest) or harvest rate. Multiple
alternative scenarios can be run simultaneously.

Model parameter values are sampled from the joint posterior distribution
and a projection is performed for each sample. A correlated random walk
of process error terms is assumed during the projection.

## Usage

``` r
project(object, harvest_project, ...)

# S4 method for class 'bdm,vector'
project(object, harvest_project, time_project, harvest_rate = TRUE)
```

## Arguments

- object:

  a `bdm` class object containing a fit to the default model

- harvest_project:

  a constant harvest or harvest rate as a vector across alternative
  scenarios

- ...:

  arguments to generic function (not used)

- time_project:

  number of time steps for future projection

- harvest_rate:

  a `logical` value indicating whether or not `harvest_project` refers
  to the harvest (catch) or harvest rate (catch over biomass)

## Value

Returns a `list` containing the elements:

- `run`:

  optional run label that will match the corresponding `object@run`

- `scenarios`:

  vector of harvest or harvest rate scenarios

- `time`:

  complete series of time step labels

- `nsamples`:

  number of posterior samples equal to `object@nsamples`

- `biomass`:

  array of biomass values with dimensions: iteration, time, scenario

- `depletion`:

  array of depletion values with dimensions: iteration, time, scenario

- `epsilon_p`:

  process error residual matrix

- `harvest`:

  catch time series array

- `harvest_rate`:

  harvest rate time series array

## Examples

``` r
if (FALSE) { # \dontrun{
# get some data
data(haknz)
dat <- bdmData(harvest = haknz$landings, index = cbind(haknz$survey, haknz$cpue))

# initialize and fit default model
mdl <- bdm()
mdl <- compiler(mdl)
mdl <- sampler(mdl, dat, run = 'example_run')

# constant harvest rate projection scenarios
mdl.project <- project(mdl, harvest = c(0.05, 0.10, 0.15), time = 20, harvest_rate = TRUE)

# check label
mdl@run
mdl.project$run

# extract median values
apply(mdl.project$depletion, 2:3, median)
apply(mdl.project$harvest, 2:3, median)
apply(mdl.project$harvest_rate, 2:3, median)

# constant catch projection scenarios
mdl.project <- project(mdl, harvest = c(900, 1200, 1500), time = 20, harvest_rate = FALSE)

# extract median values
apply(mdl.project$depletion, 2:3, median)
apply(mdl.project$harvest, 2:3, median)
apply(mdl.project$harvest_rate, 2:3, median)
} # }
```
