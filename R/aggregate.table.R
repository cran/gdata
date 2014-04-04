# $Id: aggregate.table.R 1788 2014-04-05 13:57:10Z warnes $

aggregate.table <- function(x, by1, by2, FUN=mean, ...)
  {
      .Defunct(
          new=paste(
              "tapply(X=",
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
              ")", sep=""),
          package="gdata"
          )
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
