# Introduction to lhm

The life-history module is designed for the storage and processing of
life-history data, designed to allow the calculation of derived
parameters from life-history theory. Currently it allows calculation of
the intrinsic growth rate using the Euler-Lotka equation.

Outputs from this package are used by the `bdm` package, which
implements a Bayesian biomass dynamic model for estimation of population
status using empirical catch and abundance data. In this instance the
intrinsic growth rate calculated by `lhm` is used as prior for model
fitting by `bdm`.

## Installation

First, install the `remotes` packages from CRAN:

    # Install packages
    install.packages("remotes")

Then install `lhm` directly from GitHub:

    # remotes command to get lhm from GitHub
    remotes::install_github("biomass-dynamic-models/lhm")
