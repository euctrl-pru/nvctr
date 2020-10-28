#' Convert n-vector to latitude and longitude
#'
#' @param n_E n-vector decomposed in E (3x1 vector) (no unit)
#'
#' @return A vector of geodetic latitude and longitude (rad)
#' @export
#'
#' @examples
#' n_E2lat_lon(c(1, 0, 0))
#'
#' @seealso \code{\link{lat_lon2n_E}}.
#'
#' @references
#' Kenneth Gade \href{https://www.navlab.net/Publications/A_Nonsingular_Horizontal_Position_Representation.pdf}{A Nonsingular Horizontal Position Representation}.
#' \emph{The Journal of Navigation}, Volume 63, Issue 03, pp 395-417, July 2010.
#'
n_E2lat_lon <- function(n_E) {
  check_length_deviation(n_E)
  n_E <- (R_Ee() %*% n_E) %>% # R_Ee selects correct E-axes, see R_Ee.R for details
    as.vector()

  # Equation (5) in Gade (2010):
  longitude <- atan2(n_E[2], -n_E[3])

  # Equation (6) in Gade (2010) (Robust numerical solution)
  equatorial_component <- sqrt(n_E[2] ^ 2 + n_E[3] ^ 2) # vector component in the equatorial plane
  latitude <- atan2(n_E[1], equatorial_component)       # atan() could also be used since latitude
                                                        # is within [-pi/2,pi/2]

  # latitude=asin(n_E(1)) is a theoretical solution, but close to the Poles it
  # is ill-conditioned which may lead to numerical inaccuracies (and it will give
  # imaginary results for norm(n_E)>1)

  c(latitude, longitude)
}
