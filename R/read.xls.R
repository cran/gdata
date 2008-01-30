# $Id: read.xls.R 1099 2007-07-10 17:51:08Z warnes $

xls2csv <- function(xls, sheet = 1, verbose=FALSE, ..., perl="perl")
  {

  # Creating a temporary function to quote the string
    dQuote.ascii <- function(x) paste('"',x,'"',sep='')

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
	download.file(xls, tf, mode = "wb")
	xls <- tf
   }
  xls <- dQuote.ascii(xls) # dQuote.ascii in case of spaces in path
  xls2csv <- file.path(perl.dir,'xls2csv.pl')
  csv <- paste(tempfile(), "csv", sep = ".")
  #
  ###

  ###
  # execution command
  cmd <- paste(perl, xls2csv, xls, dQuote.ascii(csv), sheet, sep=" ")
  #
  ###

  ###
  # do the translation
  if(verbose)  cat("Executing ", cmd, "... \n")
  #
  results <- system(cmd, intern=!verbose)
  #
  if (verbose) cat("done.\n")
  #
  ###

  # prepare for cleanup now, in case of error reading file
  file(csv)
}


read.xls <- function(xls, sheet = 1, verbose=FALSE, pattern, ..., perl="perl") {
   con <- tfn <- NULL
   on.exit({ 
        if (inherits(con, "connection") && isOpen(con)) close(con)
        if (file.exists(tfn)) file.remove(tfn)
   })
   con <- xls2csv(xls, sheet, verbose, ..., perl = perl)
   open(con)
   tfn <- summary(con)$description
   print(tfn)
   if (missing(pattern)) read.csv(con, ...)
   else {
     idx <- grep(pattern, readLines(con))
     if (length(idx) == 0) {
        warning("pattern not found")
        return(NULL)
     }
     seek(con, 0)
     read.csv(con, skip = idx[1]-1, ...)
   }
}

