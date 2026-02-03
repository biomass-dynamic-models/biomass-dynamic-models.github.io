# Access or assign the process error

By default the bdm package assumes that the process error variance is
fixed on input and specified in the
[`bdmData`](https://github.com/biomass-dynamic-models/bdm/reference/bdmData-class.md)
object class. This function can be used to access or assign the standard
deviation \\\sigma_p\\ within an `bdmData` object.

## Usage

``` r
sigmap(object, ...)

# S4 method for class 'bdmData'
sigmap(object)

sigmap(object) <- value

# S4 method for class 'bdmData,numeric'
sigmap(object) <- value
```

## Arguments

- object:

  an `bdmData` object

- ...:

  additional arguments to the generic function

- value:

  a `numeric` value for \\\sigma_p\\

## Value

Accessor function returns a numeric value. Assignment function populates
the `bdmData` object.

## Details

Process error is used to refer to the deviation of the process equation
from the deterministic expectation: \$\$ E\[B\_{t+1}\] = max(B\_{t} +
g(B\_{t}) - H\_{t}, 0) \$\$ where \\B\\ is the biomass, \\g()\\ is the
production function and \\H\\ is the catch (or harvest). The process
error is assumed by default to follow a log-normal distribution: \$\$
B\_{t+1} \sim LN(ln(E\[B\_{t+1}\])-\sigma^2_p/2, \sigma^2_p) \$\$
Realistic values for the process error are typically \\0.05 \< \sigma_p
\< 0.15\\. The default value is \\\sigma_p = 0.05\\.

## Examples

``` r
# initialize bdmData object
dat <- bdmData(harvest = 20:30, index = runif(11))

# assign and access sigmap
sigmap(dat) <- 0.1
sigmap(dat)
#> [1] 0.1

```
