#' Find n-vector from R_E
#'
#' @param R_EN Rotation matrix (direction cosine matrix) (no unit)
#'
#' @return n-vector decomposed in E (3x1 vector) (no unit)
#' @export
#'
#' @seealso \code{\link{n_E2R_EN}}, \code{\link{R_EL2n_E}} and \code{\link{n_E_and_wa2R_EL}}.
#'
#' @examples
#' R_EN <- matrix(
#'    c(-1, 0,  0,
#'       0, 1,  0,
#'       0, 0, -1),
#'    nrow = 3, ncol = 3, byrow = TRUE)
#' R_EL2n_E(R_EN)
#'
#' @references
#' Kenneth Gade \href{https://www.navlab.net/Publications/A_Nonsingular_Horizontal_Position_Representation.pdf}{A Nonsingular Horizontal Position Representation}.
#' \emph{The Journal of Navigation}, Volume 63, Issue 03, pp 395-417, July 2010.
#'
R_EN2n_E <- function(R_EN) {
  # n-vector equals minus the last column of R_EL and R_EN, see Section 5.5 in Gade (2010)
  n_E <- R_EN %*% (base::t(c(0, 0, -1)) %>% as.vector())
  n_E %>% as.vector()
}
