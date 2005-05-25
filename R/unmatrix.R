# $Id: unmatrix.R,v 1.2 2004/12/27 22:05:52 warnes Exp $

unmatrix <- function(x, byrow=FALSE)
  {
    rnames <- rownames(x)
    cnames <- colnames(x)
    if(is.null(rnames)) rnames <- paste("r",1:nrow(x),sep='')
    if(is.null(cnames)) cnames <- paste("c",1:ncol(x),sep='')
    nmat <- outer( rnames, cnames, paste, sep=":" )
    
    if(byrow)
      {
        vlist <- c(t(x))
        names(vlist) <- c(t(nmat))
      }
    else
      {
        vlist <- c(x)
        names(vlist) <- c(nmat)
      }

    return(vlist)
  }
