# Add iterations to existing `lhm` object

This function will add an iteration dimension to the life-history data
contained in an `lhm` object.

## Usage

``` r
iterate(object, iter, ...)

# S4 method for class 'lhm,numeric'
iterate(object, iter)
```

## Arguments

- object:

  existing `lhm` object

- iter:

  number of iterations

- ...:

  arguments to generic function

## Value

Returns an `lhm` object with life-history data replicated `iter` times

## Examples

``` r
# initialise data object
dat <- lhm(ainf = 30, iter = 1)

# to generate monte-carlo iterations first either 
# re-initialise 'lhm' object using more iterations or 
# iterate existing object:
dat <- iterate(dat, iter = 200)
```
