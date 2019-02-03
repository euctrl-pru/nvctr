#' Create a rotation matrix from 3 angles about new axes in the zyx order.
#'
#' The rotation matrix R_AB is created based on 3 angles z,y,x about new
#' axes (intrinsic) in the order z-y-x. The angles (called Euler angles or
#' Tait–Bryan angles) are defined by the following procedure of successive
#' rotations:
#'  Given two arbitrary coordinate frames A and B. Consider a temporary frame
#'  T that initially coincides with A. In order to make T align with B, we
#'  first rotate T an angle z about its z-axis (common axis for both A and T).
#'  Secondly, T is rotated an angle y about the NEW y-axis of T. Finally, T
#'  is rotated an angle x about its NEWEST x-axis. The final orientation of
#'  T now coincides with the orientation of B.
#'
#'  The signs of the angles are given by the directions of the axes and the
#'  right hand rule.
#'
#'  Note that if A is a north-east-down frame and B is a body frame, we
#'  have that z=yaw, y=pitch and x=roll.
#'
#' @param z Angle of rotation about new z axis
#' @param y Angle of rotation about new y axis
#' @param x Angle of rotation about new x axis
#'
#' @return 3x3 rotation matrix R_AB (direction cosine matrix) such that the
#'         relation between a vector v decomposed in A and B is
#'         given by: v_A = R_AB * v_B
#' @export
#'
#' @examples
#' \dontrun{
#' R_AB <- zyx2R(z, y, x)
#' }
zyx2R <- function(z, y, x) {
  cz <- cos(z)
  sz <- sin(z)
  cy <- cos(y)
  sy <- sin(y)
  cx <- cos(x)
  sx <- sin(x)

  R_AB <- matrix(
    c(cz * cy, -sz * cx + cz * sy * sx,  sz * sx + cz * sy * cx,
      sz * cy,  cz * cx + sz * sy * sx, -cz * sx + sz * sy * cx,
          -sy,                 cy * sx,                 cy * cx),
    nrow = 3, ncol = 3, byrow = TRUE)
  R_AB
}

