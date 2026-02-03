# Extract single iteration from `lhm` object

Extracts a single iteration from an `lhm` object.

## Usage

``` r
iteration(object, iter, ...)

# S4 method for class 'lhm,numeric'
iteration(object, iter)
```

## Arguments

- object:

  an `lhm` object

- iter:

  iteration to be extracted

- ...:

  arguments to generic function

## Value

An object of class
[`lhmIter-class`](https://github.com/biomass-dynamic-models/lhm/reference/lhmIter-class.md)
which contains a single iteration only.
