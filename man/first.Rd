\name{first}
\alias{first}
\alias{last}
\alias{first<-}
\alias{last<-}
\title{Return first or last element of an object}
\description{
  Return first or last element of an object. These functions are convenience
  wrappers for \code{head(x, n=1, \dots)} and \code{tail(x, n=1, \dots)}.
}
\usage{
first(x, n=1, \dots)
last(x, n=1, \dots)
first(x, n=1, \dots) <- value
last(x, n=1, \dots) <- value
}
\arguments{
  \item{x}{data object}
  \item{n}{a single integer. If positive, size for the resulting object:
    number of elements for a vector (including lists), rows for a
    matrix or data frame or lines for a function. If negative,
    all but the 'n' last/first number of elements of 'x'.}
   \item{\dots}{arguments to be passed to or from other methods.}
   \item{value}{a vector of values to be assigned
     (should be of length \code{n})}
}
\value{
  An object (usually) like 'x' but generally smaller.
}
\author{
  Gregory R. Warnes \email{greg@warnes.net}
}
\seealso{
  \code{\link[utils]{head}},
  \code{\link[utils]{tail}},
  \code{\link{left}},
  \code{\link{right}}
}
\examples{
## Vector
v <- 1:10
first(v)
last(v)

first(v) <- 9
v

last(v) <- 20
v

## List
l <- list(a=1, b=2, c=3)
first(l)
last(l)

first(l) <- "apple"
last(l)  <- "banana"
l

## Data frame
df <- data.frame(a=1:2, b=3:4, c=5:6)
first(df)
last(df)

first(df) <- factor(c("red","green"))
last(df) <- list(c(20,30)) # note the enclosing list!
df

## Matrix
m <- as.matrix(df)
first(m)
last(m)

first(m) <- "z"
last(m)  <- "q"
m
}
\keyword{manip}
