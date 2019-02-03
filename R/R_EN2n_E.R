#' Find n-vector from R_E
#'
#' @param R_EN Rotation matrix (direction cosine matrix) (no unit)
#'
#' @return n-vector decomposed in E (3x1 vector) (no unit)
#' @export
#'
#' @examples
#' \dontrun{
#' R_EN2n_E(R_EN)
#' }
R_EN2n_E <- function(R_EN) {
  # n-vector equals minus the last column of R_EL and R_EN, see Section 5.5 in Gade (2010)
  n_E <- R_EN %*% (base::t(c(0, 0, -1)) %>% as.vector())
  n_E %>% as.vector()
}
