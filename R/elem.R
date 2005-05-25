# $Id: elem.R,v 1.6 2005/02/25 23:22:36 warnes Exp $

elem <- function(object=1, unit=c("KB","MB","bytes"), digits=0,
                 dimensions=FALSE)
{
  .Deprecated("ll", package="gdata")
  ll(pos=object, unit=unit, digits=digits, dimensions=dimensions)
}

