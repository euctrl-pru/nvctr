#' Find the delta position from two positions A and B
#'
#' Given the n-vectors for positions A (\code{n_EA_E}) and B (\code{n_EB_E}), the
#' output is the delta vector from A to B (\code{p_AB_E}).
#'
#' The calculation is exact, taking the ellipticity of the Earth into account.
#' It is also nonsingular as both n-vector and p-vector are nonsingular
#' (except for the center of the Earth).
#' The default ellipsoid model used is WGS-84, but other ellipsoids (or spheres) might be specified
#' via the optional parameters \code{a} and \code{f}.
#'
#' @param n_EA_E n-vector of position A, decomposed in E (3x1 vector) (no unit)
#' @param n_EB_E n-vector of position B, decomposed in E (3x1 vector) (no unit)
#' @param z_EA   Depth of system A, relative to the ellipsoid (z_EA = -height) (m, default 0)
#' @param z_EB   Depth of system B, relative to the ellipsoid (z_EB = -height) (m, default 0)
#' @param a      Semi-major axis of the Earth ellipsoid (m, default [WGS-84] 6378137)
#' @param f      Flattening of the Earth ellipsoid (no unit, default [WGS-84] 1/298.257223563)
#'
#' @return       Position vector from A to B, decomposed in E (3x1 vector)
#' @export
#'
#' @examples
#' lat_EA <- rad(1); lon_EA <- rad(2); z_EA   <- 3
#' lat_EB <- rad(4); lon_EB <- rad(5); z_EB   <- 6
#'
#' n_EA_E <- lat_lon2n_E(lat_EA, lon_EA)
#' n_EB_E <- lat_lon2n_E(lat_EB, lon_EB)
#'
#' n_EA_E_and_n_EB_E2p_AB_E(n_EA_E, n_EB_E, z_EA, z_EB)
#'
#' @seealso \code{\link{n_EA_E_and_p_AB_E2n_EB_E}}, \code{\link{p_EB_E2n_EB_E}} and
#'          \code{\link{n_EB_E2p_EB_E}}
#'
#' @references
#' Kenneth Gade \href{https://www.navlab.net/Publications/A_Nonsingular_Horizontal_Position_Representation.pdf}{A Nonsingular Horizontal Position Representation}.
#' \emph{The Journal of Navigation}, Volume 63, Issue 03, pp 395-417, July 2010.
#'
n_EA_E_and_n_EB_E2p_AB_E <- function(n_EA_E, n_EB_E, z_EA = 0, z_EB = 0,
  a = 6378137, f = 1.0 / 298.257223563) {
  p_EA_E <- n_EB_E2p_EB_E(n_EA_E, z_EA, a, f)
  p_EB_E <- n_EB_E2p_EB_E(n_EB_E, z_EB, a, f)
  p_AB_E <-  p_EB_E - p_EA_E
  p_AB_E
}