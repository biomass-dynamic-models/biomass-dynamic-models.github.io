# Class containing life-history information

This is an S4 object class that contains the life-history information
necessary to calculate derived quantities using life history theory,
such as the intrinsic growth rate \\r\\ using the Euler-Lotka equation.

Initialisation is usually through a call to `lhm(ainf,iter)`. Using this
approach specific life-history data can then be included through the
assignment functions
[`nmort`](https://github.com/biomass-dynamic-models/lhm/reference/nmort.md),
[`size`](https://github.com/biomass-dynamic-models/lhm/reference/size.md),
[`mass`](https://github.com/biomass-dynamic-models/lhm/reference/mass.md),
[`sr`](https://github.com/biomass-dynamic-models/lhm/reference/sr.md)
and
[`maturity`](https://github.com/biomass-dynamic-models/lhm/reference/maturity.md).

## Usage

``` r
lhm(ainf, iter = 1, ...)
```

## Arguments

- ainf:

  the assumed asymptotic age

- iter:

  the number of iterations

- ...:

  additional arguments `nmort`, `size`, `mass`, `sr` and `maturity` that
  can be optionally specified at initialisation of the object

## Slots

- `iter`:

  the number of Monte-Carlo iterations

- `ainf`:

  the asymptotic age (equal to the maximum age for each life-history
  data vector)

- `sr`:

  the type of stock-recruitment relationship used, either Beverton-Holt
  (`'BH'`) or Ricker (`'RK'`)

- `lhdat`:

  list of data matrices containing life-history data-at-age,
  specifically, mass, maturity, natural mortality and survivorship, as
  well as a vector of steepness values

## See also

See the appropriate documentation in
[`mass`](https://github.com/biomass-dynamic-models/lhm/reference/mass.md),
[`maturity`](https://github.com/biomass-dynamic-models/lhm/reference/maturity.md),
[`nmort`](https://github.com/biomass-dynamic-models/lhm/reference/nmort.md),
[`size`](https://github.com/biomass-dynamic-models/lhm/reference/size.md),
[`sr`](https://github.com/biomass-dynamic-models/lhm/reference/sr.md)
and
[`survivorship`](https://github.com/biomass-dynamic-models/lhm/reference/survivorship.md)
for how these are specified, accessed and assigned. See documentation
for
[`rCalc`](https://github.com/biomass-dynamic-models/lhm/reference/rCalc.md)
on how to calculate \\r\\ from an `lhm` object. Use
[`iterate`](https://github.com/biomass-dynamic-models/lhm/reference/iterate.md)
to increase the number of iterations after the object has been created.
Use
[`iteration`](https://github.com/biomass-dynamic-models/lhm/reference/iteration.md)
to access a particular iteration.

## Examples

``` r
# initialise lhm-class object
ainf <- 100
iter <- 1
dat <- lhm(ainf, iter)

# assign life-history data
nmort(dat)    <- list(mu=0.18)
size(dat)     <- list(mu=list(Linf=106.5,k=0.229,t0=0.01)) 
mass(dat)     <- list(mu=list(a=1.7e-9,b=3.328))
sr(dat)       <- list(type='BH',mu=0.9)
maturity(dat) <- list(mu=list(acrit=8))
```
