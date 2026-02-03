# Access or assign shape of the production function

This function can used to access or assign the shape of the generalised
production function. The shape is assumed to be fixed on input and is
therefore contained within the `bdmData` object class as the parameter
\\n\\.

## Usage

``` r
shape(object, ...)

# S4 method for class 'bdmData'
shape(object, par = "phi")

shape(object, ...) <- value

# S4 method for class 'bdmData,numeric'
shape(object) <- value
```

## Arguments

- object:

  a `bdmData` class object

- ...:

  additional arguments to the generic function

- par:

  a character string of either `n` or `phi`

- value:

  a numeric value specifying the value of either `n` or `phi`

## Details

The bdm package assumes by default a generalised Fletcher-Schaefer
hybrid production function. The inflection points occurs at: \$\$\phi =
B\_{MSY}/K = (1/n)^(1/(n-1)).\$\$

The discontinuity in the relationship between \\phi\\ and \\n\\ is
accommodated by assuming \\\phi = 1/e\\ at \\n = 1\\.

## Examples

``` r
# initialize bdmData object
dat <- bdmData(harvest = 20:30, index = runif(11))

# access default shape
shape(dat, 'phi')
#> [1] 0.5
shape(dat, 'n')
#> [1] 2

# assign shape
shape(dat) <- 0.4
shape(dat)
#> [1] 0.4
shape(dat, 'n')
#> [1] 1.188115
```
