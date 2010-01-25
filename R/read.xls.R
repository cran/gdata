## s$Id: read.xls.R 1406 2010-01-24 19:13:22Z warnes $

read.xls <- function(xls, sheet = 1, verbose=FALSE, pattern, ...,
                     method=c("csv","tsv","tab"), perl="perl")
{
  con <- tfn <- NULL
  on.exit({ 
    if (inherits(con, "connection") && isOpen(con)) close(con)
    if (file.exists(tfn)) file.remove(tfn)
  })

  method <- match.arg(method)
  
  ## expand file path, translating ~ to user's home directory, etc.
  xls <- path.expand(xls)


  ## translate from xls to csv/tsv/tab format (returns name of created file)
  con <- xls2sep(xls, sheet, verbose=verbose, ..., method=method, perl = perl)

  ## load the csv file
  open(con)
  tfn <- summary(con)$description
  if (missing(pattern))
    {
      if(verbose)
        cat("Reading", method, "file ", dQuote.ascii(tfn), "...\n")
      
      if(method=="csv")
        retval <- read.csv(con, ...)
      else if (method %in% c("tsv","tab") )
        retval <- read.delim(con, ...)
      else
        stop("Unknown method", method)
        
      if(verbose)
        cat("Done.\n")
    }
  else {
    if(verbose)
      cat("Searching for lines containing pattern ", pattern, "... ")
    idx <- grep(pattern, readLines(con))
    if (length(idx) == 0) {
      warning("pattern not found")
      return(NULL)
    }
   if(verbose)
     cat("Done.\n")
    
    seek(con, 0)

    if(verbose)
      cat("Reading", method, "file ", dQuote.ascii(tfn), "...\n")

    if(method=="csv")
      retval <- read.csv(con, skip = idx[1]-1, ...)
    else if (method %in% c("tsv","tab") )
      retval <- read.delim(con, skip = idx[1]-1, ...)
    else
      stop("Unknown method", method)

    close(con)

    if(verbose)
      cat("Done.\n")     
  }
  retval
}

