\name{read.xls}
\alias{read.xls}
\title{Read Excel files}
\description{Reads a Microsoft Excel file into a data frame}
\usage{
read.xls(xls, sheet=1, verbose=FALSE, ..., perl="perl")
}
\arguments{
  \item{xls}{name of the Microsoft Excel file}
  \item{sheet}{number of sheet within the Excel file from which data are
    to be read}
  \item{verbose}{logical flag indicating whether details should be
    printed as the file is processed.}
  \item{perl}{name of the perl executable to be called.}
  \item{...}{additional arguments to read.table. The defaults of
    read.csv are used.}
}
\value{
  a data frame
}
\details{
  This function works translating the named Microsoft Excel file into a
  temporary .csv file, using Greg Warnes' xls2csv Perl script (installed
  as part of the gregmisc package).

  Caution: In the conversion to csv, strings will be quoted. This can be
    problem if you are trying to use the \code{comment.char} option of
  \code{read.table} since the first character of all lines (including
  comment lines) will be "\"" after conversion.
}
\references{http://www.analytics.washington.edu/statcomp/downloads/xls2csv}
\note{ Either a working version of Perl must be present in the executable
  search path, or the exact path of the perl executable must be provided
  via the \code{perl} argument.  See the examples below for an illustration.}
\seealso{ \code{\link[base]{read.csv}} }
\examples{

   # iris.xls is included in the gregmisc package for use as an example
   xlsfile <- file.path(.path.package('gdata'),'xls','iris.xls')
   xlsfile

   iris <- read.xls(xlsfile)
   head(iris)  # look at the top few rows

  \dontrun{
   # Example specifying exact Perl path for default MS-Windows install of
   # ActiveState perl
   iris <- read.xls(xlsfile, perl="C:\\perl\bin\perl.exe")

   # Example specifying exact Perl path for Unix systems
   iris <- read.xls(xlsfile, perl="/usr/bin/perl")
   }
}
\author{Jim Rogers \email{james.a.rogers@pfizer.com}, modified
  and extended by Gregory R. Warnes \email{gregory.r.warnes@pfizer.com}.
}
\keyword{file}
