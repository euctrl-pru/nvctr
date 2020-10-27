#' Calculate the altitude, azimuth and distance of B from A
#'
#' The altitude (elevation from the horizon), azimuth and distance of a point B from A
#' are the coordinates of the Topocentric Coordinate System as typically used in astronomy to
#' aim your telescope to a heavenly body.
#' It can be also of use to know where an airplane is in the sky with respect to an observer
#' on Earth.
#'
#'
#' @param a the observer position: a vector of longitude, latitude (in decimal degrees) and
#'          altitude (in meters) in WGS84
#' @param b the observed position: a vector of longitude, latitude (in decimal degrees) and
#'          altitude (in meters) in WGS84
#'
#' @return the coordinates in North-East-Up of the observed, B, with respect to the
#'         observer A.
#'         A vector of \href{https://en.wikipedia.org/wiki/Horizontal_coordinate_system}{altitude}
#'         (elevation from the horizon) in decimal degrees,
#'         \href{https://en.wikipedia.org/wiki/Azimuth}{azimuth}) in decimal degrees and
#'         distance in meters.
#' @export
#' @family utilities
#'
#' @examples
#' \dontrun{
#' # sensor (longitude, latitude, altitude)
#' a <- c(49.47, 7.697, 274)
#' # aircraft (longitude, latitude, altitude)
#' b <- c(49.52, 7.803, 6401)
#' altitude_azimuth_distance(a, b)
#' }
altitude_azimuth_distance <- function(a, b) {
  # see example 1
  lat_EA <- rad(a[1])
  lon_EA <- rad(a[2])
  z_EA <- - a[3]
  lat_EB <- rad(b[1])
  lon_EB <- rad(b[2])
  z_EB <- - b[3]
  n_EA_E <- lat_lon2n_E(lat_EA, lon_EA)
  n_EB_E <- lat_lon2n_E(lat_EB, lon_EB)
  p_AB_E <-  n_EA_E_and_n_EB_E2p_AB_E(n_EA_E, n_EB_E, z_EA, z_EB)
  R_EN <- n_E2R_EN(n_EA_E)
  # AB vector in the North-East-Down reference frame
  p_AB_N <- base::t(R_EN) %*% p_AB_E %>% as.vector()

  altitude <- atan2(-p_AB_N[3], p_AB_N[2]) %>% deg()
  azimuth   <- atan2(p_AB_N[2], p_AB_N[1]) %>% deg()
  # line of sight distance
  distance <- norm(p_AB_N, type = "2")

  c(altitude, azimuth, distance)
}
