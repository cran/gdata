% runRUnitTests.Rd
%--------------------------------------------------------------------------
% What: Run RUnit tests - help
% $Id$
% Time-stamp: <2008-12-30 20:58:26 ggorjan>
%--------------------------------------------------------------------------

\name{.runRUnitTestsGdata}
\alias{.runRUnitTestsGdata}

\title{Run RUnit tests for the gdata package}

\description{

Run \pkg{RUnit} tests to perform the validity/unit testing of installed
\pkg{gdata} package on your own computer.

}

\usage{.runRUnitTestsGdata(testFileRegexp="^runit.+\\\\.[rR]$")}

\arguments{
  \item{testFileRegexp}{regular expression; see details}
}

\details{

Argument \code{testFileRegexp} can be used to specify different sets of
tests provided by the package. The following values are sensible:
\itemize{
  \item \code{"^runit.+\\\\.[rR]$"} for basic tests
}

}

\value{

None, just the print out of \pkg{RUnit} testing.

}

\seealso{
  \code{\link[RUnit]{defineTestSuite}} in \pkg{RUnit} package
}

\examples{
  ## Basic testing
  .runRUnitTestsGdata()
}

\keyword{misc}

%--------------------------------------------------------------------------
% runRUnitTests.Rd ends here
