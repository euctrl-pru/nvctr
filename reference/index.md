# Package index

## Utilities

Interesting and useful applications of {nvctr}

- [`along_track_distance()`](https://nvctr.ansperformance.eu/reference/along_track_distance.md)
  : Compute the along-track distance from a great circle arc
- [`altitude_azimuth_distance()`](https://nvctr.ansperformance.eu/reference/altitude_azimuth_distance.md)
  : Calculate the altitude, azimuth and distance of B from A
- [`cross_track_distance()`](https://nvctr.ansperformance.eu/reference/cross_track_distance.md)
  : Compute the cross-track distance from a great circle arc
- [`cross_track_intersection()`](https://nvctr.ansperformance.eu/reference/cross_track_intersection.md)
  : Calculate cross-track intersection

## References

- [`R2xyz()`](https://nvctr.ansperformance.eu/reference/R2xyz.md) : Find
  the three rotation angles about new axes in the xyz order from a
  rotation matrix

- [`R2zyx()`](https://nvctr.ansperformance.eu/reference/R2zyx.md) : Find
  the three angles about new axes in the zyx order from a rotation
  matrix

- [`R_EL2n_E()`](https://nvctr.ansperformance.eu/reference/R_EL2n_E.md)
  :

  Find n-vector from the rotation matrix (direction cosine matrix)
  `R_EL`

- [`R_EN2n_E()`](https://nvctr.ansperformance.eu/reference/R_EN2n_E.md)
  : Find n-vector from R_E

- [`R_Ee()`](https://nvctr.ansperformance.eu/reference/R_Ee.md) : Select
  the axes of the coordinate frame E

- [`lat_lon2n_E()`](https://nvctr.ansperformance.eu/reference/lat_lon2n_E.md)
  : Convert (geodetic) latitude and longitude to n-vector

- [`n_E2R_EN()`](https://nvctr.ansperformance.eu/reference/n_E2R_EN.md)
  : Find the rotation matrix R_EN from n-vector

- [`n_E2lat_lon()`](https://nvctr.ansperformance.eu/reference/n_E2lat_lon.md)
  : Convert n-vector to latitude and longitude

- [`n_EA_E_and_n_EB_E2p_AB_E()`](https://nvctr.ansperformance.eu/reference/n_EA_E_and_n_EB_E2p_AB_E.md)
  : Find the delta position from two positions A and B

- [`n_EA_E_and_p_AB_E2n_EB_E()`](https://nvctr.ansperformance.eu/reference/n_EA_E_and_p_AB_E2n_EB_E.md)
  : Find position B from position A and delta

- [`n_EB_E2p_EB_E()`](https://nvctr.ansperformance.eu/reference/n_EB_E2p_EB_E.md)
  : Convert n-vector to cartesian position vector in meters

- [`n_E_and_wa2R_EL()`](https://nvctr.ansperformance.eu/reference/n_E_and_wa2R_EL.md)
  :

  Find `R_EL` from n-vector and wander azimuth angle

- [`nvctr-package`](https://nvctr.ansperformance.eu/reference/nvctr.md)
  [`nvctr`](https://nvctr.ansperformance.eu/reference/nvctr.md) : nvctr:
  non-singular geographical position calculations

- [`p_EB_E2n_EB_E()`](https://nvctr.ansperformance.eu/reference/p_EB_E2n_EB_E.md)
  : Convert cartesian position vector in meters to n-vector

- [`xyz2R()`](https://nvctr.ansperformance.eu/reference/xyz2R.md) :
  Create a rotation matrix from 3 angles about new axes in the xyz
  order.

- [`zyx2R()`](https://nvctr.ansperformance.eu/reference/zyx2R.md) :
  Create a rotation matrix from 3 angles about new axes in the zyx
  order.

## Helpers

- [`deg()`](https://nvctr.ansperformance.eu/reference/deg.md) : Convert
  angle in radians to degrees
- [`rad()`](https://nvctr.ansperformance.eu/reference/rad.md) : Convert
  angle in degrees to radians.
- [`unit()`](https://nvctr.ansperformance.eu/reference/unit.md) : Make
  input vector unit length, i.e. norm == 1
