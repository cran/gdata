## s$Id: read.xls.R 1342 2009-07-16 02:49:11Z warnes $

## Double quote string using *ASCII* double quotes.
##
## (The base 'dQuote' uses local-specific quotes (e.g UTF-8 quotes)
## which Unix command line doesn't like.)
##
dQuote.ascii <- function(x) paste('"',x,'"',sep='')

