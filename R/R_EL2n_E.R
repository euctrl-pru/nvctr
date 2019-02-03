#' Find n-vector from R_EL
#'
#' @param R_EL Rotation matrix (direction cosine matrix) (no unit)
#'
#' @return n-vector decomposed in E (3x1 vector) (no unit)
#' @export
#'
#' @examples
#' \dontrun{
#' R_EL2n_E(R_EL)
#' }
R_EL2n_E <- function(R_EL) {
  # n-vector equals minus the last column of R_EL and R_EN, see Section 5.5
  # in Gade (2010)
  n_E <- R_EL %*% (base::t(c(0, 0, -1)) %>% as.vector())
  n_E %>% as.vector()
}
