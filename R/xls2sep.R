## s$Id: xls2sep.R 1418 2010-01-28 19:56:21Z warnes $

xls2csv <- function(xls, sheet=1, verbose=FALSE, ..., perl="perl")
  xls2sep(xls=xls, sheet=sheet, verbose=verbose, ..., method="csv",
          perl=perl)

xls2tab <- function(xls, sheet=1, verbose=FALSE, ..., perl="perl")
  xls2sep(xls=xls, sheet=sheet, verbose=verbose, ..., method="tab",
          perl=perl) 

xls2tsv <- function(xls, sheet=1, verbose=FALSE, ..., perl="perl")
  xls2sep(xls=xls, sheet=sheet, verbose=verbose, ..., method="tsv",
          perl=perl) 

xls2sep <- function(xls, sheet=1, verbose=FALSE, ...,
                    method=c("csv","tsv","tab"), perl="perl")
  {
    
    method <- match.arg(method)
    
    ##
    ## directories
    package.dir <- .path.package('gdata')
    perl.dir <- file.path(package.dir,'perl')
    ##

    ##
    ## filesheet
    tf <- NULL
    if ( substring(xls, 1, 7) == "http://" ||
         substring(xls, 1, 6) == "ftp://" )
      {
        tf <- paste(tempfile(), "xls", sep = ".")
        if(verbose)
          cat("Downloading",
              dQuote.ascii(xls), " to ",
              dQuote.ascii(tf), "...\n")
        download.file(xls, tf, mode = "wb")
        if(verbose) cat("Done.\n")
        xls <- tf
      }

    if(file.access(xls, 4)!=0)
      stop("Unable to read xls file '", xls, "'." )

    if(method=="csv")
      {
        script <- file.path(perl.dir,'xls2csv.pl')
        targetFile <- paste(tempfile(), "csv", sep = ".")
      }
    else if(method=="tab")
      {
        script <- file.path(perl.dir,'xls2tab.pl')
        targetFile <- paste(tempfile(), "tab", sep = ".")
      }
    else if(method=="tsv")
      {
        script <- file.path(perl.dir,'xls2tsv.pl')
        targetFile <- paste(tempfile(), "tsv", sep = ".")
      }
    else
      {
        stop("Unknown method", method)
      }
    
    ##
    ##

    ##
    ## execution command
    cmd <- paste(dQuote.ascii(perl),
                 dQuote.ascii(script),
                 dQuote.ascii(xls),
                 dQuote.ascii(targetFile),
                 dQuote.ascii(sheet),
                 sep=" ")
    ##
    ##

    if(verbose)
      {
        cat("\n")
        cat("Converting xls file\n")
        cat("   ", dQuote.ascii(xls), "\n")
        cat("to", method, " file \n")
        cat("   ", dQuote.ascii(targetFile), "\n")
        cat("... \n\n")
      }
    
    ##
    ## do the translation
    if(verbose)  cat("Executing '", cmd, "'... \n\n")
    ##
    results <- system(cmd, intern=!verbose)
    if(verbose) cat(results,"\n\n")
    ##
    if (verbose) cat("Done.\n\n")
    ##
    ##

    if(file.access(targetFile, 4)!=0)
      stop("Unable to read translated ", method, " file '", targetFile, "'." )
    
    if (verbose) cat("Done.\n")

    
    ## prepare for cleanup now, in case of error reading file
    file(targetFile)
  }

