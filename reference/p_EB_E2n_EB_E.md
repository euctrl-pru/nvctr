# Convert cartesian position vector in meters to n-vector

The position of B (typically body) relative to E (typically Earth) is
given as cartesian position vector p_EB_E, in meters ("ECEF-vector").

## Usage

``` r
p_EB_E2n_EB_E(p_EB_E, a = 6378137, f = 1/298.257223563)
```

## Arguments

- p_EB_E:

  Cartesian position vector from E to B, decomposed in E (3x1 vector)
  (m)

- a:

  Semi-major axis of the Earth ellipsoid (m, default \[WGS-84\] 6378137)

- f:

  Flattening of the Earth ellipsoid (no unit, default \[WGS-84\]
  1/298.257223563)

## Value

n-vector representation of position B, decomposed in E (3x1 vector) (no
unit) and depth of system B relative to the ellipsoid (z_EB = -height)

## Details

The function converts to n-vector, n_EB_E and its depth, z_EB.

The calculation is exact, taking the ellipticity of the Earth into
account. It is also nonsingular as both n-vector and p-vector are
nonsingular (except for the center of the Earth). The default ellipsoid
model used is WGS-84, but other ellipsoids (or spheres) might be
specified.

## References

Kenneth Gade [A Nonsingular Horizontal Position
Representation](https://www.navlab.net/Publications/A_Nonsingular_Horizontal_Position_Representation.pdf).
*The Journal of Navigation*, Volume 63, Issue 03, pp 395-417, July 2010.

## See also

[`n_EB_E2p_EB_E`](https://nvctr.ansperformance.eu/reference/n_EB_E2p_EB_E.md),
[`n_EA_E_and_p_AB_E2n_EB_E`](https://nvctr.ansperformance.eu/reference/n_EA_E_and_p_AB_E2n_EB_E.md)
and
[`n_EA_E_and_n_EB_E2p_AB_E`](https://nvctr.ansperformance.eu/reference/n_EA_E_and_n_EB_E2p_AB_E.md)

## Examples

``` r
p_EB_E <- 6371e3 * c(0.9, -1, 1.1)
(n_EB_E <- p_EB_E2n_EB_E(p_EB_E))
#> $n_EB_E
#> [1]  0.5170890 -0.5745433  0.6344439
#> 
#> $z_EB
#> [1] -4702060
#> 
```
