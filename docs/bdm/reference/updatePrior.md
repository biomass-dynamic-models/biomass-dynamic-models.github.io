# Update priors in `bdm` model

This function can be used to update the priors for \\r\\ and \\ln(K)\\.

The bdm package by default assumes that the prior on \\r\\ is log-normal
and the prior for \\ln(K)\\ is uniform. If the function is supplied with
a [`prior`](https://rdrr.io/pkg/lhm/man/prior-class.html) class object
then it will extract the log-normal distribution parameters for \\r\\
and use regular expression matching to update the model code. If the
function is provided with a named list then it can be used to update the
priors for \\r\\, \\ln(K)\\ or the initial depletion \\x0\\, in a
similar manner. See the examples for how the list arguments are
specified.

By default this function only updates the model code. The model will
need to be re-compiled before it is run for the changes to take effect.

## Usage

``` r
updatePrior(object, ...)

# S3 method for class 'bdm'
updatePrior(object, prior, ...)
```

## Arguments

- object:

  a `bdm` class object

- ...:

  additional arguments to generic function

- prior:

  a `prior` class object or a `list` object containing information to
  update the prior

## Value

Returns a `bdm` object with updated model code.

## Examples

``` r
# initialise default model
mdl <- bdm()

# update prior for r
mdl <- updatePrior(mdl, list(par = 'r', meanlog = -1.1, sdlog = 0.1))
#> re-compile the model before running sampler()

# update prior for logK
mdl <- updatePrior(mdl, list(par = 'logK', min = 1, max = 100))
#> re-compile the model before running sampler()

# update prior for initial depletion
mdl <- updatePrior(mdl, list(par = 'x0', meanlog = log(0.8), sdlog = 0.01))
#> re-compile the model before running sampler()

# check updates
getr(mdl)
#> $`E[log(r)]`
#> [1] -1.1
#> 
#> $`SD[log(r)]`
#> [1] 0.1
#> 
#> $`E[r]`
#> [1] 0.3345396
#> 
#> $`VAR[r]`
#> [1] 0.001124782
#> 
#> $`CV[r]`
#> [1] 0.1002505
#> 
getlogK(mdl)
#> $`E[logK]`
#> NULL
#> 
#> $`min[logK]`
#> [1] 1
#> 
#> $`max[logK]`
#> [1] 100
#> 

# update using a prior class
# object
library(lhm)
#> lhm version 1.0.0 (03-Feb-2026)

# create object containing
# vector of r values
iter <- 100
mu <- 0.1
cv <- 0.2
sd <- sqrt(log(1+cv^2))
x <- rlnorm(iter,log(mu)-sd^2/2,sd)
r <- prior(x)

# update model
mdl <- updatePrior(mdl, r)
#> re-compile the model before running sampler()

# check update
mean(log(r))
#> [1] -2.303153
getr(mdl)[['E[log(x)]']]
#> NULL
```
