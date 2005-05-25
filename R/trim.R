# $Id: trim.R,v 1.2 2004/09/03 17:27:44 warneg Exp $

trim <- function(s)
  {
    s <- sub("^ +","",s)
    s <- sub(" +$","",s)
    s
  }
