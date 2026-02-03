# Extract log-normal parameters for the prior on intrinsic growth rate \\r\\

When applied to a `bdm` class object the function uses regular
expression matching to extract log-normal distribution parameters for
\\r\\ from the model code.

By default the bdm package assumes that the prior on intrinsic growth
rate can be described by a log-normal distribution with parameters
\\\mu\\ and \\\sigma\\, which correspond to the mean and standard
deviation of \\\ln(r)\\.

## Usage

``` r
getr(object, ...)

# S3 method for class 'bdm'
getr(object, ...)
```

## Arguments

- object:

  an object of the appropriate class

- ...:

  additional arguments to generic function

## Value

A list containing the elements `'E[log(r)]'` (equal to \\\mu\\),
`'SD[log(r)]'` (equal to \\\sigma\\), `'E[r]'`, `'VAR[r]'` and
`'CV[r]'`.

## Examples

``` r
# default model
mdl <- bdm()

# extract r from
# bdm object
getr(mdl)
#> $`E[log(r)]`
#> [1] -1
#> 
#> $`SD[log(r)]`
#> [1] 0.2
#> 
#> $`E[r]`
#> [1] 0.3753111
#> 
#> $`VAR[r]`
#> [1] 0.005748541
#> 
#> $`CV[r]`
#> [1] 0.2020168
#> 
```
