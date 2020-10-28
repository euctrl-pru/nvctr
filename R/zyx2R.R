#' Create a rotation matrix from 3 angles about new axes in the zyx order.
#'
#' The rotation matrix \code{R_AB} is created based on 3 angles \code{z}, \code{y} and \code{x}
#' about new axes (intrinsic) in the order z-y-x.
#' The angles (called Euler angles or Tait–Bryan angles) are defined by the following procedure
#' of successive rotations:
#' \enumerate{
#'    \item Given two arbitrary coordinate frames A and B, consider a temporary frame
#'          T that initially coincides with A. In order to make T align with B, we
#'          first rotate T an angle z about its z-axis (common axis for both A and T).
#'    \item Secondly, T is rotated an angle y about the NEW y-axis of T.
#'    \item Finally, T is rotated an angle x about its NEWEST x-axis.
#'          The final orientation of T now coincides with the orientation of B.
#' }
#'  The signs of the angles are given by the directions of the axes and the right hand rule.
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
#' @seealso \code{\link{R2zyx}}, \code{\link{xyz2R}} and \code{\link{R2xyz}}.
#'
#' @examples
#' zyx2R(rad(30), rad(20), rad(10))
#'
#' @references
#' Kenneth Gade \href{https://www.navlab.net/Publications/A_Nonsingular_Horizontal_Position_Representation.pdf}{A Nonsingular Horizontal Position Representation}.
#' \emph{The Journal of Navigation}, Volume 63, Issue 03, pp 395-417, July 2010.
#'
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

