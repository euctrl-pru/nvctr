#' Find position B from position A and delta
#'
#' Given the n-vector for position A (\code{n_EA_E}) and the position-vector from position
#' A to position B (\code{p_AB_E}), the output is the n-vector of position
#' B (\code{n_EB_E}) and depth of B (\code{z_EB}).
#'
#' The calculation is exact, taking the ellipticity of the Earth into account.
#'
#' It is also nonsingular as both n-vector and p-vector are nonsingular
#' (except for the center of the Earth).
#' The default ellipsoid model used is WGS-84, but other ellipsoids (or spheres) might be specified.
#'
#' @param n_EA_E n-vector of position A, decomposed in E (3x1 vector) (no unit)
#' @param p_AB_E Position vector from A to B, decomposed in E (3x1 vector) (m)
#' @param z_EA   Depth of system A, relative to the ellipsoid (z_EA = -height) (m, default 0)
#' @param a      Semi-major axis of the Earth ellipsoid (m, default [WGS-84] 6378137)
#' @param f      Flattening of the Earth ellipsoid (no unit, default [WGS-84] 1/298.257223563)
#'
#' @return a list with n-vector of position B, decomposed in E (3x1 vector) (no unit) and
#'         the depth of system B, relative to the ellipsoid (z_EB = -height)
#' @export
#'
#' @examples
#' p_BC_B <- c(3000, 2000, 100)
#'
#' # Position and orientation of B is given:
#' n_EB_E <- unit(c(1,2,3))  # unit to get unit length of vector
#' z_EB <- -400
#' R_NB  <- zyx2R(rad(10), rad(20), rad(30)) # yaw, pitch, and roll
#' R_EN <- n_E2R_EN(n_EB_E)
#' R_EB <- R_EN %*% R_NB
#'
#' # Decompose the delta vector in E:
#' p_BC_E <- (R_EB %*% p_BC_B) %>% as.vector() # no transpose of R_EB, since the vector is in B
#'
#' # Find the position of C, using the functions that goes from one
#' # position and a delta, to a new position:
#' (n_EB_E <- n_EA_E_and_p_AB_E2n_EB_E(n_EB_E, p_BC_E, z_EB))
#'
#' @seealso \code{\link{n_EA_E_and_n_EB_E2p_AB_E}}, \code{\link{p_EB_E2n_EB_E}} and
#'          \code{\link{n_EB_E2p_EB_E}}
#'
#' @references
#' Kenneth Gade \href{https://www.navlab.net/Publications/A_Nonsingular_Horizontal_Position_Representation.pdf}{A Nonsingular Horizontal Position Representation}.
#' \emph{The Journal of Navigation}, Volume 63, Issue 03, pp 395-417, July 2010.
#'
n_EA_E_and_p_AB_E2n_EB_E <- function(n_EA_E, p_AB_E, z_EA = 0 , a = 6378137, f = 1.0 / 298.257223563) {
  p_EA_E <- n_EB_E2p_EB_E(n_EA_E, z_EA, a, f)
  p_EB_E <- p_EA_E + p_AB_E

  l <- p_EB_E2n_EB_E(p_EB_E, a, f)
  l
}