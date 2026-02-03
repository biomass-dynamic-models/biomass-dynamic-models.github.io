# Convert a `bdm` object to a format suitable for the kobe package

The kobe package (https://github.com/flr/kobe) can be used to produce
diagnostic outputs concerning status of the stock relative to MSY-based
reference points.

## Usage

``` r
as.kobe(.Object, ...)

# S4 method for class 'bdm'
as.kobe(
  .Object,
  projection,
  what = c("samples", "summary")[1],
  prob = c(0.75, 0.5, 0.25),
  year = NULL
)
```

## Arguments

- .Object:

  a `bdm` class object

- ...:

  arguments to generic function (not used)

- projection:

  an optional `list` containing results from a call to
  [`project`](https://github.com/biomass-dynamic-models/bdm/reference/project.md)

- what:

  one or both of "samples" or "summary"

- prob:

  probabilities used for calculation of summary statistics per year

- year:

  year or years included in output

## See also

[`kobe-bdm`](https://github.com/flr/kobe/blob/master/R/kobe-bdm.R)

## Examples

``` r
# see vignette
if (FALSE) { # \dontrun{
vignette('bdm-examples')
} # }
```
