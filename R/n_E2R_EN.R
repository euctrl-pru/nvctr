#' Find the rotation matrix R_EN from n-vector
#'
#' @param n_E n-vector decomposed in E (3x1 vector) (no unit)
#'
#' @return The resulting rotation matrix (direction cosine matrix) (no unit)
#' @export
#'
#' @examples
#' n_E2R_EN(c(1, 0, 0))
#'
#' @seealso \code{\link{R_EN2n_E}}, \code{\link{n_E_and_wa2R_EL}} and \code{\link{R_EL2n_E}}.
#'
#' @references
#' Kenneth Gade \href{https://www.navlab.net/Publications/A_Nonsingular_Horizontal_Position_Representation.pdf}{A Nonsingular Horizontal Position Representation}.
#' \emph{The Journal of Navigation}, Volume 63, Issue 03, pp 395-417, July 2010.
#'
n_E2R_EN <- function(n_E) {
  check_length_deviation(n_E)

  n_E <- unit(R_Ee() %*% n_E) %>%  # Ensures unit length.
                                   # R_Ee selects correct E-axes, see R_Ee.m for details.
    as.vector()

  # N coordinate frame (North-East-Down) is defined in Table 2 in Gade (2010)
  # R_EN is constructed by the following three column vectors: The x, y and z
  # basis vectors (axes) of N, each decomposed in E.
  #
  # Find z-axis of N (Nz):
  Nz_E <- -n_E # z-axis of N (down) points opposite to n-vector

  # Find y-axis of N (East)(remember that N is singular at Poles)
  # Equation (9) in Gade (2010):
  Ny_E_direction <- pracma::cross(c(1, 0, 0), n_E) # Ny points perpendicular to the plane

  # formed by n-vector and Earth's spin axis
  if (pracma::Norm(Ny_E_direction) != 0)  { # outside Poles:
    Ny_E <- unit(Ny_E_direction)
  } else {                            # Pole position:
    Ny_E <- base::t(c(0, 1, 0)) %>% as.vector()   # selected y-axis direction
  }

  # Find x-axis of N (North):
  Nx_E <- pracma::cross(Ny_E, Nz_E)       # Final axis found by right hand rule

  # Form R_EN from the unit vectors:
  R_EN <- base::t(R_Ee()) %*% matrix(c(Nx_E, Ny_E, Nz_E),
    nrow = 3, ncol = 3, byrow = FALSE)  # R_Ee selects correct E-axes, see R_Ee.R for details
  R_EN
}

