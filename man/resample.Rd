\name{resample}
\alias{resample}
\title{Consistent Random Samples and Permutations}
\description{
  \code{resample} takes a sample of the specified size from the
  elements of \code{x} using either with or without replacement.

}
\usage{
resample(x, size, replace = FALSE, prob = NULL)
}
\arguments{
  \item{x}{ A numeric, complex, character or logical vector from which
    to choose.}
  \item{size}{Non-negative integer giving the number of items to choose.}
  \item{replace}{Should sampling be with replacement?}
  \item{prob}{A vector of probability weights for obtaining the elements of
    the vector being sampled.}
  }
\details{
  \code{resample} differs from the S/R \code{sample} function in
  \code{resample} always considers \code{x} to be a vector of elements
  to select from, while \code{sample} treats a vector of length one as a
  special case and samples from \code{1:x}.  Otherwise, the functions
  have identical behavior.
}
\value{
  ~Describe the value returned
  If it is a LIST, use
  \item{comp1 }{Description of 'comp1'}
  \item{comp2 }{Description of 'comp2'}
  ...
}
\references{ ~put references to the literature/web site here ~ }
\author{ ~~who you are~~ }
\note{ ~~further notes~~ 

 ~Make other sections like Warning with \section{Warning }{....} ~
}
\seealso{ ~~objects to See Also as \code{\link{help}}, ~~~ }
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function(x, n, ...)
  {
    if(length(x)==1)
      {
        if(n==1)
          x
        else
          stop("Requested sample of size ", n, " from list of length 1")
      }
    else
      sample(x, n, ...)
  }
}
\keyword{misc}% at least one, from doc/KEYWORDS
