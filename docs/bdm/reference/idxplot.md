# Plot the `bdm` model fit

Plots the estimated abundance index dynamics over time against the
observed values

## Usage

``` r
idxplot(object, ...)

# S3 method for class 'bdm'
idxplot(object, labels, ...)
```

## Arguments

- object:

  a fitted `bdm` class object.

- ...:

  additional arguments to the generic function

- labels:

  character vector of labels for each index.

## Value

Returns a `ggplot` object that can be displayed or assigned and
manuipulated using further arguments from the ggplot2 package.
