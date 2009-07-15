% humanReadable.Rd
%--------------------------------------------------------------------------
% What: Print byte size in human readable format man page
% $Id$
% Time-stamp: <2008-12-30 13:26:35 ggorjan>
%--------------------------------------------------------------------------

\name{humanReadable}

\alias{humanReadable}

\title{Print byte size in human readable format}

\description{

\code{humanReadable} converts byte size in human readable format such as
kB, MB, GB, etc.

}

\usage{

humanReadable(x, standard="SI", digits=1, width=3, sep=" ")

}

\arguments{
  \item{x}{integer, byte size}
  \item{standard}{character, "SI" for powers of 1000 or anything else for
    powers of 1024, see details}
  \item{digits}{integer, number of digits after decimal point}
  \item{width}{integer, width of number string}
  \item{sep}{character, separator between number and unit}
}

\details{

Basic unit used to store information in computers is a bit. Bits are
represented as zeroes and ones - binary number system. Although, the binary
number system is not the same as the decimal number system, decimal prefixes
for binary multiples such as kilo and mega are often used. In the decimal system 
kilo represent 1000, which is close to \eqn{1024 = 2^{10}} in the binary system.
This sometimes causes problems as it is not clear which powers (2 or 10) are used
in a notation like 1 kB. To overcome this problem International Electrotechnical
Commission (IEC) has provided the following solution to this problem:

\tabular{lrcll}{
Name      \tab System  \tab Symbol \tab Size             \tab Conversion    \cr
byte      \tab binary  \tab B      \tab \eqn{2^3}        \tab    8 bits     \cr
kilobyte  \tab decimal \tab kB     \tab \eqn{10^3}       \tab 1000 bytes    \cr
kibibyte  \tab binary  \tab KiB    \tab \eqn{2^{10}}     \tab 1024 bytes    \cr
megabyte  \tab decimal \tab MB     \tab \eqn{(10^3)^2}   \tab 1000 kilobytes\cr
mebibyte  \tab binary  \tab MiB    \tab \eqn{(2^{10})^2} \tab 1024 kibibytes\cr
gigabyte  \tab decimal \tab GB     \tab \eqn{(10^3)^3}   \tab 1000 megabytes\cr
gibibyte  \tab binary  \tab GiB    \tab \eqn{(2^{10})^3} \tab 1024 mebibytes\cr
terabyte  \tab decimal \tab TB     \tab \eqn{(10^3)^4}   \tab 1000 gigabytes\cr
tebibyte  \tab binary  \tab TiB    \tab \eqn{(2^{10})^4} \tab 1024 gibibytes\cr
petabyte  \tab decimal \tab PB     \tab \eqn{(10^3)^5}   \tab 1000 terabytes\cr
pebibyte  \tab binary  \tab PiB    \tab \eqn{(2^{10})^5} \tab 1024 tebibytes\cr
exabyte   \tab decimal \tab EB     \tab \eqn{(10^3)^6}   \tab 1000 petabytes\cr
exbibyte  \tab binary  \tab EiB    \tab \eqn{(2^{10})^6} \tab 1024 pebibytes\cr
zettabyte \tab decimal \tab ZB     \tab \eqn{(10^3)^7}   \tab 1000 exabytes\cr
zebibyte  \tab binary  \tab ZiB    \tab \eqn{(2^{10})^7} \tab 1024 exbibytes\cr
yottabyte \tab decimal \tab YB     \tab \eqn{(10^3)^8}   \tab 1000 zettabytes\cr
yebibyte  \tab binary  \tab YiB    \tab \eqn{(2^{10})^8} \tab 1024 zebibytes\cr
}

where Zi and Yi are GNU extensions to IEC. To get the output in the decimal
system (powers of 1000) use \code{standard="SI"}. Otherwise IEC standard
(powers of 1024) is used.

For printout both \code{digits} and \code{width} can be specified. If
\code{width} is \code{NULL}, all values have given number of digits. If
\code{width} is not \code{NULL}, output is rounded to a given width and
formated similar to human readable format of \code{ls}, \code{df} or
\code{du} shell commands.

}

\references{

Wikipedia:
\url{http://en.wikipedia.org/wiki/Byte}
\url{http://en.wikipedia.org/wiki/SI_prefix}
\url{http://en.wikipedia.org/wiki/Binary_prefix}

GNU manual for coreutils:
\url{http://www.gnu.org/software/coreutils/manual/html_node/Block-size.html#Block-size}

}

\value{

Byte size in human readable format as character with proper unit symbols
added at the end of the string.

}

\author{Ales Korosec and Gregor Gorjanc}

\seealso{
  \code{\link{object.size}}, \code{\link[gdata]{ll}}
}

\examples{

baseSI <- 10
powerSI <- seq(from=3, to=27, by=3)
SI0 <- (baseSI)^powerSI
k <- length(SI0) - 1
SI1 <- SI0 - SI0 / c(2, runif(n=k, min=1.01, max=5.99))
SI2 <- SI0 + SI0 / c(2, runif(n=k, min=1.01, max=5.99))

baseIEC <- 2
powerIEC <- seq(from=10, to=90, by=10)
IEC0 <- (baseIEC)^powerIEC
IEC1 <- IEC0 - IEC0 / c(2, runif(n=k, min=1.01, max=5.99))
IEC2 <- IEC0 + IEC0 / c(2, runif(n=k, min=1.01, max=5.99))

cbind(humanReadable(x=SI1, width=NULL, digits=3),
      humanReadable(x=SI0, width=NULL, digits=2),
      humanReadable(x=SI2, width=NULL, digits=1),
      humanReadable(x=IEC1, standard="IEC", width=7, digits=3),
      humanReadable(x=IEC0, standard="IEC", width=7, digits=2),
      humanReadable(x=IEC2, standard="IEC", width=7, digits=1))
}

\keyword{misc}

%--------------------------------------------------------------------------
% humanReadable.Rd ends here
