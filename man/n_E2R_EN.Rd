% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/n_E2R_EN.R
\name{n_E2R_EN}
\alias{n_E2R_EN}
\title{Find the rotation matrix R_EN from n-vector}
\usage{
n_E2R_EN(n_E)
}
\arguments{
\item{n_E}{n-vector decomposed in E (3x1 vector) (no unit)}
}
\value{
The resulting rotation matrix (direction cosine matrix) (no unit)
}
\description{
Find the rotation matrix R_EN from n-vector
}
\examples{
n_E2R_EN(c(1, 0, 0))

}
\references{
Kenneth Gade \href{https://www.navlab.net/Publications/A_Nonsingular_Horizontal_Position_Representation.pdf}{A Nonsingular Horizontal Position Representation}.
\emph{The Journal of Navigation}, Volume 63, Issue 03, pp 395-417, July 2010.
}
\seealso{
\code{\link{R_EN2n_E}}, \code{\link{n_E_and_wa2R_EL}} and \code{\link{R_EL2n_E}}.
}
