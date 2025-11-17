# Find the rotation matrix R_EN from n-vector

Find the rotation matrix R_EN from n-vector

## Usage

``` r
n_E2R_EN(n_E)
```

## Arguments

- n_E:

  n-vector decomposed in E (3x1 vector) (no unit)

## Value

The resulting rotation matrix (direction cosine matrix) (no unit)

## References

Kenneth Gade [A Nonsingular Horizontal Position
Representation](https://www.navlab.net/Publications/A_Nonsingular_Horizontal_Position_Representation.pdf).
*The Journal of Navigation*, Volume 63, Issue 03, pp 395-417, July 2010.

## See also

[`R_EN2n_E`](https://nvctr.ansperformance.eu/reference/R_EN2n_E.md),
[`n_E_and_wa2R_EL`](https://nvctr.ansperformance.eu/reference/n_E_and_wa2R_EL.md)
and [`R_EL2n_E`](https://nvctr.ansperformance.eu/reference/R_EL2n_E.md).

## Examples

``` r
n_E2R_EN(c(1, 0, 0))
#>      [,1] [,2] [,3]
#> [1,]    0    0   -1
#> [2,]    0    1    0
#> [3,]    1    0    0
```
