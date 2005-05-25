# $Id: read.xls.R,v 1.7 2005/05/13 18:59:38 nj7w Exp $

read.xls <- function(xls, sheet = 1, verbose=FALSE, ..., perl="perl")
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
  on.exit(file.remove(csv))  
  
  # now read the csv file
  out <- read.csv(csv, ...)

  # clean up
  file.remove(csv)
  
  return(out)
}
