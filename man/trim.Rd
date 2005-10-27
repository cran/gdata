\name{trim}
\alias{trim}
\title{Remove leading and trailing spaces from character strings}
\description{
 Remove leading and traling spaces from character strings
}
\usage{
trim(s)
}
\arguments{
  \item{s}{character string(s) to be processed}
}
\value{
  Elements of \code{s} with all leading and traling spaces removed.
}
\author{ Gregory R. Warnes \email{gregory.r.warnes@pfizer.com} }
\seealso{ \code{\link[base]{sub}}, \code{\link[base]{gsub}} }
\examples{
s <- "    this is an example string    "
trim(s)
}
\keyword{character}
