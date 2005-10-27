% $Id: drop.levels.Rd,v 1.3 2005/12/01 16:39:39 nj7w Exp $
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
\author{Jim Rogers \email{james.a.rogers@pfizer.com}}
\keyword{manip}
