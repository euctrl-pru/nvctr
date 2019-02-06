#' Convert (geodetic) latitude and longitude to n-vector.
#'
#' @param latitude  Geodetic latitude (rad)
#' @param longitude Geodetic longitude (rad)
#'
#' @return n-vector decomposed in E (3x1 vector) (no unit)
#' @export
#'
#' @examples
#' \dontrun{
#' latitude <- rad(1)
#' longitude <- rad(2)
#' n_E <- lat_lon2n_E(latitude, longitude)
#' }
#' @seealso \code{\link{n_E2lat_lon}}.
lat_lon2n_E <- function(latitude, longitude) {
  (base::t(R_Ee()) %*% c(
     sin(latitude),
     sin(longitude) * cos(latitude),
    -cos(longitude) * cos(latitude))) %>%
  as.vector()
}
