# $Id: reorder.R,v 1.7 2005/06/09 14:20:24 nj7w Exp $

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




