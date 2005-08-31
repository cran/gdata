# $Id: aggregate.table.R,v 1.5 2005/06/09 14:20:24 nj7w Exp $

aggregate.table <- function(x, by1, by2, FUN=mean, ... )
  {
    if(!is.factor(by1)) by1 <- as.factor(by1)
    if(!is.factor(by2)) by2 <- as.factor(by2)

    ag <- aggregate(x, by=list(by1,by2), FUN=FUN, ... )
    tab <- matrix( nrow=nlevels(by1), ncol=nlevels(by2) )
    dimnames(tab) <- list(levels(by1),levels(by2))

    for(i in 1:nrow(ag))
      tab[ as.character(ag[i,1]), as.character(ag[i,2]) ] <- ag[i,3]
    tab
  }
