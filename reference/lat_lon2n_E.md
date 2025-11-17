# Convert (geodetic) latitude and longitude to n-vector

Convert (geodetic) latitude and longitude to n-vector

## Usage

``` r
lat_lon2n_E(latitude, longitude)
```

## Arguments

- latitude:

  Geodetic latitude (rad)

- longitude:

  Geodetic longitude (rad)

## Value

n-vector decomposed in E (3x1 vector) (no unit)

## References

Kenneth Gade [A Nonsingular Horizontal Position
Representation](https://www.navlab.net/Publications/A_Nonsingular_Horizontal_Position_Representation.pdf).
*The Journal of Navigation*, Volume 63, Issue 03, pp 395-417, July 2010.

## See also

[`n_E2lat_lon`](https://nvctr.ansperformance.eu/reference/n_E2lat_lon.md).

## Examples

``` r
lat_lon2n_E(rad(1), rad(2))
#> [1] 0.99923861 0.03489418 0.01745241
```
