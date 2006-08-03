% combineLevels.Rd
%--------------------------------------------------------------------------
% What: Combine levels of given factors
% $Id: combineLevels.Rd,v 1.1 2006/03/29 13:47:10 ggorjan Exp ggorjan $
% Time-stamp: <2006-06-27 09:30:42 ggorjan>
%--------------------------------------------------------------------------

\name{combineLevels}

\alias{combineLevels}

\title{Combine levels of given factors}

\description{
\code{combineLevels} combines levels of given factors and applies this
levels to given factors. This eases the work with factors since all
factors have the same levels.  
}

\usage{
combineLevels(x, apply=TRUE, drop=FALSE)
}

\arguments{
  \item{x}{data.frame or list, object with factors}
  \item{apply}{boolean, apply combined levels to \code{x} or just return
    combined levels}
  \item{drop}{boolean, drop unused levels}
}

\value{\code{apply} handles the output. If \code{apply=TRUE} the output
  is a modified \code{x}, where all factors have the same set of
  levels. If \code{apply=FALSE} only combined levels are returned.  
}

\author{Gregor Gorjanc}

\seealso{
  \code{\link{factor}}, \code{\link{levels}}, \code{\link[ggmisc]{mapFactor}}
}

\examples{

(f1 <- factor(letters[1:5]))
(f2 <- factor(letters[3:10]))
tmp <- list(f1, f2)
combineLevels(tmp)
combineLevels(tmp, apply=FALSE)

f1[2] <- NA
f1 <- factor(f1)
tmp <- list(f1, f2)
combineLevels(tmp, apply=FALSE, drop=TRUE)

}

\keyword{misc}
\keyword{manip}

%--------------------------------------------------------------------------
% combineLevels.Rd ends here
