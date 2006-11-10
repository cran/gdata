%% $Id: c.factor.Rd 993 2006-10-30 17:10:08Z ggorjan $

\name{c.factor}
\alias{c.factor}
\title{Combine factors, properly handling levels}
\description{
  This method for \code{c} combines factors while properly preserves level
  information.
}
\usage{
c.factor(..., recursive = FALSE)
}
\arguments{
  \item{\dots}{ factors to be combined }
  \item{recursive}{ ignored }
}
\details{
  
}
\value{
  A single factor object.  The levels on the new object are created by
  concatinating the levels of the provided factors, with any duplicate
  level names merged, and with the factor coding modified appropriately.
}
\author{Gregor Gorjan}
\seealso{ \code{\link[base]{c}} }
\examples{
f1 <- factor(letters[1:10])
f2 <- factor(letters[5:14])

c(f1,f2)

}
\keyword{manip}

