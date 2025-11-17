# Create a rotation matrix from 3 angles about new axes in the xyz order.

The rotation matrix `R_AB` is created based on 3 angles `x`, `y` and `z`
about new axes (intrinsic) in the order x-y-z. The angles (called Euler
angles or Tait-Bryan angles) are defined by the following procedure of
successive rotations:

1.  Given two arbitrary coordinate frames `A` and `B`, consider a
    temporary frame `T` that initially coincides with `A`. In order to
    make `T` align with `B`, we first rotate `T` an angle `x` about its
    x-axis (common axis for both `A` and `T`).

2.  Secondly, `T` is rotated an angle `y` about the NEW y-axis of `T`.

3.  Finally, `T` is rotated an angle `z` about its NEWEST z-axis. The
    final orientation of `T` now coincides with the orientation of `B`.

The signs of the angles are given by the directions of the axes and the
right hand rule.

## Usage

``` r
xyz2R(x, y, z)
```

## Arguments

- x:

  Angle of rotation about new x axis (rad)

- y:

  Angle of rotation about new y axis (rad)

- z:

  Angle of rotation about new z axis (rad)

## Value

3x3 rotation matrix (direction cosine matrix) such that the relation
between a vector v decomposed in A and B is given by: v_A = R_AB \* v_B

## References

Kenneth Gade [A Nonsingular Horizontal Position
Representation](https://www.navlab.net/Publications/A_Nonsingular_Horizontal_Position_Representation.pdf).
*The Journal of Navigation*, Volume 63, Issue 03, pp 395-417, July 2010.

## See also

[`R2xyz`](https://nvctr.ansperformance.eu/reference/R2xyz.md),
[`zyx2R`](https://nvctr.ansperformance.eu/reference/zyx2R.md) and
[`R2zyx`](https://nvctr.ansperformance.eu/reference/R2zyx.md).

## Examples

``` r
xyz2R(rad(10), rad(20), rad(30))
#>            [,1]       [,2]       [,3]
#> [1,]  0.8137977 -0.4698463  0.3420201
#> [2,]  0.5438381  0.8231729 -0.1631759
#> [3,] -0.2048741  0.3187958  0.9254166
```
