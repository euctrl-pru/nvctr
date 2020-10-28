#' Convert cartesian position vector in meters to n-vector
#'
#' The position of B (typically body) relative to E (typically Earth) is given
#' as cartesian position vector p_EB_E, in meters ("ECEF-vector").
#'
#' The function converts to n-vector, n_EB_E and its depth, z_EB.
#'
#' The calculation is exact, taking the ellipticity of the Earth into account.
#' It is also nonsingular as both n-vector and p-vector are nonsingular
#' (except for the center of the Earth).
#' The default ellipsoid model used is WGS-84, but other ellipsoids (or spheres) might be specified.

#'
#' @param p_EB_E Cartesian position vector from E to B, decomposed in E (3x1 vector) (m)
#' @param a      Semi-major axis of the Earth ellipsoid (m, default [WGS-84] 6378137)
#' @param f      Flattening of the Earth ellipsoid (no unit, default [WGS-84] 1/298.257223563)
#'
#' @return n-vector representation of position B, decomposed in E (3x1 vector) (no unit) and
#'         depth of system B relative to the ellipsoid (z_EB = -height)
#' @export
#'
#' @examples
#' p_EB_E <- 6371e3 * c(0.9, -1, 1.1)
#' (n_EB_E <- p_EB_E2n_EB_E(p_EB_E))
#'
#' @seealso \code{\link{n_EB_E2p_EB_E}}, \code{\link{n_EA_E_and_p_AB_E2n_EB_E}} and
#'          \code{\link{n_EA_E_and_n_EB_E2p_AB_E}}
#'
#' @references
#' Kenneth Gade \href{https://www.navlab.net/Publications/A_Nonsingular_Horizontal_Position_Representation.pdf}{A Nonsingular Horizontal Position Representation}.
#' \emph{The Journal of Navigation}, Volume 63, Issue 03, pp 395-417, July 2010.
#'
p_EB_E2n_EB_E <- function(p_EB_E, a = 6378137, f = 1/298.257223563) {
  p_EB_E <- R_Ee() %*% p_EB_E

  # e_2 = eccentricity^2
  e_2 <- 2 * f - f^2 # = 1-b^2/a^2


  # The following code implements equation (23) from Gade (2010):

  R_2 <- p_EB_E[2]^2 + p_EB_E[3]^2
  R <- sqrt(R_2) # R = component of p_EB_E in the equatorial plane

  p <- R_2 / a^2
  q <- (1 - e_2) / (a^2)  * p_EB_E[1]^2
  r <- (p + q - e_2^2) / 6

  s <- e_2^2 * p * q / (4 * r^3)
  t <- pracma::nthroot((1 + s + sqrt(s * (2 + s))), 3)
  u <- r * (1 + t + 1 / t)
  v <- sqrt(u^2 + e_2^2 * q)

  w <- e_2 * (u + v - q) / (2 * v)
  k <- sqrt(u + v + w^2) - w
  d <- k * R / (k + e_2)

  # Calculate height:
  height <- (k + e_2 - 1) / k  * sqrt(d^2 + p_EB_E[1]^2)

  temp <- 1 / sqrt(d^2 + p_EB_E[1]^2)

  n_EB_E_x <- temp * p_EB_E[1]
  n_EB_E_y <- temp * k / (k + e_2) * p_EB_E[2]
  n_EB_E_z <- temp * k / (k + e_2) * p_EB_E[3]

  n_EB_E <- c(n_EB_E_x, n_EB_E_y, n_EB_E_z)

  # Ensure unit length:
  n_EB_E <- unit(base::t(R_Ee()) %*% n_EB_E) %>% as.vector()

  z_EB <- -height
  list(n_EB_E = n_EB_E, z_EB = z_EB)
}