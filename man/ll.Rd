\name{ll}
\alias{ll}
\title{
  Display Information about Objects or Elements
}
\description{
  Display name, class, size, and dimensions of each object in a given
  environment. Alternatively, if the main argument is a list-like
  object, its elements are listed and described.
}
\usage{
ll(pos=1, unit=c("KB","MB","bytes"), digits=0, dimensions=FALSE,
   function.dim="", sort.elements=FALSE, ...)
}
\arguments{
  \item{pos}{environment position number, environment name, data frame,
    list, model, or any object that \code{is.list()}.}
  \item{unit}{required unit for displaying object size: "bytes", "KB",
    "MB", or first letter.}
  \item{digits}{number of decimals to display when rounding object
    size.}
  \item{dimensions}{whether object dimensions should be returned.}
  \item{function.dim}{value to report as the dimension of function
    objects.}
  \item{sort.elements}{whether elements should be sorted by name.}
  \item{...}{passed to \code{ls()}.}
}
\details{
  A verbose alternative to \code{ls()} and \code{names()}.
}
\value{
  A data frame with named rows and the following columns:
  \item{Class}{object class.}
  \item{KB}{object size \emph{(see notes)}.}
  \item{Dim}{object dimensions \emph{(optional)}.}
}
\note{
  The name of the object size column is the same as the unit used.
}

\author{Arni Magnusson \email{arnima@u.washington.edu}, with a
  contribution by Jim Rogers
  \email{james.a.rogers@pfizer.com}}

\seealso{
  \code{\link{ls}} displays names of objects in a given environment.

  \code{\link[base]{names}}, \code{\link[utils]{str}}, and
  \code{\link[base]{summary}} display different information about
  list-like elements.

  \code{\link{env}} is related to \code{ll}.
}
\examples{
ll()
ll(all=TRUE)
ll("package:base")
ll("package:base")[ll("package:base")$Class!="function",]

data(infert)
ll(infert)
model <- glm(case~spontaneous+induced, family=binomial, data=infert)
ll(model, dim=TRUE)
ll(model, sort=TRUE)
ll(model$family)
}
% Basics
\keyword{data}
\keyword{attribute}
\keyword{classes}
\keyword{list}
% Programming
\keyword{environment}
\keyword{print}
\keyword{utilities}
