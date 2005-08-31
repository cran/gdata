# $Id: trim.R,v 1.3 2005/06/09 14:20:24 nj7w Exp $

trim <- function(s)
  {
    s <- sub("^ +","",s)
    s <- sub(" +$","",s)
    s
  }
