# Class containing single iteration of life-history information

This is an S4 object class similar to
[`lhm`](https://biomass-dynamic-models.github.io/lhm/reference/lhm-class.md).
It differs from `lhm` in that life-history data are stored as vectors
(rather than matrices) and therefore correspond to a single monte-carlo
interation only. The vectorisation is necessary for efficient estimation
of derived quantities such as \\r\\ using
[`rCalc`](https://biomass-dynamic-models.github.io/lhm/reference/rCalc.md).

## Usage

``` r
# S4 method for class 'lhmIter'
initialize(.Object, ainf, sr)
```

## Details

Initialisation is through a call to
[`iteration`](https://biomass-dynamic-models.github.io/lhm/reference/iteration.md),
which will extract a single iteration from an `lhm` object.

## Slots

- `ainf`:

  the asymptotic age (equal to the maximum age for each life-history
  data vector)

- `sr`:

  the type of stock-recruitment relationship used, either Beverton-Holt
  (`'BH'`) or Ricker (`'RK'`)

- `lhdat`:

  list of numeric vectors containing life-history data-at-age,
  specifically, mass, maturity, natural mortality and survivorship, as
  well as a steepness value

## See also

[`lhm`](https://biomass-dynamic-models.github.io/lhm/reference/lhm-class.md),
[`iteration`](https://biomass-dynamic-models.github.io/lhm/reference/iteration.md),
[`rCalc`](https://biomass-dynamic-models.github.io/lhm/reference/rCalc.md)
