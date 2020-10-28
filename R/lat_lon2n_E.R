#' Convert (geodetic) latitude and longitude to n-vector
#'
#' @param latitude  Geodetic latitude (rad)
#' @param longitude Geodetic longitude (rad)
#'
#' @return n-vector decomposed in E (3x1 vector) (no unit)
#' @export
#'
#' @examples
#' lat_lon2n_E(rad(1), rad(2))
#'
#' @seealso \code{\link{n_E2lat_lon}}.
#'
#' @references
#' Kenneth Gade \href{https://www.navlab.net/Publications/A_Nonsingular_Horizontal_Position_Representation.pdf}{A Nonsingular Horizontal Position Representation}.
#' \emph{The Journal of Navigation}, Volume 63, Issue 03, pp 395-417, July 2010.
#'
lat_lon2n_E <- function(latitude, longitude) {
  (base::t(R_Ee()) %*% c(
     sin(latitude),
     sin(longitude) * cos(latitude),
    -cos(longitude) * cos(latitude))) %>%
  as.vector()
}
