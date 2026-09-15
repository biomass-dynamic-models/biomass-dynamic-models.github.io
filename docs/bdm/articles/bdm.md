# Introduction to bdm

Biomass dynamic models are a class of population models that represent
the annual population as a single unit of aggregated biomass. Their
simplicity makes them useful when data are limited or more complicated
representations are not necessary.

This class of models is often advocated from an empirical perspective,
because they are often able to provide an adequate and parsimonious
representation of the data. In contrast, more realistic models are seen
as overly complex, requiring additional data to parameterise without
yielding an obvious benefit to our understanding of the dynamics.

Biomass dynamic models therefore remain a useful tool for the assessment
and management of exploited populations. The `bdm` package is designed
to facilitate this modelling approach using modern statistical
techniques.

## Installation

First, install the `rstan` and `remotes` packages from CRAN:

    # Install packages
    install.packages("remotes")
    install.packages("rstan")

Then install `bdm` directly from GitHub:

    # remotes command to get bdm from GitHub
    remotes::install_github("biomass-dynamic-models/bdm") 

The life history module `lhm` is required to estimate the intrinsic
growth rate:

    # remotes command to get lhm from GitHub
    remotes::install_github("biomass-dynamic-models/lhm")
