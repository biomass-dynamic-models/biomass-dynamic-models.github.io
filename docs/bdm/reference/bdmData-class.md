# Class containing input data for model run

This is an S4 object class that extends the `list` base type and allows
some error checking to be performed during construction to ensure
formatting is appropriate for a bdm model run

## Usage

``` r
bdmData(index, harvest, time, n, sigmao, sigmap, renormalise = FALSE)
```

## Arguments

- index:

  Matrix of abundance index values

- harvest:

  Numeric vector of catch values

- time:

  Character vector of time values

- n:

  Shape parameter for generalised production function

- sigmao:

  Matrix of observation error values with dimensions equal to `index`

- sigmap:

  Numeric value specifying process error

- renormalise:

  Logical value indicating whether indices should be renormalised to an
  arithmetic mean of one

## Slots

- `.Data`:

  `list` containing input data

- `names`:

  names for each list item

  `T`

  :   Number of discrete time steps in data

  `I`

  :   Number of abundance indices

  `index`

  :   Matrix of abundance index values, with `nrow(index)==T` and
      `ncol(index)==I`.

  `harvest`

  :   Numeric vector of catch values, with `length(harvest)==T`

  `time`

  :   Character vector of time lables e.g. year values.

  `n`

  :   Shape parameter \\n\\ for generalised surplus production model.

  `sigmap`

  :   Log-normal process error scale parameter \\\sigma_p\\

  `sigmao`

  :   Matrix of log-normal observation error scale parameters
      \\\sigma_o\\ with dimensions equal to `index`

## See also

Use
[`sigmao`](https://github.com/biomass-dynamic-models/bdm/reference/sigmao.md)
and
[`sigmap`](https://github.com/biomass-dynamic-models/bdm/reference/sigmap.md)
to set or extract the \\\sigma\\ values. Use
[`shape`](https://github.com/biomass-dynamic-models/bdm/reference/shape.md)
to set or extract the shape of the production function.

## Examples

``` r
# load Indian Ocean albacore data
data(albio)

# create data object
dat <- bdmData(harvest = albio$catch, index = albio$cpue, time = rownames(albio))
```
