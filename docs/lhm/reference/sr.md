# Stock-recruitment function

This function can be used to access or assign the stock recruitment
function in an
[`lhm`](https://github.com/biomass-dynamic-models/lhm/reference/lhm-class.md)
object.

When executing
[`rCalc`](https://github.com/biomass-dynamic-models/lhm/reference/rCalc.md)
the recruitment functions are used to calculate the maximum recruits per
spawner, using steepness and the equilibrium spawning biomass per
recruit \\SBPR\\. For the Beverton-Holt stock recruitment function
recruits per spawner is \$\$Max. Recruits Per Spawner = 4h/(SBPR \* (1 -
h)),\$\$ and for the Ricker function it is \$\$Max. Recruits Per Spawner
= h^1.25 / (SBPR \* exp(ln(0.2)/0.8)).\$\$ To introduce uncertainty the
steepness is represented as: \$\$h_i = 0.2 +
rbeta(\alpha,\beta)(h^{MAX} - 0.2)\$\$ where \\h^{MAX}=1\\ for the
Beverton-Holt function and \\h^{MAX}\approx 165\\ for the Ricker
function. The \\\alpha\\ and \\\beta\\ parameters of the \\Beta\\
distribution are found using a numerical search algorithm to give mean
and uncertainty values approximately equal to those input.

## Usage

``` r
sr(object, ...)

# S4 method for class 'lhm'
sr(object)

sr(object) <- value

# S4 method for class 'lhm,list'
sr(object) <- value
```

## Arguments

- object:

  a `lhm` object

- ...:

  arguments to generic function

- value:

  a `list` containing the components `type`, `mu` and `cv`

  `type`

  :   can be either `'BH'` or `'RK'` indicating the Beverton-Holt and
      Ricker curves respectively

  `mu`

  :   a list containing the single steepness parameter `h` which
      represents the mean value

  `cv`

  :   a list containing the single steepness parameter `h` which
      represents the coefficient of variation

## Examples

``` r
# single iteration
dat <- lhm(ainf = 30, iter = 1)
sr(dat) <- list(type = 'BH', mu = 0.75)
sr(dat)
#> $type
#> [1] "BH"
#> 
#> $h
#>      [,1]
#> [1,] 0.75
#> 

# multiple stochastic iterations
dat <- lhm(ainf = 30, iter = 10)
sr(dat) <- list(type = 'BH', mu = 0.75, cv = 0.1)
sr(dat)
#> $type
#> [1] "BH"
#> 
#> $h
#>           [,1]      [,2]      [,3]      [,4]      [,5]      [,6]      [,7]
#> [1,] 0.7766583 0.7902261 0.6695621 0.7545401 0.6568878 0.7791049 0.6894882
#>           [,8]      [,9]     [,10]
#> [1,] 0.8709409 0.6941472 0.7921494
#> 
```
