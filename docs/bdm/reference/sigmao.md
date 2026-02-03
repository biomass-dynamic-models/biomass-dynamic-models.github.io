# Access or assign the observation error

By default the bdm package assumes that the observation error variance
is fixed on input and specified in the
[`bdmData`](https://github.com/biomass-dynamic-models/bdm/reference/bdmData-class.md)
object class. This function can be used to access or assign the standard
deviation \\\sigma_o\\ within an `bdmData` object.

## Usage

``` r
sigmao(object, ...)

# S4 method for class 'bdmData'
sigmao(object)

sigmao(object) <- value

# S4 method for class 'bdmData,numeric'
sigmao(object) <- value

# S4 method for class 'bdmData,matrix'
sigmao(object) <- value
```

## Arguments

- object:

  an `bdmData` object

- ...:

  additional arguments to the generic function

- value:

  a `numeric` vector or `matrix` for \\\sigma_o\\

## Value

Accessor function returns a matrix of \\\sigma_o\\ values. Assignment
function populates the `bdmData` object.

## Details

Observation error is used to refer to the deviation of the abundance
observation from the deterministic expectation: \$\$ E\[I\_{t}\] =
qB\_{t} \$\$ where \\B\\ is the biomass, \\I\\ is the abundance index
and \\q\\ is the catchability scalar, which is estimated analytically as
a nuisance parameter. The observation error is time variant and assumed
by default to follow a log-normal distribution: \$\$ I\_{t} \sim
LN(ln(E\[I\_{t}\])-\sigma^2\_{o,t}/2, \sigma^2\_{o,t}) \$\$ The
distribution of \\I\\ around the value predicted by the model can be due
to a variety of difference uncertainties, not just observation, and is
sometimes referred to as the total error. Realistic values for the
observation error are typically informed by standardisation of the
abundance index time series. The default value is \\\sigma_o = 0.2\\ for
all time points.

## Examples

``` r
# initialize bdmData object
dat <- bdmData(harvest = 20:30, index = cbind(runif(11), runif(11)))

# assign single value
sigmao(dat) <- 0.1
sigmao(dat)
#>       [,1] [,2]
#>  [1,]  0.1  0.1
#>  [2,]  0.1  0.1
#>  [3,]  0.1  0.1
#>  [4,]  0.1  0.1
#>  [5,]  0.1  0.1
#>  [6,]  0.1  0.1
#>  [7,]  0.1  0.1
#>  [8,]  0.1  0.1
#>  [9,]  0.1  0.1
#> [10,]  0.1  0.1
#> [11,]  0.1  0.1

# assign values specific
# to each index
sigmao(dat) <- c(0.05, 0.1)
sigmao(dat)
#>       [,1] [,2]
#>  [1,] 0.05  0.1
#>  [2,] 0.05  0.1
#>  [3,] 0.05  0.1
#>  [4,] 0.05  0.1
#>  [5,] 0.05  0.1
#>  [6,] 0.05  0.1
#>  [7,] 0.05  0.1
#>  [8,] 0.05  0.1
#>  [9,] 0.05  0.1
#> [10,] 0.05  0.1
#> [11,] 0.05  0.1

# assign values specific
# to each time
sigmao(dat) <- seq(0.05, 0.2, length = 11)
sigmao(dat)
#>        [,1]  [,2]
#>  [1,] 0.050 0.050
#>  [2,] 0.065 0.065
#>  [3,] 0.080 0.080
#>  [4,] 0.095 0.095
#>  [5,] 0.110 0.110
#>  [6,] 0.125 0.125
#>  [7,] 0.140 0.140
#>  [8,] 0.155 0.155
#>  [9,] 0.170 0.170
#> [10,] 0.185 0.185
#> [11,] 0.200 0.200

# assign values specific
# to each time and index
sigmao(dat) <- matrix(runif(22), nrow = 11)
sigmao(dat)
#>            [,1]       [,2]
#>  [1,] 0.3542068 0.44670247
#>  [2,] 0.8251994 0.37151118
#>  [3,] 0.2738182 0.02806097
#>  [4,] 0.5700450 0.46598719
#>  [5,] 0.3357191 0.39003139
#>  [6,] 0.5962628 0.02006522
#>  [7,] 0.1915180 0.37697093
#>  [8,] 0.9477639 0.55991284
#>  [9,] 0.5424804 0.85708359
#> [10,] 0.5446034 0.38480971
#> [11,] 0.2785972 0.52791704
```
