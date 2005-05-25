\name{is.what}
\alias{is.what}
\title{
  Run Multiple is.* Tests on a Given Object
}
\description{
  Run multiple \code{is.*} tests on a given object, such as
  \code{is.numeric()}, \code{is.list()}, ...
}
\usage{
is.what(object, verbose = FALSE)
}
\arguments{
  \item{object}{any R object.}
  \item{verbose}{whether negative tests should be included in output.}
}
\value{
  A character vector containing positive tests, or when \code{verbose}
  is \code{TRUE}, a data frame showing all test results.
}
\author{Arni Magnusson \email{arnima@u.washington.edu}, inspired by
  \code{demo(is.things)}.}
\seealso{
  \code{\link{is.na}} and \code{\link{is.numeric}} are commonly used
  tests.
}
\examples{
is.what(pi)
is.what(NA, verbose=TRUE)
is.what(lm(1~1))
}
% Basics
\keyword{classes}
\keyword{NA}
% Programming
\keyword{programming}
\keyword{error}
\keyword{utilities}
