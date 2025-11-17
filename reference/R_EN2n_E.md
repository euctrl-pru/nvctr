# Find n-vector from R_E

Find n-vector from R_E

## Usage

``` r
R_EN2n_E(R_EN)
```

## Arguments

- R_EN:

  Rotation matrix (direction cosine matrix) (no unit)

## Value

n-vector decomposed in E (3x1 vector) (no unit)

## References

Kenneth Gade [A Nonsingular Horizontal Position
Representation](https://www.navlab.net/Publications/A_Nonsingular_Horizontal_Position_Representation.pdf).
*The Journal of Navigation*, Volume 63, Issue 03, pp 395-417, July 2010.

## See also

[`n_E2R_EN`](https://nvctr.ansperformance.eu/reference/n_E2R_EN.md),
[`R_EL2n_E`](https://nvctr.ansperformance.eu/reference/R_EL2n_E.md) and
[`n_E_and_wa2R_EL`](https://nvctr.ansperformance.eu/reference/n_E_and_wa2R_EL.md).

## Examples

``` r
R_EN <- matrix(
   c(-1, 0,  0,
      0, 1,  0,
      0, 0, -1),
   nrow = 3, ncol = 3, byrow = TRUE)
R_EL2n_E(R_EN)
#> [1] 0 0 1
```
