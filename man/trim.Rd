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
  \item{s}{object to be processed}
}

\details{

\code{trim} is a generic function, where default method does nothing,
while method for character \code{s} trims its elements and method for
factor \code{s} trims \code{\link{levels}}. There are also methods for
\code{list} and \code{data.frame}.

}
\value{
  \code{s} with all leading and traling spaces removed in its elements.
}
\author{ Gregory R. Warnes \email{warnes@bst.rochester.edu} }
\seealso{ \code{\link[base]{sub}}, \code{\link[base]{gsub}} }
\examples{
s <- "    this is an example string    "
trim(s)

f <- c(s, s, " A", " B ", "  C ", "D ")
trim(f)

l <- list(s=rep(s, times=6), f=f, i=1:6)
trim(l)

df <- as.data.frame(l)
trim(df)

}
\keyword{character}
