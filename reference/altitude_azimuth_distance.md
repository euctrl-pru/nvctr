# Calculate the altitude, azimuth and distance of B from A

The altitude (elevation from the horizon), azimuth and distance of a
point B from A are the coordinates of the Topocentric Coordinate System
as typically used in astronomy to aim your telescope to a heavenly body.
It can be also of use to know where an airplane is in the sky with
respect to an observer on Earth.

## Usage

``` r
altitude_azimuth_distance(a, b)
```

## Arguments

- a:

  the observer position: a vector of longitude, latitude (in decimal
  degrees) and altitude (in meters) in WGS84

- b:

  the observed position: a vector of longitude, latitude (in decimal
  degrees) and altitude (in meters) in WGS84

## Value

the coordinates in North-East-Up of the observed, B, with respect to the
observer A. A vector of
[altitude](https://en.wikipedia.org/wiki/Horizontal_coordinate_system)
(elevation from the horizon) in decimal degrees,
[azimuth](https://en.wikipedia.org/wiki/Azimuth)) in decimal degrees and
distance in meters.

## See also

Other utilities:
[`along_track_distance()`](https://nvctr.ansperformance.eu/reference/along_track_distance.md),
[`cross_track_distance()`](https://nvctr.ansperformance.eu/reference/cross_track_distance.md),
[`cross_track_intersection()`](https://nvctr.ansperformance.eu/reference/cross_track_intersection.md)

## Examples

``` r
if (FALSE) { # \dontrun{
# sensor (longitude, latitude, altitude)
a <- c(49.47, 7.697, 274)
# aircraft (longitude, latitude, altitude)
b <- c(49.52, 7.803, 6401)
altitude_azimuth_distance(a, b)
} # }
```
