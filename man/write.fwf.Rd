\name{write.fwf}
\alias{write.fwf}
\concept{data output}
\concept{data export}
\title{Write object to file in fixed width format}
\description{
  Write object to file in fixed width (fwf) format.
}
\usage{
write.fwf(x, file="", append=FALSE, quote=FALSE, sep=" ", na="",
  rownames=FALSE, colnames=TRUE, rowCol=NULL, justify="left",
  formatInfo=FALSE, quoteInfo=TRUE, width=NULL, eol="\n",
  qmethod=c("escape", "double"),  scientific=TRUE, \dots)
}
\arguments{
  \item{x}{data.frame or matrix, the object to be written.}
  \item{file}{character, name of file or connection, look in
    \code{\link{write.table}} for more.}
  \item{append}{logical, append to existing data in \code{file}.}
  \item{quote}{logical, quote data in output.}
  \item{na}{character, the string to use for missing values
    (\code{NA}) in the output.}
  \item{sep}{character, separator between columns in output.}
  \item{rownames}{logical, print row names.}
  \item{colnames}{logical, print column names.}
  \item{rowCol}{character, rownames column name.}
  \item{justify}{character, alignment of character columns, see
    \code{\link{format}}.}
  \item{formatInfo}{logical, return information on number of levels,
    widths and format.}
  \item{quoteInfo}{logical, should \code{formatInfo} account for quotes.}
  \item{width}{numeric, width of the columns in the output.}
  \item{eol}{the character(s) to print at the end of each line (row).
    For example, \code{eol="\\r\\n"} will produce Windows line endings on a
    Unix-alike OS, and \code{eol="\\r"} will produce files as expected by Mac
    OS Excel 2004.}
  \item{qmethod}{a character string specifying how to deal with embedded
    double quote characters when quoting strings. Must be one of
    \code{"escape"} (default), in which case the quote character is
    escaped in C style by a backslash, or \code{"double"}, in which
    case it is doubled. You can specify just the initial letter.}
  \item{scientific}{logical, allow numeric values to be
    formatted using scientific notation.}
  \item{\dots}{further arguments to
    \code{\link{format.info}} and \code{\link{format}}.}
}
\details{
  Output is similar to \code{print(x)} or \code{format(x)}. Formatting is
  done completely by \code{\link{format}} on a column basis. Columns in
  the output are by default separated with a space i.e. empty column with
  a width of one character, but that can be changed with \code{sep}
  argument as passed to \code{\link{write.table}} via \dots.

  As mentioned formatting is done completely by
  \code{\link{format}}. Arguments can be passed to \code{format} via
  \code{\dots} to further modify the output. However, note that the
  returned \code{formatInfo} might not properly account for this, since
  \code{\link{format.info}} (which is used to collect information about
  formatting) lacks the arguments of \code{\link{format}}.

  \code{quote} can be used to quote fields in the output. Since all
  columns of \code{x} are converted to character (via
  \code{\link{format}}) during the output, all columns will be quoted! If
  quotes are used, \code{\link{read.table}} can be easily used to read the
  data back into \R. Check examples. Do read the details about
  \code{quoteInfo} argument.

  Use only true characters, i.e., avoid use of tabs, i.e., \code{"\\t"} or
  similar separators via argument \code{sep}. Width of the separator is taken as
  the number of characters evaluated via \code{\link{nchar}(sep)}.

  Use argument \code{na} to convert missing/unknown values. Only single value
  can be specified. Use \code{\link{NAToUnknown}} prior to export if you need
  greater flexibility.

  If \code{rowCol} is not \code{NULL} and \code{rownames=TRUE}, rownames
  will also have column name with \code{rowCol} value. This is mainly for
  flexibility with tools outside \R. Note that it may not be
  easy to import data back to \R with \code{\link{read.fwf}} if
  you also export rownames. This is the reason, that default is
  \code{rownames=FALSE}.

  Information about format of output will be returned if
  \code{formatInfo=TRUE}. Returned value is described in value
  section. This information is gathered by \code{\link{format.info}} and
  care was taken to handle numeric properly. If output contains rownames,
  values account for this. Additionally, if \code{rowCol} is not
  \code{NULL} returned values contain also information about format
  of rownames.

  If \code{quote=TRUE}, the output is of course wider due to
  quotes. Return value (with \code{formatInfo=TRUE}) can account for this
  in two ways; controlled with argument \code{quoteInfo}. However, note
  that there is no way to properly read the data back to \R if
  \code{quote=TRUE} and \code{quoteInfo=FALSE} arguments were used for
  export. \code{quoteInfo} applies only when \code{quote=TRUE}. Assume
  that there is a file with quoted data as shown below (column numbers in
  first three lines are only for demonstration of the values in the
  output).

\preformatted{
123456789 12345678 # for position
123 1234567 123456 # for width with quoteInfo=TRUE
 1   12345   1234  # for width with quoteInfo=FALSE
"a" "hsgdh" "   9"
" " "   bb" " 123"
}

  With \code{quoteInfo=TRUE} \code{write.fwf} will return

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

  Argument \code{width} can be used to increase the width of the columns
  in the output. This argument is passed to the width argument of
  \code{\link{format}} function. Values in \code{width} are recycled if
  there is less values than the number of columns. If the specified width
  is too short in comparison to the "width" of the data in particular
  column, error is issued.
}
\value{
  Besides its effect to write/export data \code{write.fwf} can provide
  information on format and width. If \code{formatInfo = FALSE}, then a
  data frame is returned with the following columns:
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
\author{Gregor Gorjanc.}
\seealso{
  \code{\link{format.info}}, \code{\link{format}},
  \code{\link{NAToUnknown}}, \code{\link{write.table}},
  \code{\link{read.fwf}}, \code{\link{read.table}} and
  \code{\link{trim}}.
}
\examples{
## Some data
num <- round(c(733070.345678, 1214213.78765456, 553823.798765678,
               1085022.8876545678,  571063.88765456, 606718.3876545678,
               1053686.6, 971024.187656, 631193.398765456, 879431.1),
             digits=3)

testData <- data.frame(num1=c(1:10, NA),
                       num2=c(NA, seq(from=1, to=5.5, by=0.5)),
                       num3=c(NA, num),
                       int1=c(as.integer(1:4), NA, as.integer(4:9)),
                       fac1=factor(c(NA, letters[1:9], "hjh")),
                       fac2=factor(c(letters[6:15], NA)),
                       cha1=c(letters[17:26], NA),
                       cha2=c(NA, "longer", letters[25:17]),
                       stringsAsFactors=FALSE)
levels(testData$fac1) <- c(levels(testData$fac1), "unusedLevel")
testData$Date <- as.Date("1900-1-1")
testData$Date[2] <- NA
testData$POSIXt <- as.POSIXct(strptime("1900-1-1 01:01:01",
                                       format="\%Y-\%m-\%d \%H:\%M:\%S"))
testData$POSIXt[5] <- NA

## Default
write.fwf(x=testData)

## NA should be -
write.fwf(x=testData, na="-")
## NA should be -NA-
write.fwf(x=testData, na="-NA-")

## Some other separator than space
write.fwf(x=testData[, 1:4], sep="-mySep-")

## Force wider columns
write.fwf(x=testData[, 1:5], width=20)

## Show effect of 'scientific' option
testData$num3 <- testData$num3 * 1e8
write.fwf(testData, scientific=TRUE)
write.fwf(testData, scientific=FALSE)
testData$num3 <- testData$num3 / 1e8

## Write to file and report format and fixed width information
file <- tempfile()
formatInfo <- write.fwf(x=testData, file=file, formatInfo=TRUE)
formatInfo

## Read exported data back to R (note +1 due to separator)
## - without header
read.fwf(file=file, widths=formatInfo$width + 1, header=FALSE, skip=1,
         strip.white=TRUE)

## - with header, via postimport modfication
tmp <- read.fwf(file=file, widths=formatInfo$width + 1, skip=1,
                strip.white=TRUE)
colnames(tmp) <- read.table(file=file, nrow=1, as.is=TRUE)
tmp

## - with header, persuading read.fwf to accept header properly
## (thanks to Marc Schwartz)
read.fwf(file=file, widths=formatInfo$width + 1, strip.white=TRUE,
         skip=1, col.names=read.table(file=file, nrow=1, as.is=TRUE))

## - with header, using quotes
write.fwf(x=testData, file=file, quote=TRUE)
read.table(file=file, header=TRUE, strip.white=TRUE)

## Tidy up
unlink(file)
}
\keyword{print}
\keyword{file}
