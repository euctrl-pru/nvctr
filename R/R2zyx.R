#' Find the three angles about new axes in the zyx order from a rotation matrix.
#'
#' The 3 angles z,y,x about new axes (intrinsic) in the order z-y-x are found
#' from the rotation matrix R_AB. The angles (called Euler angles or
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
#' @param R_AB a 3x3 rotation matrix (direction cosine matrix) such that the
#'             relation between a vector v decomposed in A and B is
#'             given by: v_A = R_AB * v_B
#'
#' @return z,y,x angles of rotation about new axes (rad)
#' @export
#'
#' @examples
#' \dontrun{
#' R2zyx(R_AB)
#' }
R2zyx <- function(R_AB) {
  # atan2: [-pi pi]
  z <- atan2(R_AB[2, 1], R_AB[1, 1])
  x <- atan2(R_AB[3, 2], R_AB[3, 3])

  sin_y <- -R_AB[3, 1]

  # cos_y is based on as many elements as possible, to average out
  # numerical errors. It is selected as the positive square root since
  # y: [-pi/2 pi/2]
  cos_y <- sqrt((R_AB[1, 1]^2 + R_AB[2, 1]^2 + R_AB[3, 2]^2 + R_AB[3, 3]^2) / 2)

  y <- atan2(sin_y, cos_y)
  c(z, y, x)
}
