# Find the three angles about new axes in the zyx order from a rotation matrix

The 3 angles `z`, `y`, `x` about new axes (intrinsic) in the order z-y-x
are found from the rotation matrix `R_AB`. The angles (called Euler
angles or Tait–Bryan angles) are defined by the following procedure of
successive rotations:

1.  Given two arbitrary coordinate frames A and B, consider a temporary
    frame T that initially coincides with A. In order to make T align
    with B, we first rotate T an angle z about its z-axis (common axis
    for both A and T).

2.  Secondly, T is rotated an angle y about the NEW y-axis of T.
    Finally, T is rotated an angle x about its NEWEST x-axis.

3.  The final orientation of T now coincides with the orientation of B.

The signs of the angles are given by the directions of the axes and the
right hand rule.

## Usage

``` r
R2zyx(R_AB)
```

## Arguments

- R_AB:

  a 3x3 rotation matrix (direction cosine matrix) such that the relation
  between a vector v decomposed in A and B is given by: v_A = R_AB \*
  v_B

## Value

z,y,x angles of rotation about new axes (rad)

## Details

Note that if A is a north-east-down frame and B is a body frame, we have
that z=yaw, y=pitch and x=roll.

## References

Kenneth Gade [A Nonsingular Horizontal Position
Representation](https://www.navlab.net/Publications/A_Nonsingular_Horizontal_Position_Representation.pdf).
*The Journal of Navigation*, Volume 63, Issue 03, pp 395-417, July 2010.

## See also

[`zyx2R`](https://nvctr.ansperformance.eu/reference/zyx2R.md),
[`xyz2R`](https://nvctr.ansperformance.eu/reference/xyz2R.md) and
[`R2xyz`](https://nvctr.ansperformance.eu/reference/R2xyz.md).

## Examples

``` r
zyx2R(rad(1), rad(-2), rad(-3))
#>            [,1]        [,2]        [,3]
#> [1,] 0.99923861 -0.01560227 -0.03575975
#> [2,] 0.01744177  0.99850932  0.05171974
#> [3,] 0.03489950 -0.05230407  0.99802120
```
