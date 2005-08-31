% $Id: nobs.Rd,v 1.6 2005/06/09 14:20:25 nj7w Exp $
%
% $Log: nobs.Rd,v $
% Revision 1.6  2005/06/09 14:20:25  nj7w
% Updating the version number, and various help files to synchronize splitting of gregmisc bundle in 4 individual components.
%
% Revision 1.1.1.1  2005/05/25 22:07:33  nj7w
% Initial entry for individual package gdata
%
% Revision 1.5  2002/09/23 13:59:30  warnes
% - Modified all files to include CVS Id and Log tags.
%
% Revision 1.4  2002/03/26 19:29:15  warneg
%
% Updated to add ... parameter to function calls.
%
% Revision 1.3  2002/02/20 21:31:08  warneg
%
% Noted that specialized methods exist.
%
% Revision 1.2  2002/02/20 21:29:34  warneg
%
% Incorrectly had contents of nobs.R here instead of help text.  Corrected.
%
%

\name{nobs}
\alias{nobs}
\alias{nobs.default}
\alias{nobs.data.frame}
\alias{nobs.lm}
%- Also NEED an `\alias' for EACH other topic documented here.
\title{ Compute the Number of Non-missing Observations }
\description{
 Compute the number of non-missing observations.  Special methods exist for
 data frames, and lm objects.
}
\usage{
nobs(x, ...)
\method{nobs}{default}(x, ...)
\method{nobs}{data.frame}(x, ...)
\method{nobs}{lm}(x, ...)
}
\arguments{
  \item{x}{ Target Object }
  \item{\dots}{ Optional parameters (currently ignored)}
}
\details{

  In the simplest case, this is really just wrapper code for
  \code{sum(!is.na(x))}.
  
}
\value{
  A single numeric value or a vector of values (for data.frames) giving
  the number of non-missing values.
}
\author{ Gregory R. Warnes \email{gregory\_r\_warnes\@groton.pfizer.com}  }

\seealso{ \code{\link{is.na}}, \code{\link{length}} }

\examples{

x <- c(1,2,3,5,NA,6,7,1,NA )
length(x)
nobs(x)

df <- data.frame(x=rnorm(100), y=rnorm(100))
df[1,1] <- NA
df[1,2] <- NA
df[2,1] <- NA

nobs(df)
}
\keyword{attribute}
