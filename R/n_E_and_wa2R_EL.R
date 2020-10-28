#' Find \code{R_EL} from n-vector and wander azimuth angle
#'
#' Calculate the rotation matrix (direction cosine matrix) \code{R_EL} using
#' n-vector (\code{n_E}) and the wander azimuth angle.
#' When \code{wander_azimuth = 0}, we have that N = L (See Table 2 in Gade (2010) for
#' details)
#'
#' @param n_E n-vector decomposed in E (3x1 vector) (no unit)
#' @param wander_azimuth The angle between L's x-axis and north, positive about L's z-axis (rad)
#'
#' @return The resulting rotation matrix (3x3) (no unit)
#' @export
#'
#' @examples
#' # Calculates the rotation matrix (direction cosine matrix) R_EL
#' # using n-vector (n_E) and the wander azimuth angle.
#' n_E <- c(1, 0, 0)
#' (R_EL <-  n_E_and_wa2R_EL(n_E, wander_azimuth = pi / 2))
#'
#' @seealso \code{\link{R_EL2n_E}}, \code{\link{R_EN2n_E}} and \code{\link{n_E2R_EN}}.
#'
#' @references
#' Kenneth Gade \href{https://www.navlab.net/Publications/A_Nonsingular_Horizontal_Position_Representation.pdf}{A Nonsingular Horizontal Position Representation}.
#' \emph{The Journal of Navigation}, Volume 63, Issue 03, pp 395-417, July 2010.
#'
n_E_and_wa2R_EL <- function(n_E, wander_azimuth) {
  lat_lon <- n_E2lat_lon(n_E)

  # Longitude, -latitude, and wander azimuth are the x-y-z Euler angles (about
  # new axes) for R_EL. See also the second paragraph of Section 5.2 in Gade (2010):

  # R_Ee() selects correct E-axes, see R_Ee.R for details
  R_EL <-  base::t(R_Ee()) %*% xyz2R(lat_lon[2], -lat_lon[1], wander_azimuth)
  R_EL
}