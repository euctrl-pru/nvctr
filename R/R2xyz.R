#' Find the three rotation angles about new axes in the xyz order from a rotation matrix
#'
#' The angles (called Euler angles or Tait–Bryan angles) are defined by the
#' following procedure of successive rotations:
#' Given two arbitrary coordinate frames A and B, consider a temporary frame
#' T that initially coincides with A. In order to make T align with B, we
#' first rotate T an angle x about its x-axis (common axis for both A and T).
#' Secondly, T is rotated an angle y about the NEW y-axis of T. Finally, T
#' is rotated an angle z about its NEWEST z-axis. The final orientation of
#' T now coincides with the orientation of B.
#' The signs of the angles are given by the directions of the axes and the
#' right hand rule.

#' @param R_AB a 3x3 rotation matrix (direction cosine matrix) such that the
#'             relation between a vector v decomposed in A and B is
#'             given by: v_A = R_AB * v_B
#'
#' @return x,y,z 	Angles of rotation about new axes (rad)
#' @export
#'
#' @examples
#'   R_AB <- matrix(
#'      c( 0.9980212 ,  0.05230407, -0.0348995 ,
#'        -0.05293623,  0.99844556, -0.01744177,
#'         0.03393297,  0.01925471,  0.99923861),
#'      nrow = 3, ncol = 3, byrow = TRUE)
#' R2xyz(R_AB)
#'
#' @seealso \code{\link{xyz2R}}, \code{\link{R2zyx}} and \code{\link{zyx2R}}.
#'
#' @references
#' Kenneth Gade \href{https://www.navlab.net/Publications/A_Nonsingular_Horizontal_Position_Representation.pdf}{A Nonsingular Horizontal Position Representation}.
#' \emph{The Journal of Navigation}, Volume 63, Issue 03, pp 395-417, July 2010.
#'
R2xyz <- function(R_AB) {
  # atan2: [-pi pi]
  z <- atan2(-R_AB[1, 2], R_AB[1, 1])
  x <- atan2(-R_AB[2, 3], R_AB[3, 3])

  sin_y <- R_AB[1, 3]

  # cos_y is based on as many elements as possible, to average out
  # numerical errors. It is selected as the positive square root since
  # y: [-pi/2 pi/2]
  cos_y <- sqrt((R_AB[1, 1]^2 + R_AB[1, 2]^2 + R_AB[2, 3]^2 + R_AB[3, 3]^2) / 2)

  y <- atan2(sin_y, cos_y)

  c(x, y, z)
}


