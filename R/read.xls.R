## s$Id: read.xls.R 1342 2009-07-16 02:49:11Z warnes $

## Creating a temporary function to quote the string
dQuote.ascii <- function(x) paste('"',x,'"',sep='')


xls2csv <- function(xls, sheet=1, verbose=FALSE, ..., perl="perl")
  xls2sep(xls=xls, sheet=sheet, verbose=verbose, ..., method="csv",
          perl="perl") 

xls2tab <- function(xls, sheet=1, verbose=FALSE, ..., perl="perl")
  xls2sep(xls=xls, sheet=sheet, verbose=verbose, ..., method="tab",
          perl="perl") 

xls2sep <- function(xls, sheet = 1, verbose=FALSE, ...,
                    method=c("csv","tab"), perl="perl")
  {
    
    method <- match.arg(method)
    
    ##
    ## directories
    package.dir <- .path.package('gdata')
    perl.dir <- file.path(package.dir,'perl')
    ##

    ##
    ## files
    tf <- NULL
    if (substring(xls, 1, 7) == "http://") {
      tf <- paste(tempfile(), "xls", sep = ".")
      if(verbose)
        cat("Downloading",
            dQuote.ascii(xls), " to ",
            dQuote.ascii(tf), "...\n")
      else
        cat("Downloading...\n")
      download.file(xls, tf, mode = "wb")
      cat("Done.\n")
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
    else
      {
        stop("Unknown method", method)
      }
    
    ##
    ##

    ##
    ## execution command
    cmd <- paste(perl, script, dQuote.ascii(xls), dQuote.ascii(targetFile),
                 sheet, sep=" ")
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
    else
      cat("Converting xls file to", method, "file... ")         
    
    ##
    ## do the translation
    if(verbose)  cat("Executing ", cmd, "... \n\n")
                                        #
    results <- system(cmd, intern=!verbose)
                                        #
    if (verbose) cat("Done.\n\n")
                                        #
    ##

    if(file.access(targetFile, 4)!=0)
      stop("Unable to read translated", method, "file '", targetFile, "'." )
    
    cat("Done.\n")

    
    ## prepare for cleanup now, in case of error reading file
    file(targetFile)
  }


read.xls <- function(xls, sheet = 1, verbose=FALSE, pattern, ...,
                     method=c("csv","tab"), perl="perl")
{
  con <- tfn <- NULL
  on.exit({ 
    if (inherits(con, "connection") && isOpen(con)) close(con)
    if (file.exists(tfn)) file.remove(tfn)
  })

  method <- match.arg(method)
  
  ## expand file path, translating ~ to user's home directory, etc.
  xls <- path.expand(xls)


  ## translate from xls to csv/tab format (returns csv file name)
  if(method=="csv")
    con <- xls2csv(xls, sheet, verbose=verbose, ..., perl = perl)
  else if(method=="tab")
    con <- xls2tab(xls, sheet, verbose=verbose, ..., perl = perl)
  else
    stop("Unknown method", method)

  ## load the csv file
  open(con)
  tfn <- summary(con)$description
  if (missing(pattern))
    {
      if(verbose)
        cat("Reading", method, "file ", dQuote.ascii(tfn), "...\n")
      else
        cat("Reading", method, "file... ")
      
      if(method=="csv")
        retval <- read.csv(con, ...)
      else if (method=="tab")
        retval <- read.delim(con, ...)
      else
        stop("Unknown method", method)
        
      cat("Done.\n")
    }
  else {
    cat("Searching for lines containing pattern ", pattern, "... ")
    idx <- grep(pattern, readLines(con))
    if (length(idx) == 0) {
      warning("pattern not found")
      return(NULL)
    }
    cat("Done.\n")
    
    seek(con, 0)

    if(verbose)
      cat("Reading", method, "file ", dQuote.ascii(tfn), "...\n")
    else
      cat("Reading", method, "file... ")       

    if(method=="csv")
      retval <- read.csv(con, skip = idx[1]-1, ...)
    else if (method=="tab")
      retval <- read.delim(con, skip = idx[1]-1, ...)
    else
      stop("Unknown method", method)

    cat("Done.\n")     
  }
  retval
}

