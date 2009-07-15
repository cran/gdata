% File src/library/utils/man/object.size.Rd
% Part of the R package, http://www.R-project.org
% Copyright 1995-2007 R Core Development Team
% Distributed under GPL 2 or later

\name{object.size}
\alias{object.size}
\alias{print.object_size}
\alias{c.object_size}
\alias{as.object_size}
\alias{is.object_size}

\title{Report the Space Allocated for an Object}
\description{
  Provides an estimate of the memory that is being used to store an \R object.
}
\usage{
object.size(\dots)

\method{print}{object_size}(x, quote=FALSE, humanReadable, \dots)
}
\arguments{
  \item{\dots}{\code{object.size}: \R objects; \code{print}; arguments 
    to be passed to or from other methods.}
  \item{x}{output from \code{object.size}}
  \item{quote}{logical, indicating whether or not the result should be
    printed with surrounding quotes.}
  \item{humanReadable}{logical, use the \dQuote{human readable} format.}
}
\details{

  This is a modified copy from the utils package in R as fo 2008-12-15.

  Exactly which parts of the memory allocation should be attributed to
  which object is not clear-cut.  This function merely provides a rough
  indication: it should be reasonably accurate for atomic vectors, but
  does not detect if elements of a list are shared, for example.
  (Sharing amongst elements of a character vector is taken into account,
  but not that between character vectors in a single object.)
  
  The calculation is of the size of the object, and excludes the space
  needed to store its name in the symbol table.

  Associated space (e.g. the environment of a function and what the
  pointer in a \code{EXTPTRSXP} points to) is not included in the
  calculation.

  Object sizes are larger on 64-bit platforms than 32-bit ones, but will
  very likely be the same on different platforms with the same word
  length and pointer size.

  % Modificitaion start
  Class of returned object is \code{c("byte", "numeric")} with
  appropriate \code{print} and \code{c} methods.

  By default \code{object.size} outputs size in bytes, but human
  readable format similar to \code{ls}, \code{df} or \code{du} shell
  commands can be invoked with \code{options(humanReadable=TRUE)}.
  % Modificitaion end

}
\value{
  An object of class \code{"object.size"} with a length-one double value,
  an estimate of the memory allocation attributable to the object in bytes.
}
\seealso{
  \code{\link{Memory-limits}} for the design limitations on object size.
  \code{\link{humanReadable}} for human readable format.
}

\examples{
object.size(letters)
object.size(ls)
## find the 10 largest objects in the base package
z <- sapply(ls("package:base"), function(x)
            object.size(get(x, envir = baseenv())))
(tmp <- as.matrix(rev(sort(z))[1:10]))

as.object_size(14567567)
options(humanReadable=TRUE)
(z <- object.size(letters, c(letters, letters), rep(letters, 100), rep(letters, 10000)))
is.object_size(z)
as.object_size(14567567)
}
\keyword{utilities}
