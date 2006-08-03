## combineLevels.R
###------------------------------------------------------------------------
## What: Joint levels of given factors
## $Id: combineLevels.R,v 1.1 2006/04/08 01:58:36 ggorjan Exp $
## Time-stamp: <2006-04-08 03:57:53 ggorjan>
###------------------------------------------------------------------------

combineLevels <- function(x, apply=TRUE, drop=FALSE)
{
  if (!is.factor(x)) {
    if (sum(!(c("data.frame", "list") %in% class(x))) == 2)
      stop(paste(sQuote("x"), "must be a", dQuote("data.frame"), "or a", dQuote("list")))
    if (any(!(unlist((lapply(x, is.factor))))))
      stop(paste("only", dQuote("factors"), "are supported"))
    if (drop) x <- lapply(x, factor)
    levs <- sort(unique(unlist(lapply(x, levels))))
    if (!apply) return(levs)
    return(lapply(x, "levels<-", mapFactor(levs, codes=FALSE)))
  }
  if (drop) x <- factor(x)
  if (!apply) return(levels(x))
  return(x)
}

###------------------------------------------------------------------------
## combineLevels.R ends here
