% $Id: combine.Rd,v 1.2 2002/09/23 13:59:30 warnes Exp $
%
% $Log: combine.Rd,v $
% Revision 1.2  2002/09/23 13:59:30  warnes
% - Modified all files to include CVS Id and Log tags.
%
%

\name{combine}
\alias{combine}
\title{ Combine R Objects With a Column Labeling the Source}
\description{
     Take a sequence of vector, matrix or data frames and
     combine into rows of a common data frame with an additional column
     \code{source} indicating the source object.
}
\usage{
combine(..., names=NULL)
}
\arguments{
  \item{\dots}{vectors or matrices to combine.}
  \item{names}{character vector of names to use when creating source column.}
}
\details{
     If there are several matrix arguments, they must all have the same
     number of columns.  The number of columns in the result will be one
     larger than the number of columns in the component matrixes. If all
     of the arguments are vectors, these are treated as single column
     matrixes.  In this case, the column containing the combineinated
     vector data is labeled \code{data}.
     
     When the arguments consist of a mix of matrices and vectors the
     number of columns of the result is determined by the number
     of columns of the matrix arguments.  Vectors are considered row
     vectors and have their values recycled or subsetted (if necessary)
     to achieve this length.

     The \code{source} column is created as a factor with levels
     corresponding to the name of the object from which the each row was
     obtained.  When the \code{names} argument is ommitted, the name of
     each object is obtained from the specified argument name in the
     call (if present) or from the name of the object.  See below for
     examples.
}
% \value{
%   ~Describe the value returned
%   If it is a LIST, use
%   \item{comp1 }{Description of `comp1'}
%   \item{comp2 }{Description of `comp2'}
%   ...
% }
%\references{ ~put references to the literature/web site here ~ }
\author{Gregory R. Warnes \email{Gregory\_R\_Warnes@groton.pfizer.com}}
%\note{ ~~further notes~~ }
\seealso{ \code{\link{rbind}}, \code{\link{merge}}}

\examples{

a  <-  matrix(rnorm(12),ncol=4,nrow=3)
b  <-  1:4
combine(a,b)

combine(x=a,b)
combine(x=a,y=b)
combine(a,b,names=c("one","two"))

c <- 1:6
combine(b,c)
}

\keyword{array}
\keyword{manip}

