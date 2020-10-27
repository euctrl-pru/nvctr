#' Calculate cross-track intersection
#'
#' Calculate the cross-track intersection between the position of a body (i.e. an aircraft) and
#' a great circle arc as defined by two points (i.e. the runway's thresholds).
#'
#' The cross-track intersection between the position of a body, B, (i.e. an aircraft) and
#' a great circle arc as defined by two points, A1 and A2, (i.e. the runway's thresholds)
#' is the intersection, X, of the above arc with the great circle arc passing through
#' the ground projection of B, G, and perpendicular to A1-A2.
#'
#' \if{html}{\figure{cross-track.svg}{options: width="80\%" alt="cross-track intersection"}}
#' \if{latex}{\figure{cross-track.png}{options: width=5cm}}
#'
#' @param b  coordinates of the body, b:
#'           a vector of longitude, latitude (in decimal degrees) and altitude (in meters) in WGS84
#' @param a1 first coordinate of a great circle arc:
#'           a vector of longitude, latitude (in decimal degrees) and elevation (in meters) in WGS84
#' @param a2 second coordinate of a great circle arc:
#'           a vector of longitude, latitude (in decimal degrees) and elevation (in meters) in WGS84
#'
#' @return a WGS84 vector with longitude and latitude (decimal degrees)
#' @export
#' @family utilities
#'
#' @examples
#' \dontrun{
#' # aircraft (longitude, latitude, altitude)
#' b <- c(8.086135, 49.973942, 6401)
#' # EDDF: 07R (longitude, latitude, altitude)
#' a1 <- c(8.53417, 50.0275, 328)
#' # EDDF: 25L
#' a2 <- c(8.58653, 50.0401, 362)
#' cross_track_intersection(b, a1, a2)
#' }
cross_track_intersection <- function(b, a1, a2) {
  a1_lon <- a1[1]
  a1_lat <- a1[2]

  a2_lon <- a2[1]
  a2_lat <- a2[2]

  b_lon <- b[1]
  b_lat <- b[2]

  n_EA1_E <- nvctr::lat_lon2n_E(nvctr::rad(a1_lat), nvctr::rad(a1_lon))
  n_EA2_E <- nvctr::lat_lon2n_E(nvctr::rad(a2_lat), nvctr::rad(a2_lon))
  n_EB_E <- nvctr::lat_lon2n_E(nvctr::rad(b_lat), nvctr::rad(b_lon))

  # Find the normal to the great circle between n_EA1_E and n_EA2_E
  n_ED_E <- nvctr::unit(pracma::cross(n_EA1_E, n_EA2_E))

  # Find possible intersection point
  n_EC_E_tmp <- nvctr::unit(
    pracma::cross(
      n_ED_E,
      pracma::cross(n_ED_E, n_EB_E)
    )
  )

  # choose the one closest to B
  n_EC_E <- sign(pracma::dot(n_EC_E_tmp, n_EB_E)) * n_EC_E_tmp
  x  <- nvctr::n_E2lat_lon(n_EC_E) %>% nvctr::deg() %>% `names<-`(c("latitude", "longitude"))
  x <- c(x[2], x[1])
  x
}
