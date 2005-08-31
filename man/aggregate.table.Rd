% $Id: aggregate.table.Rd,v 1.6 2005/06/09 14:20:25 nj7w Exp $
%
% $Log: aggregate.table.Rd,v $
% Revision 1.6  2005/06/09 14:20:25  nj7w
% Updating the version number, and various help files to synchronize splitting of gregmisc bundle in 4 individual components.
%
% Revision 1.1.1.1  2005/05/25 22:07:33  nj7w
% Initial entry for individual package gdata
%
% Revision 1.5  2003/11/17 22:09:00  warnes
% Fix syntax error.
%
% Revision 1.4  2003/06/07 17:58:37  warnes
%
% - Fixed error in examples.  Had sqrt(var(x)/(n-1)) for the standard
%   error of the mean instead of sqrt(var(x)/n).
%
% Revision 1.3  2002/09/23 13:59:30  warnes
% - Modified all files to include CVS Id and Log tags.
%
%

\name{aggregate.table}
\alias{aggregate.table}
\title{Create 2-Way Table of Summary Statistics}
\description{
  Splits the data into subsets based on two factors, computes a summary
  statistic on each subset, and arranges the results in a 2-way table.
}
\usage{
aggregate.table(x, by1, by2, FUN=mean, ...)
}
%- maybe also `usage' for other objects documented here.
\arguments{
  \item{x}{ data to be summarized }
  \item{by1}{ first grouping factor.  }
  \item{by2}{ second grouping factor. }
  \item{FUN}{ a scalar function to compute the summary statistics which can
          be applied to all data subsets. Defaults to \code{mean}.}
  \item{\dots}{ Optional arguments for \code{FUN}. }
}
%\details{
%  ~~ If necessary, more details than the __description__  above ~~
%}
\value{
  Returns a matrix with one element for each combination of \code{by1}
  and \code{by2}.
}
\author{ Gregory R. Warnes \email{gregory\_r\_warnes\@groton.pfizer.com}}

\seealso{ \code{\link{aggregate}}, \code{\link{tapply}},
          \code{\link{interleave}} }

\examples{
# Useful example:
#
# Create a 2-way table of means, standard errors, and # obs

g1 <- sample(letters[1:5], 1000, replace=TRUE)
g2 <- sample(LETTERS[1:3], 1000, replace=TRUE )
dat <- rnorm(1000)

stderr <- function(x) sqrt( var(x,na.rm=TRUE) / nobs(x) )

means   <- aggregate.table( dat, g1, g2, mean )
stderrs <- aggregate.table( dat, g1, g2, stderr )
ns      <- aggregate.table( dat, g1, g2, nobs )
blanks <- matrix( " ", nrow=5, ncol=3)

tab <- interleave( "Mean"=round(means,2),
                   "Std Err"=round(stderrs,2),
                   "N"=ns, " " = blanks, sep=" " )

print(tab, quote=FALSE)
}
\keyword{iteration}
\keyword{category}

