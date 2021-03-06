#'  Compute the along-track distance from a great circle arc
#'
#'  Compute the along-track distances of a body, `b` (for example a ground level projection
#'  position of an aircraft), from two geographical coordinates,
#'  `a1` and `a2` (for example an airport's runway thresholds), of a great circle arc.
#'
#' @param b  the geographical coordinates (WGS84) of a body:
#'           a vector of longitude, latitude (in decimal degrees) and
#'           eventually altitude (in meters)
#' @param a1 the geographical coordinates (WGS84) of one end of a great circle arc:
#'           a vector of longitude, latitude (in decimal degrees) and
#'           eventually altitude (in meters)
#' @param a2 the geographical coordinates (WGS84) of the other end of a great circle arc:
#'           a vector of longitude, latitude (in decimal degrees) and
#'           eventually altitude (in meters)
#'
#' @return the surface along-track distances from `b`'s cross-track intersection to `a1` - `a2`
#' @export
#' @family utilities
#'
#' @examples
#' \dontrun{
#' b <- c(8.086135, 49.973942, 6401)
#' # EDDF: 07R (longitude, latitude, altitude)
#' a1 <- c(8.53417, 50.0275, 328)
#' # EDDF: 25L
#' a2 <- c(8.58653, 50.0401, 362)
#' along_track_distance(b, a1, a2)
#' }
along_track_distance <- function(b, a1, a2) {
  x <- cross_track_intersection(b, a1, a2)
  d1 <- geosphere::distGeo(x, a1[1:2])
  d2 <- geosphere::distGeo(x, a2[1:2])
  c(d1, d2)
}
