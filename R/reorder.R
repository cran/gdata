# $Id: reorder.R,v 1.6 2004/09/03 17:27:44 warneg Exp $

# Reorder the levels of a factor.

reorder.factor <- function(x,
                           order,
                           X,
                           FUN,
                           sort=mixedsort,
                           make.ordered = is.ordered(x),
                           ... )
  {
    constructor <- if (make.ordered) ordered else factor

    if (!missing(order))
      {
        if (is.numeric(order))
          order = levels(x)[order]
        else
          order = order
      }
    else if (!missing(FUN))
      order = names(sort(tapply(X, x, FUN, ...)))
    else
      order = sort(levels(x))

    constructor( x, levels=order)

  }




