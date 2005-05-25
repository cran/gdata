\name{keep}
\alias{keep}
\title{
  Remove All Objects, Except Those Specified
}
\description{
  Remove all objects from the default workspace, except those specified.
}
\usage{
keep(..., list = character(0), sure = FALSE)
}
\arguments{
  \item{...}{objects to be kept, specified one by one, quoted or
    unquoted.}
  \item{list}{character vector of object names to be kept.}
  \item{sure}{whether to perform the removal, otherwise return names of
    objects that would have been removed.}
}
\details{
  Convenient interface to \code{rm()} when removing most objects from
  the default workspace.

  Implemented with a few safety caps: objects whose name starts with a
  period \sQuote{\code{.}} are not removed, and \code{sure=TRUE} is
  required to perform the removal.
}
\value{
  A character vector containing object names, or \code{NULL} when
  \code{sure} is \code{TRUE}.
}
\author{Arni Magnusson \email{arnima@u.washington.edu}}
\seealso{
  \code{\link{rm}}.
}
\examples{
data(women, cars)
keep(cars)
## To remove all objects except cars, run:
## keep(cars, sure=TRUE)
}
% Programming
\keyword{data}
\keyword{environment}
\keyword{utilities}
