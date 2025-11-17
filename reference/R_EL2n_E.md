# Find n-vector from the rotation matrix (direction cosine matrix) `R_EL`

Find n-vector from the rotation matrix (direction cosine matrix) `R_EL`

## Usage

``` r
R_EL2n_E(R_EL)
```

## Arguments

- R_EL:

  Rotation matrix (direction cosine matrix) (no unit)

## Value

n-vector decomposed in E (3x1 vector) (no unit)

## References

Kenneth Gade [A Nonsingular Horizontal Position
Representation](https://www.navlab.net/Publications/A_Nonsingular_Horizontal_Position_Representation.pdf).
*The Journal of Navigation*, Volume 63, Issue 03, pp 395-417, July 2010.

## See also

[`n_E2R_EN`](https://nvctr.ansperformance.eu/reference/n_E2R_EN.md),
`R_EL2n_E` and
[`n_E_and_wa2R_EL`](https://nvctr.ansperformance.eu/reference/n_E_and_wa2R_EL.md).

## Examples

``` r
R_EL <- matrix(
   c(-1, 0,  0,
      0, 1,  0,
      0, 0, -1),
   nrow = 3, ncol = 3, byrow = TRUE)
R_EL2n_E(R_EL)
#> [1] 0 0 1
```
