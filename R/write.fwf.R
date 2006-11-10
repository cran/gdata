### write.fwf.R
###------------------------------------------------------------------------
### What: Write fixed width format
### $Id: write.fwf.R 997 2006-10-30 19:04:53Z ggorjan $
### Time-stamp: <2006-10-30 18:58:40 ggorjan>
###------------------------------------------------------------------------

write.fwf <- function(x, file="", append=FALSE, quote=FALSE, sep=" ",
                      na="", rownames=FALSE, colnames=TRUE, rowCol=NULL,
                      justify="right", formatInfo=FALSE, quoteInfo=TRUE, ...)
{
  if(!(is.data.frame(x) || is.matrix(x)))
    stop("'x' must be a data.frame or matrix")
  if(rownames) {
    x <- cbind(rownames(x), x)
    rowColVal <- ifelse(!is.null(rowCol), rowCol, "row")
    colnames(x)[1] <- rowColVal
  }
  colnamesMy <- colnames(x)

  ## --- Format info ---

  if(formatInfo) {
    retFormat <- data.frame(colname=colnamesMy,
                            nlevels=0,
                            position=0,
                            width=0,
                            digits=0,
                            exp=0)
    retFormat$colname <- as.character(retFormat$colname)

    isNum <- sapply(x, is.numeric)
    ## is.numeric picks also Date and POSIXt
    isNum <- isNum & !(sapply(x, inherits, what="Date") |
                       sapply(x, inherits, what="POSIXt"))

    ## Numeric is a bit special and we need to get info before format turns
    ## all to character
    if(any(isNum)) {
      tmp <- lapply(x[, isNum, drop=FALSE], format.info, ...)
      tmp1 <- sapply(tmp, length)
      tmp <- t(as.data.frame(tmp))
      j <- 1
      for(i in which(isNum)) {
        retFormat[i, 4:(3+tmp1[j])] <- tmp[j, 1:tmp1[j]]
        ## length 1 for exp should mean 1 and not 1+1
        if(tmp1[j] > 2 && tmp[j, 3] > 1)
          retFormat[i, "exp"] <- retFormat[i, "exp"] + 1
        j <- j + 1
      }
    }
  }

  ## --- Format ---

  x <- apply(X=x, MARGIN=2,
             FUN=function(z) {
               ## NAToUnknown is used since format corces NA to "NA" and
               ## then argument na in write.table does not do its job
               format(gdata:::NAToUnknown.default(as.character(z),
                                                  unknown=as.character(na)),
                      justify=justify, ...) })
  if(formatInfo) {
    if(any(!isNum)) { # need apply as x is now a matrix
      retFormat[!isNum, "width"] <- apply(X=x[, !isNum, drop=FALSE], MARGIN=2,
                                          FUN=function(z) format.info(z)[1])
      retFormat[!isNum, "nlevels"] <- apply(X=x[, !isNum, drop=FALSE], MARGIN=2,
                                            FUN=function(z) length(unique(z)))
    }
  }

  ## --- Write ---

  if(colnames) {
    if(rownames && is.null(rowCol)) colnamesMy <- colnamesMy[-1]
    write.table(t(as.matrix(colnamesMy)), file=file, append=append,
                quote=quote, sep=sep, row.names=FALSE, col.names=FALSE, ...)
  }

  write.table(x=x, file=file, append=(colnames || append), quote=quote,
              sep=sep, row.names=FALSE, col.names=FALSE, ...)

  ## --- Return format and fixed width information ---

  if(formatInfo) {
    ## be carefull with these ifelse constructs
    retFormat$position[1] <- ifelse(quote, ifelse(quoteInfo, 1, 2), 1)
    if(ifelse(quote, quoteInfo, FALSE)) retFormat$width <- retFormat$width + 2
    N <- nrow(retFormat)
    for(i in 2:N) {
      retFormat$position[i] <- retFormat$position[i - 1] +
        retFormat$width[i - 1] + nchar(x=sep, type="chars") +
          ifelse(quote, ifelse(quoteInfo, 0, 1), 0)
    }
    if(rownames && is.null(rowCol)) {
      retFormat <- retFormat[-1,]
      rownames(retFormat) <- 1:(N-1)
    }
    return(retFormat)
  }
}

###------------------------------------------------------------------------
### write.fwf.R ends here
