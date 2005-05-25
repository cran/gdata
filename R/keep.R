# $Id: keep.R,v 1.4 2004/09/03 17:27:44 warneg Exp $

keep <- function(..., list=character(0), sure=FALSE)
{
  if(missing(...) && missing(list))
    stop("Keep something, or use rm(list=ls()) to clear workspace.")
  names <- as.character(substitute(list(...)))[-1]
  list <- c(list, names)
  keep.elements <- match(list, ls(1))

  if(sure == FALSE)
    return(ls(1)[-keep.elements])
  else
    rm(list=ls(1)[-keep.elements], pos=1)
}

