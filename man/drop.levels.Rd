% $Id: drop.levels.Rd,v 1.1 2005/04/02 04:19:18 warnes Exp $
%
\name{drop.levels}
\alias{drop.levels}
\title{Drop unused factor levels}
\description{Drop unused factor levels for every factor variable in a data frame.
}
\usage{
drop.levels(x, reorder = TRUE, ...)
}
\arguments{
  \item{x}{a data frame}
  \item{reorder}{should factor levels be reordered using
    \code{\link{reorder.factor}}?}
  \item{...}{additional arguments to \code{reorder.factor}}
}
\value{a data frame
}
\author{Jim Rogers \email{james\_a\_rogers@groton.pfizer.com}}
\keyword{manip}
