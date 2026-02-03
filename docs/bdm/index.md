# Bayesian biomass dynamic model

# Instructions

First, install the `rstan` and `remotes` packages from CRAN:

``` R
# Install packages
install.packages("remotes")
install.packages("rstan")
```

Then install `bdm` directly from GitHub:

``` R
# remotes command to get bdm from GitHub
remotes::install_github("biomass-dynamic-models/bdm") 
```

The life history module `lhm` is required to estimate the intrinsic
growth rate:

``` R
# remotes command to get lhm from GitHub
remotes::install_github("biomass-dynamic-models/lhm") 
```
