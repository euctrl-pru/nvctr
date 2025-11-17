# Convert n-vector to cartesian position vector in meters

The function converts the position of B (typically body) relative to E
(typically Earth), the n-vector `n_EB_E` to cartesian position vector
("ECEF-vector"), `p_EB_E`, in meters.

## Usage

``` r
n_EB_E2p_EB_E(n_EB_E, z_EB = 0, a = 6378137, f = 1/298.257223563)
```

## Arguments

- n_EB_E:

  n-vector of position B, decomposed in E (3x1 vector) (no unit)

- z_EB:

  Depth of system B, relative to the ellipsoid (z_EB = -height) (m,
  default 0)

- a:

  Semi-major axis of the Earth ellipsoid (m, default \[WGS-84\] 6378137)

- f:

  Flattening of the Earth ellipsoid (no unit, default \[WGS-84\]
  1/298.257223563)

## Value

Cartesian position vector from E to B, decomposed in E (3x1 vector) (m)

## Details

The calculation is exact, taking the ellipticity of the Earth into
account.

It is also nonsingular as both n-vector and p-vector are nonsingular
(except for the center of the Earth). The default ellipsoid model used
is WGS-84, but other ellipsoids (or spheres) might be specified via the
optional parameters `a` and `f`.

## References

Kenneth Gade [A Nonsingular Horizontal Position
Representation](https://www.navlab.net/Publications/A_Nonsingular_Horizontal_Position_Representation.pdf).
*The Journal of Navigation*, Volume 63, Issue 03, pp 395-417, July 2010.

## See also

[`p_EB_E2n_EB_E`](https://nvctr.ansperformance.eu/reference/p_EB_E2n_EB_E.md),
[`n_EA_E_and_p_AB_E2n_EB_E`](https://nvctr.ansperformance.eu/reference/n_EA_E_and_p_AB_E2n_EB_E.md)
and
[`n_EA_E_and_n_EB_E2p_AB_E`](https://nvctr.ansperformance.eu/reference/n_EA_E_and_n_EB_E2p_AB_E.md).

## Examples

``` r
n_EB_E  <- lat_lon2n_E(rad(1), rad(2))
n_EB_E2p_EB_E(n_EB_E)
#> [1] 6373287.3  222560.1  110568.8
```
