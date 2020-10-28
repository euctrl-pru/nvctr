#' Convert n-vector to cartesian position vector in meters
#'
#' The function converts the position of B (typically body) relative to E (typically Earth),
#' the n-vector \code{n_EB_E} to cartesian position vector ("ECEF-vector"), \code{p_EB_E},
#' in meters.
#'
#' The calculation is exact, taking the ellipticity of the Earth into account.
#'
#' It is also nonsingular as both n-vector and p-vector are nonsingular
#' (except for the center of the Earth).
#' The default ellipsoid model used is WGS-84, but other ellipsoids (or spheres) might be specified
#' via the optional parameters \code{a} and \code{f}.
#'
#' @param n_EB_E n-vector of position B, decomposed in E (3x1 vector) (no unit)
#' @param z_EB   Depth of system B, relative to the ellipsoid (z_EB = -height) (m, default 0)
#' @param a      Semi-major axis of the Earth ellipsoid (m, default [WGS-84] 6378137)
#' @param f      Flattening of the Earth ellipsoid (no unit, default [WGS-84] 1/298.257223563)
#'
#' @return       Cartesian position vector from E to B, decomposed in E (3x1 vector) (m)
#' @export
#'
#' @examples
#' n_EB_E  <- lat_lon2n_E(rad(1), rad(2))
#' n_EB_E2p_EB_E(n_EB_E)
#'
#' @seealso \code{\link{p_EB_E2n_EB_E}}, \code{\link{n_EA_E_and_p_AB_E2n_EB_E}} and
#'          \code{\link{n_EA_E_and_n_EB_E2p_AB_E}}.
#'
#' @references
#' Kenneth Gade \href{https://www.navlab.net/Publications/A_Nonsingular_Horizontal_Position_Representation.pdf}{A Nonsingular Horizontal Position Representation}.
#' \emph{The Journal of Navigation}, Volume 63, Issue 03, pp 395-417, July 2010.
#'
n_EB_E2p_EB_E <- function(n_EB_E, z_EB = 0, a = 6378137, f = 1.0 / 298.257223563) {
  check_length_deviation(n_EB_E)
  n_EB_E <- unit(R_Ee() %*% n_EB_E) # ensure unit length and R_Ee selects correct E-axes

  # semi-minor axis:
  b = a * (1 - f)

  # The following code implements equation (22) in Gade (2010)

  denominator <- sqrt(n_EB_E[1]^2 + n_EB_E[2]^2 / (1-f)^2 + n_EB_E[3]^2 / (1-f)^2)

  # We first calculate the position at the origin of coordinate system L,
  # which has the same n-vector as B (n_EL_E = n_EB_E),
  # but lies at the surface of the Earth (z_EL = 0).

  p_EL_E <- c(
    b / denominator * n_EB_E[1],
    b / denominator * n_EB_E[2] / (1-f)^2,
    b / denominator * n_EB_E[3] / (1-f)^2)

  p_EB_E <- base::t(R_Ee()) %*% (p_EL_E - c(
    n_EB_E[1] * z_EB,
    n_EB_E[2] * z_EB,
    n_EB_E[3] * z_EB))
  p_EB_E %>% as.vector()
}