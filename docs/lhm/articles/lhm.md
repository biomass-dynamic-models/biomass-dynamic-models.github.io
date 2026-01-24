# Life history module (lhm)

## Development of a prior for the intrinsic growth rate

If life history data are available we can populate an object of the
`lhm` class, which is obtained from the `lhm` (life-history module)
package, and is used to store and manipulate life-history data.
Monte-Carlo samples are generated, and application of the
[`lhm::rCalc`](https://biomass-dynamic-models.github.io/lhm/reference/rCalc.md)
function to this class of object calcuates values of the intrinsic
growth rate $r$ for each iteration, producing an object of the `prior`
class. The `prior` class contains a numeric vector with an additional
slot for holding parameters of the associated distribution. Currently
only the log-normal distribution is supported, with parameters stored in
`object@lognormal.par`.

``` r
library(lhm)

# initialise lhm data object for calculation of r with uncertainty
rdat <- lhm(ainf = 100, iter = 200)

# then life-history vectors can be assigned to each iteration with or without uncertainty
nmort(rdat) <- list(mu = 0.18)
maturity(rdat) <- c(0, 0.01, 0.02, 0.06, 0.14, 0.28, 0.5, 0.72, 0.86, 0.94, 0.98, 0.99, 1)
size(rdat) <- list(mu = list(Linf = 106.5, k = 0.229, t0 = 0.01))
mass(rdat) <- list(mu = list(a = 1.88e-09, b = 3.305))
sr(rdat) <- list(type = "BH", mu = 0.9, cv = 0.1)

# calculate r prior and fit log-normal distribution
r <- rCalc(rdat)
```

``` r
plot(r)
```

![](fig/lhm-examples-unnamed-chunk-2-1.png)
