# Find the delta position from two positions A and B

Given the n-vectors for positions A (`n_EA_E`) and B (`n_EB_E`), the
output is the delta vector from A to B (`p_AB_E`).

## Usage

``` r
n_EA_E_and_n_EB_E2p_AB_E(
  n_EA_E,
  n_EB_E,
  z_EA = 0,
  z_EB = 0,
  a = 6378137,
  f = 1/298.257223563
)
```

## Arguments

- n_EA_E:

  n-vector of position A, decomposed in E (3x1 vector) (no unit)

- n_EB_E:

  n-vector of position B, decomposed in E (3x1 vector) (no unit)

- z_EA:

  Depth of system A, relative to the ellipsoid (z_EA = -height) (m,
  default 0)

- z_EB:

  Depth of system B, relative to the ellipsoid (z_EB = -height) (m,
  default 0)

- a:

  Semi-major axis of the Earth ellipsoid (m, default \[WGS-84\] 6378137)

- f:

  Flattening of the Earth ellipsoid (no unit, default \[WGS-84\]
  1/298.257223563)

## Value

Position vector from A to B, decomposed in E (3x1 vector)

## Details

The calculation is exact, taking the ellipticity of the Earth into
account. It is also nonsingular as both n-vector and p-vector are
nonsingular (except for the center of the Earth). The default ellipsoid
model used is WGS-84, but other ellipsoids (or spheres) might be
specified via the optional parameters `a` and `f`.

## References

Kenneth Gade [A Nonsingular Horizontal Position
Representation](https://www.navlab.net/Publications/A_Nonsingular_Horizontal_Position_Representation.pdf).
*The Journal of Navigation*, Volume 63, Issue 03, pp 395-417, July 2010.

## See also

[`n_EA_E_and_p_AB_E2n_EB_E`](https://nvctr.ansperformance.eu/reference/n_EA_E_and_p_AB_E2n_EB_E.md),
[`p_EB_E2n_EB_E`](https://nvctr.ansperformance.eu/reference/p_EB_E2n_EB_E.md)
and
[`n_EB_E2p_EB_E`](https://nvctr.ansperformance.eu/reference/n_EB_E2p_EB_E.md)

## Examples

``` r
lat_EA <- rad(1); lon_EA <- rad(2); z_EA   <- 3
lat_EB <- rad(4); lon_EB <- rad(5); z_EB   <- 6

n_EA_E <- lat_lon2n_E(lat_EA, lon_EA)
n_EB_E <- lat_lon2n_E(lat_EB, lon_EB)

n_EA_E_and_n_EB_E2p_AB_E(n_EA_E, n_EB_E, z_EA, z_EB)
#> [1] -34798.44 331985.66 331375.96
```
