#' Create a rotation matrix from 3 angles about new axes in the xyz order.
#'
#' The rotation matrix \code{R_AB} is created based on 3 angles \code{x}, \code{y} and \code{z}
#' about new axes (intrinsic) in the order x-y-z.
#' The angles (called Euler angles or Tait-Bryan angles) are defined by the following
#' procedure of successive rotations:
#' \enumerate{
#'    \item Given two arbitrary coordinate frames \code{A} and \code{B}, consider a temporary frame
#'          \code{T} that initially coincides with \code{A}.
#'          In order to make \code{T} align with \code{B}, we first rotate \code{T}
#'          an angle \code{x} about its x-axis (common axis for both \code{A} and \code{T}).
#'    \item Secondly, \code{T} is rotated an angle \code{y} about the NEW y-axis of \code{T}.
#'    \item Finally, code{T} is rotated an angle \code{z} about its NEWEST z-axis.
#'          The final orientation of \code{T} now coincides with the orientation of \code{B}.
#' }
#' The signs of the angles are given by the directions of the axes and the right hand rule.
#'
#' @param x Angle of rotation about new x axis (rad)
#' @param y Angle of rotation about new y axis (rad)
#' @param z Angle of rotation about new z axis (rad)
#'
#' @return 3x3 rotation matrix (direction cosine matrix) such that the relation between
#'         a vector v decomposed in A and B is given by: v_A = R_AB * v_B
#' @export
#'
#' @examples
#' xyz2R(rad(10), rad(20), rad(30))
#'
#' @seealso \code{\link{R2xyz}}, \code{\link{zyx2R}} and \code{\link{R2zyx}}.
#'
#' @references
#' Kenneth Gade \href{https://www.navlab.net/Publications/A_Nonsingular_Horizontal_Position_Representation.pdf}{A Nonsingular Horizontal Position Representation}.
#' \emph{The Journal of Navigation}, Volume 63, Issue 03, pp 395-417, July 2010.
#'
xyz2R <- function(x, y, z) {
  cz <- cos(z)
  sz <- sin(z)
  cy <- cos(y)
  sy <- sin(y)
  cx <- cos(x)
  sx <- sin(x)

  R_AB <- matrix(
    c(         cy*cz,          -cy*sz,     sy,
      sy*sx*cz+cx*sz, -sy*sx*sz+cx*cz, -cy*sx,
     -sy*cx*cz+sx*sz,  sy*cx*sz+sx*cz, cy*cx
    ),
    nrow = 3, ncol = 3, byrow = TRUE)
  R_AB
}