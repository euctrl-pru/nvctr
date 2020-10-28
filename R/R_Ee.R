#' Select the axes of the coordinate frame E
#'
#' This function returns the axes of the coordinate frame E (Earth-Centered,
#' Earth-Fixed, ECEF).
#'
#' There are two choices of E-axes that are described in Table 2 in Gade (2010):
#' \itemize{
#'   \item \code{e}: z-axis points to the North Pole and x-axis points to the point where
#'         latitude = longitude = 0. This choice is very common in many fields.
#'   \item \code{E}: x-axis points to the North Pole, y-axis points towards longitude +90deg
#'      (east) and latitude = 0. This choice of axis directions ensures
#'      that at zero latitude and longitude, N (North-East-Down) has the
#'      same orientation as E. If roll/pitch/yaw are zero, also B (Body,
#'      forward, starboard, down) has this orientation. In this manner, the
#'      axes of E is chosen to correspond with the axes of N and B.
#' }
#'
#' @param axes Either 'e' or 'E'
#'             \itemize{
#'                \item 'e': z-axis points to the North Pole along the Earth's rotation axis,
#'                      x-axis points towards the point where latitude = longitude = 0.
#'                      This choice is very common in many fields.
#'                \item 'E': x-axis points to the North Pole along the Earth's rotation axis,
#'                      y-axis points towards longitude +90deg (east) and latitude = 0.
#'                      (the yz-plane coincides with the equatorial plane).
#'                      This choice of axis ensures that at zero latitude and longitude,
#'                      frame N (North-East-Down) has the same orientation as frame E.
#'                      If roll/pitch/yaw are zero, also frame B (forward-starboard-down)
#'                      has this orientation. In this manner, the axes of frame E is
#'                      chosen to correspond with the axes of frame N and B.
#'                      The functions in this library originally used this option.
#'             }
#'
#' @return rotation matrix defining the axes of the coordinate frame E as
#'         described in Table 2 in Gade (2010)
#' @export
#'
#' @examples
#' R_Ee()
#'
#' @references
#' Kenneth Gade (2010) \href{https://www.navlab.net/Publications/A_Nonsingular_Horizontal_Position_Representation.pdf}{A Nonsingular Horizontal Position Representation}.
#' \emph{The Journal of Navigation}, Volume 63, Issue 03, pp 395-417, July 2010.

R_Ee <- function(axes = "e") {
  stopifnot(axes == "e" || axes == "E")
  if (axes == "e")
    matrix(
      c( 0, 0, 1,
         0, 1, 0,
        -1, 0, 0),
      nrow = 3, ncol = 3, byrow = TRUE)
  else
    matrix(
      c(1, 0, 0,
        0, 1, 0,
        0, 0, 1),
      nrow = 3, ncol = 3, byrow = TRUE)

}
