# Find `R_EL` from n-vector and wander azimuth angle

Calculate the rotation matrix (direction cosine matrix) `R_EL` using
n-vector (`n_E`) and the wander azimuth angle. When
`wander_azimuth = 0`, we have that N = L (See Table 2 in Gade (2010) for
details)

## Usage

``` r
n_E_and_wa2R_EL(n_E, wander_azimuth)
```

## Arguments

- n_E:

  n-vector decomposed in E (3x1 vector) (no unit)

- wander_azimuth:

  The angle between L's x-axis and north, positive about L's z-axis
  (rad)

## Value

The resulting rotation matrix (3x3) (no unit)

## References

Kenneth Gade [A Nonsingular Horizontal Position
Representation](https://www.navlab.net/Publications/A_Nonsingular_Horizontal_Position_Representation.pdf).
*The Journal of Navigation*, Volume 63, Issue 03, pp 395-417, July 2010.

## See also

[`R_EL2n_E`](https://nvctr.ansperformance.eu/reference/R_EL2n_E.md),
[`R_EN2n_E`](https://nvctr.ansperformance.eu/reference/R_EN2n_E.md) and
[`n_E2R_EN`](https://nvctr.ansperformance.eu/reference/n_E2R_EN.md).

## Examples

``` r
# Calculates the rotation matrix (direction cosine matrix) R_EL
# using n-vector (n_E) and the wander azimuth angle.
n_E <- c(1, 0, 0)
(R_EL <-  n_E_and_wa2R_EL(n_E, wander_azimuth = pi / 2))
#>              [,1]          [,2] [,3]
#> [1,] 0.000000e+00  0.000000e+00   -1
#> [2,] 1.000000e+00  6.123234e-17    0
#> [3,] 6.123234e-17 -1.000000e+00    0
```
