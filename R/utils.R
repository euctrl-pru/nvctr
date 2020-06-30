#' Convert angle in degrees to radians.
#'
#' @param degrees angle in degrees.
#'
#' @return angle in radians
#' @export
#' @family helpers
#'
#' @seealso \code{\link{deg}}.
#'
#' @examples
#' rad(30)
rad <- function(degrees) {
  degrees * pi / 180
}

#' Convert angle in radians to degrees
#'
#' @param radians angle in radians.
#'
#' @return angle in degrees.
#' @export
#' @family helpers
#'
#' @seealso \code{\link{rad}}.
#'
#' @examples
#' deg(pi/2)
deg <- function(radians) {
  radians * 180 / pi
}

check_length_deviation <- function(n_E) {
  # length_deviation_warning_limit = 0.1; % n-vector should have length=1
  # % i.e. norm(n_E)=1. A deviation from 1 exceeding this limit gives a warning.
  # % This function only depends of the direction of n-vector, thus the warning
  # % is included only to give a notice in cases where a wrong input is given
  # % unintentionally (i.e. the input is not even approximately a unit vector).
  #
  # length_deviation=abs(norm(n_E(:,1))-1); % If a matrix of n-vectors is input,
  # % only the first n-vector is controlled to save time (assuming advanced
  #   % users input correct n-vectors)
  #
  # if length_deviation>length_deviation_warning_limit,
  # warning('n_E2lat_long: norm(n_E)~=1 ! Error is: %g',length_deviation);
  # end
}


#' Make input vector unit length, i.e. norm == 1
#'
#' @param vector a vector
#'
#' @return a unit length vector
#'
#' @export
#' @family helpers
#'
#' @examples
#' unit(c(1,2,3))
#'
unit <- function(vector) {
  sumsquared <- sum(vector ^ 2)
  if (sumsquared == 0) return(c(1, 0, 0))
  vector / sqrt(sumsquared)
}
