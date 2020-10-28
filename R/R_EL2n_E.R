#' Find n-vector from the rotation matrix (direction cosine matrix) \code{R_EL}
#'
#' @param R_EL Rotation matrix (direction cosine matrix) (no unit)
#'
#' @return n-vector decomposed in E (3x1 vector) (no unit)
#' @export
#'
#' @examples
#' R_EL <- matrix(
#'    c(-1, 0,  0,
#'       0, 1,  0,
#'       0, 0, -1),
#'    nrow = 3, ncol = 3, byrow = TRUE)
#' R_EL2n_E(R_EL)
#'
#' @seealso \code{\link{n_E2R_EN}}, \code{\link{R_EL2n_E}} and \code{\link{n_E_and_wa2R_EL}}.
#'
#' @references
#' Kenneth Gade \href{https://www.navlab.net/Publications/A_Nonsingular_Horizontal_Position_Representation.pdf}{A Nonsingular Horizontal Position Representation}.
#' \emph{The Journal of Navigation}, Volume 63, Issue 03, pp 395-417, July 2010.
#'
R_EL2n_E <- function(R_EL) {
  # n-vector equals minus the last column of R_EL and R_EN, see Section 5.5
  # in Gade (2010)
  n_E <- R_EL %*% (base::t(c(0, 0, -1)) %>% as.vector())
  n_E %>% as.vector()
}
