## mapFactor.R
###------------------------------------------------------------------------
## What: Get a map of levels in a factor
## $Id: mapFactor.R,v 1.1 2006/03/29 13:47:15 ggorjan Exp ggorjan $
## Time-stamp: <2006-04-06 01:35:30 ggorjan>
###------------------------------------------------------------------------

mapFactor <- function(x, codes=TRUE, sort=TRUE, drop=FALSE, ...)
{
  ## --- Check ---
  msg <- "x must be a factor or character"
  if (!is.factor(x)) {
    if (!is.character(x)) stop(msg)
  }

  ## --- Create a map ---
  if (is.factor(x)) { # factor
    if (drop) x <- factor(x)
    nlevs <- nlevels(x)
    levs <- levels(x)
    if (sort) levs <- sort(levs, ...)
  } else {            # character
    levs <- unique(x)
    if (sort) levs <- sort(levs, ...)
    nlevs <- length(levs)
  }
  tmp <- vector("list", nlevs)
  names(tmp) <- levs
  if (codes) {
    tmp[1:nlevs] <- 1:nlevs
  } else {
    tmp[1:nlevs] <- levs
  }
  return(tmp)
}

###------------------------------------------------------------------------
## mapFactor.R ends here
