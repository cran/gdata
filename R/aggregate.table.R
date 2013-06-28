# $Id: aggregate.table.R 1681 2013-06-28 20:26:56Z warnes $

aggregate.table <- function(x, by1, by2, FUN=mean, ...)
  {
    warning("'aggregate.table' is deprecated and will be removed in a future version of the gdata package. ",
            "Please use 'tapply(X=",
            deparse(substitute(x)),
            ", INDEX=list(",
            deparse(substitute(by1)),
            ", ",
            deparse(substitute(by2)),
            "), FUN=",
            deparse(substitute(FUN)),
            if(length(list(...))>0)
            {
              l <- list(...)
              paste(", ",
                    paste(names(l),"=",
                          deparse(substitute(...)),
                          sep="",
                          collapse=", ")
                    )
            },
            ")' instead.")
    tapply(X=x, INDEX=list(by1, by2), FUN=FUN, ...)
  }

## aggregate.table <- function(x, by1, by2, FUN=mean, ... )
## {
##    
##     tab <- matrix( nrow=nlevels(by1), ncol=nlevels(by2) )
##     dimnames(tab) <- list(levels(by1),levels(by2))
##
##     for(i in 1:nrow(ag))
##       tab[ as.character(ag[i,1]), as.character(ag[i,2]) ] <- ag[i,3]
##     tab
##   }
