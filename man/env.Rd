\name{env}
\alias{env}
\title{
  Display Information about All Loaded Environments
}
\description{
  Display name, number of objects, and size of all loaded environments.
}
\usage{
env(unit=c("KB","MB","bytes"), digits=0)
}
\arguments{
  \item{unit}{required unit for displaying environment size: "bytes",
    "KB", "MB", or first letter.}
  \item{digits}{number of decimals to display when rounding environment
    size.}
}
\details{
  A verbose alternative to \code{search()}.
}
\value{
  A data frame with the following columns:
  \item{Environment}{environment name.}
  \item{Objects}{number of objects in environment.}
  \item{KB}{environment size \emph{(see notes)}.}
}
\note{
  The name of the environment size column is the same as the unit used.
}
\author{Arni Magnusson \email{arnima@u.washington.edu}}
\seealso{
  \code{\link{search}} displays environment names.

  \code{\link{ll}} is related to \code{env}.
}
\examples{
\dontrun{
env()
}
}
% Basics
\keyword{data}
% Programming
\keyword{environment}
\keyword{utilities}
