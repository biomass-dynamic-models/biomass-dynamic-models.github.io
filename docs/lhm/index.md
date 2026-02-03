# Life history module

Module for the storage and processing of life-history data, designed to
allow the calculation of derived parameters from life-history theory.
Currently it allows calculation of the intrinsic growth rate using the
Euler-Lotka equation.

Outputs from this package are used by the `bdm` package, which
implements a Bayesian biomass dynamic model for estimation of population
status using empirical catch and abundance data. In this instance the
intrinsic growth rate calculated by `lhm` is used as prior for model
fitting by `bdm`.
