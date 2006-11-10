% write.fwf.Rd
%--------------------------------------------------------------------------
% What: Write fixed width format man page
% $Id: write.fwf.Rd 1001 2006-10-30 22:54:51Z ggorjan $
% Time-stamp: <2006-10-30 23:52:00 ggorjan>
%--------------------------------------------------------------------------

\name{write.fwf}

\alias{write.fwf}

\concept{data output}
\concept{data export}

\title{Write object in fixed width format}

\description{
\code{write.fwf} writes object in *f*ixed *w*idth *f*ormat.
}

\usage{

write.fwf(x, file="", append=FALSE, quote=FALSE, sep=" ", na="",
  rownames=FALSE, colnames=TRUE, rowCol=NULL, justify="right",
  formatInfo=FALSE, quoteInfo=TRUE, \ldots)

}

\arguments{
  \item{x}{data.frame or matrix, the object to be written}
  \item{file}{character, name of file or connection, look in
    \code{\link{write.table}} for more}
  \item{append}{logical, append to existing data in \code{file}}
  \item{quote}{logical, quote data in output}
  \item{na}{character, the string to use for missing values
    i.e. \code{NA} in the output}
  \item{sep}{character, separator between columns in output}
  \item{rownames}{logical, print row names}
  \item{colnames}{logical, print column names}
  \item{rowCol}{character, rownames column name}
  \item{justify}{character, allignment of character columns}
  \item{formatInfo}{logical, return information on number of levels,
    widths and format}
  \item{quoteInfo}{logical, should \code{formatInfo} account for quotes}
  \item{\ldots}{further arguments to \code{\link{format.info}},
    \code{\link{format}} and \code{\link{write.table}}}
}

\details{

Output is similar to \code{print(x)} or \code{format(x)}. Formating is
done completely by \code{\link{format}} on a column basis. Columns in
the output are by default separated with a space i.e. empty column with
a width of one character, but that can be changed with \code{sep}
argument as passed to \code{\link{write.table}} via \ldots.

\code{quote} can be used to quote fields in the output. Since all
columns of \code{x} are converted to character during the output, all
columns will be quoted! The following is needed for \code{read.fwf} or
any other tools outside \R. If quotes are used, \code{\link{read.table}}
can be easily used to read the data back into \R. Check examples. Do read
details on \code{quoteInfo}.

Use only *true* character i.e. not "\t" or similar for \code{sep} as
number of characters in \code{sep} is needed internally.

Use \code{na} to convert missing/unknown values. Only single value can
be specified. Take a look at \code{\link{NAToUnknown}} if you need
greater flexibility.

If \code{rowCol} is not \code{NULL} and \code{rownames=TRUE} rownames
will also have column name with \code{rowCol} value. This is mainly for
flexibility with tools outside \R. Note that (at least in \R 2.4.0) it
is not "easy" to import data back to \R with \code{\link{read.fwf}} if
you also export rownames. That is the reason, that default is
\code{rownames=FALSE}.

Information about format of output can be returned if
\code{formatInfo=TRUE}. Returned value is described in value
section. Result is provided by \code{\link{format.info}} and care was
taken to handle numeric properly. If output contains rownames, returned
value accounts for this. Additionally, if \code{rowCol} is not
\code{NULL} then returned value contains also information about format
of rownames.

If \code{quote=TRUE} output is wider due to quotes. Return value (with
\code{formatInfo=TRUE}) can account for this in two ways; controlled
with argument \code{quoteInfo}. However, note that there is no way to
properly read data back to \R if \code{quote=TRUE & quoteInfo=FALSE} was
specifed for export. \code{quoteInfo} applies only when
\code{quote=TRUE}. Assume there is a file with quoted data as shown
bellow (column numbers in first three line are only for demonstration of
the values in the output).

\preformatted{
123456789 12345678 # for position
123 1234567 123456 # for width with quoteInfo=TRUE
 1   12345   1234  # for width with quoteInfo=FALSE
"a" "hsgdh" "   9"
" " "   bb" " 123"
}

With \code{quoteInfo=TRUE} \code{write.fwf} will return (symbolically)

\preformatted{
colname position width
V1             1     3
V2             5     7
V3            13     6
}

or (with \code{quoteInfo=FALSE})

\preformatted{
colname position width
V1             2     1
V2             6     5
V3            14     4
}

}

\value{

Besides its effect to write/export data \code{write.fwf} can provide
information on format and width. A data.frame is returned with the
following columns:
  \item{colname}{name of the column}
  \item{nlevels}{number of unique values (unused levels of factors are
    dropped), 0 for numeric column}
  \item{position}{starting column number in the output}
  \item{width}{width of the column}
  \item{digits}{number of digits after the decimal point}
  \item{exp}{width of exponent in exponential representation; 0 means
    there is no exponential representation, while 1 represents exponent
    of length one i.e. \code{1e+6} and 2 \code{1e+06} or \code{1e+16}}
}

\author{Gregor Gorjanc}

\seealso{
  \code{\link{format.info}}, \code{\link{format}},
  \code{\link{NAToUnknown}}, \code{\link{write.table}},
  \code{\link{read.fwf}}, \code{\link{read.table}} and
  \code{\link{trim}}
}

\examples{

  ## Some data
  testData <- data.frame(num1=c(1:10, NA),
                         num2=c(NA, seq(from=1, to=5.5, by=0.5)),
                         num3=c(NA, rnorm(n=10, mean=1e6, sd=3e5)),
                         int1=c(as.integer(1:4), NA, as.integer(5:10)),
                         fac1=factor(c(NA, letters[1:10])),
                         fac2=factor(c(letters[6:15], NA)),
                         cha1=c(letters[17:26], NA),
                         cha2=c(NA, letters[26:17]),
                         stringsAsFactors=FALSE)
  levels(testData$fac1) <- c(levels(testData$fac1), "unusedLevel")
  testData$Date <- as.Date("1900-1-1")
  testData$Date[2] <- NA
  testData$POSIXt <- as.POSIXct(strptime("1900-1-1 01:01:01",
                                         format="\%Y-\%m-\%d \%H:\%M:\%S"))
  testData$POSIXt[5] <- NA

  ## Default
  write.fwf(x=testData)

  ## NA should be - or ------------
  write.fwf(x=testData, na="-")
  write.fwf(x=testData, na="------------")

  ## Some other separator than space
  write.fwf(x=testData[, 1:4], sep="-mySep-")

  ## Write to file and report format and fixed width information
  file <- tempfile("test.txt")
  formatInfo <- write.fwf(x=testData, file=file, formatInfo=TRUE)

  ## Read exported data back to R (note +1 due to separator)
  ## ... without header
  read.fwf(file=file, widths=formatInfo$width + 1, header=FALSE, skip=1,
           strip.white=TRUE)

  ## ... with header - via postimport modfication
  tmp <- read.fwf(file=file, widths=formatInfo$width + 1, skip=1,
                  strip.white=TRUE)
  colnames(tmp) <- read.table(file=file, nrow=1, as.is=TRUE)
  tmp

  ## ... with header - persuading read.fwf to accept header properly
  ## (thanks to Marc Schwartz)
  read.fwf(file=file, widths=formatInfo$width + 1, strip.white=TRUE,
           skip=1, col.names=read.table(file=file, nrow=1, as.is=TRUE))

  ## ... with header - with the use of quotes
  write.fwf(x=testData, file=file, quote=TRUE)
  read.table(file=file, header=TRUE, strip.white=TRUE)

  ## Tidy up
  unlink(file)
}

\keyword{print}
\keyword{file}

%--------------------------------------------------------------------------
% write.fwf.Rd ends here
