# Convert n-vector to latitude and longitude

Convert n-vector to latitude and longitude

## Usage

``` r
n_E2lat_lon(n_E)
```

## Arguments

- n_E:

  n-vector decomposed in E (3x1 vector) (no unit)

## Value

A vector of geodetic latitude and longitude (rad)

## References

Kenneth Gade [A Nonsingular Horizontal Position
Representation](https://www.navlab.net/Publications/A_Nonsingular_Horizontal_Position_Representation.pdf).
*The Journal of Navigation*, Volume 63, Issue 03, pp 395-417, July 2010.

## See also

[`lat_lon2n_E`](https://nvctr.ansperformance.eu/reference/lat_lon2n_E.md).

## Examples

``` r
n_E2lat_lon(c(1, 0, 0))
#> [1] 0 0
```
