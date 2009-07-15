\name{read.xls}
\alias{read.xls}
\alias{xls2csv}
\alias{xls2tab}
\alias{xls2sep}
\title{Read Excel files}
\description{Reads a Microsoft Excel file into a data frame}
\usage{
read.xls(xls, sheet=1, verbose=FALSE, pattern, ...,
         method=c("csv","tab"), perl="perl")

xls2csv(xls, sheet=1, verbose=FALSE, ..., perl="perl")
xls2tab(xls, sheet=1, verbose=FALSE, ..., perl="perl")
xls2sep(xls, sheet=1, verbose=FALSE, ..., method=c("csv","tab"),
        perl="perl")
}
\arguments{
  \item{xls}{path to the Microsoft Excel file.  To access a file on the
    internet, start the path with "http://".}
  \item{sheet}{number of the sheet within the Excel file from which data
    are to be read}
  \item{verbose}{logical flag indicating whether details should be
    printed as the file is processed.}
  \item{pattern}{if specified, them skip all lines before the first 
    containing this string}
  \item{perl}{name of the perl executable to be called.}
  \item{method}{intermediate file format, "csv" for comma-separated and
    "tab" for tab-separated}
  \item{...}{additional arguments to read.table. The defaults of
    read.csv are used.}
}
\value{
  \code{"read.xls"} returns a data frame.

  \code{"xls2sep"} returns a temporary file in the specified format.  
  \code{"xls2csv"} and \code{"xls2tab"} are simply wrappers for
  \code{"xls2sep"} specifying method as "csv" or "tab", respectively.
}
\details{
  This function works translating the named Microsoft Excel file into a
  temporary .csv or .tab file, using the xls2csv or xls2tab
  Perl script installed as part of this (gdata) package.

  Caution: In the conversion to csv, strings will be quoted. This can be
    problem if you are trying to use the \code{comment.char} option of
  \code{read.table} since the first character of all lines (including
  comment lines) will be "\"" after conversion.

  Caution: If you call \code{"xls2csv"} directly, is your responsibility 
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

   iris <- read.xls(xlsfile) # defaults to csv format
   iris <- read.xls(xlsfile,method="csv") # specify csv format
   iris <- read.xls(xlsfile,method="tab") # specify tab format

   head(iris)  # look at the top few rows

   \dontshow{
   iris.1 <- read.xls(xlsfile) # defaults to csv format
   iris.2 <- read.xls(xlsfile,method="csv") # specify csv format
   iris.3 <- read.xls(xlsfile,method="tab") # specify tab format

   stopifnot(all.equal(iris.1, iris.2))
   stopifnot(all.equal(iris.1, iris.3))
   }


  \dontrun{
   # Example specifying exact Perl path for default MS-Windows install of
   # ActiveState perl
   iris <- read.xls(xlsfile, perl="C:/perl/bin/perl.exe")

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
