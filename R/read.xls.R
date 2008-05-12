## s$Id: read.xls.R 1269 2008-05-13 03:09:32Z warnes $

## Creating a temporary function to quote the string
dQuote.ascii <- function(x) paste('"',x,'"',sep='')


xls2csv <- function(xls, sheet = 1, verbose=FALSE, ..., perl="perl")
  {


  ###
  # directories
  package.dir <- .path.package('gdata')
  perl.dir <- file.path(package.dir,'perl')
  #
  ###

  ###
  # files

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

  xls2csv <- file.path(perl.dir,'xls2csv.pl')
  csv <- paste(tempfile(), "csv", sep = ".")
  #
  ###

  ###
  # execution command
  cmd <- paste(perl, xls2csv, dQuote.ascii(xls), dQuote.ascii(csv),
               sheet, sep=" ")
  #
  ###

    if(verbose)
      {
        cat("\n")
        cat("Converting xls file\n")
        cat("   ", dQuote.ascii(xls), "\n")
        cat("to csv file \n")
        cat("   ", dQuote.ascii(csv), "\n")
        cat("... \n\n")
      }
      else
        cat("Converting xls file to csv file... ")         
    
  ###
  # do the translation
  if(verbose)  cat("Executing ", cmd, "... \n\n")
  #
  results <- system(cmd, intern=!verbose)
  #
  if (verbose) cat("Done.\n\n")
  #
  ###

  if(file.access(csv, 4)!=0)
    stop("Unable to read translated csv file '", csv, "'." )
    
  cat("Done.\n")

    
  # prepare for cleanup now, in case of error reading file
  file(csv)
}


read.xls <- function(xls, sheet = 1, verbose=FALSE, pattern, ..., perl="perl") {
   con <- tfn <- NULL
   on.exit({ 
        if (inherits(con, "connection") && isOpen(con)) close(con)
        if (file.exists(tfn)) file.remove(tfn)
   })

   ## expand file path, translating ~ to user's home directory, etc.
   xls <- path.expand(xls)


   ## translate from xls to csv format (returns csv file name)
   con <- xls2csv(xls, sheet, verbose=verbose, ..., perl = perl)

   ## load the csv file
   open(con)
   tfn <- summary(con)$description
   if (missing(pattern))
        {
          if(verbose)
            cat("Reading csv file ", dQuote.ascii(tfn), "...\n")
          else
            cat("Reading csv file... ")            
          retval <- read.csv(con, ...)
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
       cat("Reading csv file ", dQuote.ascii(tfn), "...\n")
     else
       cat("Reading csv file... ")       
     retval <- read.csv(con, skip = idx[1]-1, ...)
     cat("Done.\n")     
   }
   retval
}

