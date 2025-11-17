# Create a rotation matrix from 3 angles about new axes in the zyx order.

The rotation matrix `R_AB` is created based on 3 angles `z`, `y` and `x`
about new axes (intrinsic) in the order z-y-x. The angles (called Euler
angles or Tait–Bryan angles) are defined by the following procedure of
successive rotations:

1.  Given two arbitrary coordinate frames A and B, consider a temporary
    frame T that initially coincides with A. In order to make T align
    with B, we first rotate T an angle z about its z-axis (common axis
    for both A and T).

2.  Secondly, T is rotated an angle y about the NEW y-axis of T.

3.  Finally, T is rotated an angle x about its NEWEST x-axis. The final
    orientation of T now coincides with the orientation of B.

The signs of the angles are given by the directions of the axes and the
right hand rule. Note that if A is a north-east-down frame and B is a
body frame, we have that z=yaw, y=pitch and x=roll.

## Usage

``` r
zyx2R(z, y, x)
```

## Arguments

- z:

  Angle of rotation about new z axis

- y:

  Angle of rotation about new y axis

- x:

  Angle of rotation about new x axis

## Value

3x3 rotation matrix R_AB (direction cosine matrix) such that the
relation between a vector v decomposed in A and B is given by: v_A =
R_AB \* v_B

## References

Kenneth Gade [A Nonsingular Horizontal Position
Representation](https://www.navlab.net/Publications/A_Nonsingular_Horizontal_Position_Representation.pdf).
*The Journal of Navigation*, Volume 63, Issue 03, pp 395-417, July 2010.

## See also

[`R2zyx`](https://nvctr.ansperformance.eu/reference/R2zyx.md),
[`xyz2R`](https://nvctr.ansperformance.eu/reference/xyz2R.md) and
[`R2xyz`](https://nvctr.ansperformance.eu/reference/R2xyz.md).

## Examples

``` r
zyx2R(rad(30), rad(20), rad(10))
#>            [,1]       [,2]       [,3]
#> [1,]  0.8137977 -0.4409696 0.37852231
#> [2,]  0.4698463  0.8825641 0.01802831
#> [3,] -0.3420201  0.1631759 0.92541658
```
