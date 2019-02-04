#' Find R_EL from n-vector and wander azimuth angle.
#'
#' Calculates the rotation matrix (direction cosine matrix) R_EL using
#' n-vector (n_E) and the wander azimuth angle.
#' When wander_azimuth=0, we have that N=L (See Table 2 in Gade (2010) for
#' details)
#'
#' @param n_E n-vector decomposed in E (3x1 vector) (no unit)
#' @param wander_azimuth The angle between L's x-axis and north, pos about L's z-axis (rad)
#'
#' @return The resulting rotation matrix (3x3) (no unit)
#' @export
#'
#' @examples
#' \dontrun{
#' # Calculates the rotation matrix (direction cosine matrix) R_EL
#' # using n-vector (n_E) and the wander azimuth angle.
#' R_EL <-  n_E_and_wa2R_EL(n_E, wander_azimuth)
#' }
#'
n_E_and_wa2R_EL <- function(n_E, wander_azimuth) {
  lat_lon <- n_E2lat_lon(n_E)

  # Longitude, -latitude, and wander azimuth are the x-y-z Euler angles (about
  # new axes) for R_EL. See also the second paragraph of Section 5.2 in Gade (2010):

  # R_Ee() selects correct E-axes, see R_Ee.R for details
  R_EL <-  base::t(R_Ee()) %*% xyz2R(lat_lon[2], -lat_lon[1], wander_azimuth)
  R_EL
}