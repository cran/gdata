% mapFactor.Rd
%--------------------------------------------------------------------------
% What: Get a map of levels in a factor man page
% $Id: mapFactor.Rd,v 1.1 2006/03/29 13:47:10 ggorjan Exp ggorjan $
% Time-stamp: <2006-06-27 09:31:03 ggorjan>
%--------------------------------------------------------------------------

\name{mapFactor}

\alias{mapFactor}

\title{Get a map of levels in a factor}

\description{
\code{mapFactor} produces a list with information on levels and internal
integer codes. As such can be conveniently used to store factor map when
one needs to work with internal codes of a factor and later transfrorm
back to factor.  
}

\usage{
mapFactor(x, codes=TRUE, sort=TRUE, drop=FALSE, ...)
}

\arguments{
  \item{x}{factor, the object to be mapped}
  \item{codes}{boolean, create map with internal codes or with
    levels, look into value and examples}
  \item{sort}{boolean, sort levels for a character, look into details}
  \item{drop}{boolean, drop unused levels of a factor}
  \item{...}{additional arguments for \code{sort}}
}

\details{
  \code{sort} and \code{...} arguments provides possibility to "order"
  levels and can only be used for characters and not for factors.  
}

\value{A list with names equal to levels and entries equal to internal
codes, when \code{codes=TRUE}, or entries equal to levels
otherwise. The later case is usefull, when one would like to combine
two factors with different levels.  
}

\author{Gregor Gorjanc}

\seealso{
  \code{\link{factor}}, \code{\link{levels}}, \code{\link{unclass}},
  \code{\link{attributes}}
}

\examples{

## Example with codes=TRUE
(f <- factor(letters[c(1, 1, 2, 3, 4, 5, 7, 8, 9, 8, 8, 10)]))
map <- mapFactor(f)
int <- as.integer(f)
fNew <- factor(int)
levels(fNew) <- map
fNew

## Example with codes=FALSE
f1 <- factor(f[1:5])
f2 <- factor(f[5:length(f)])
map1 <- mapFactor(f1, codes=FALSE)
map2 <- mapFactor(f2, codes=FALSE)
map <- c(map1, map2)
levels(f1) <- map
levels(f2) <- map
as.integer(f1)
as.integer(f2)

## x <- unique(map)
## names(x) <- unlist(x)
}

\keyword{misc}
\keyword{manip}

%--------------------------------------------------------------------------
% mapFactor.Rd ends here
