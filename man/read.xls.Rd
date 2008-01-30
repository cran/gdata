\name{read.xls}
\alias{read.xls}
\alias{xls2csv}
\title{Read Excel files}
\description{Reads a Microsoft Excel file into a data frame}
\usage{
read.xls(xls, sheet=1, verbose=FALSE, pattern, ..., perl="perl")
xls2csv(xls, sheet=1, verbose=FALSE, ..., perl="perl")
}
\arguments{
  \item{xls}{name of the Microsoft Excel file.  If on internet it
   should begin with code{"http://"}.}
  \item{sheet}{number of sheet within the Excel file from which data are
    to be read}
  \item{verbose}{logical flag indicating whether details should be
    printed as the file is processed.}
  \item{pattern}{if specified, them skip all lines before the first 
   containing this string}
  \item{perl}{name of the perl executable to be called.}
  \item{...}{additional arguments to read.table. The defaults of
    read.csv are used.}
}
\value{
  \code{"read.xls"} returns a data frame. \code{"xls2csv"} returns a 
  connection to a temporary file in csv format.
}
\details{
  This function works translating the named Microsoft Excel file into a
  temporary .csv file, using Greg Warnes' xls2csv Perl script (installed
  as part of the gregmisc package).

  Caution: In the conversion to csv, strings will be quoted. This can be
    problem if you are trying to use the \code{comment.char} option of
  \code{read.table} since the first character of all lines (including
  comment lines) will be "\"" after conversion.

  Caution: With \code{"xls2csv"} it is the responsibility of the user
   to close and delete the file after using it.
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

   # read xls file from net
   nba.url <- "http://lcb1.uoregon.edu/sergiok/DSC330HSP04/week5/NBA.xls"
   nba <- read.xls(nba.url)

   # read xls file ignoring all lines prior to first containing State
   crime.url <- "http://www.jrsainfo.org/jabg/state_data2/Tribal_Data00.xls"
   crime <- read.xls(crime.url, pattern = "State")

   # use of xls2csv - open con, print two lines, close con
   con <- xls2csv(nba.url)
   print(readLines(con, 2)) 
   file.remove(summary(con)$description)
   
   }
}
\author{Jim Rogers \email{james.a.rogers@pfizer.com}, modified
  and extended by Gregory R. Warnes \email{greg@random-technologies-llc.com} 
  Gabor Grothendiek \email{ggrothendieck@gmail.com}.
}
\keyword{file}
