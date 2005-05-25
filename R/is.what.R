# $Id: is.what.R,v 1.5 2004/09/03 17:27:44 warneg Exp $

is.what <- function(object, verbose=FALSE)
{
  do.test <- function(test, object)
  {
    result <- all(get(test)(object))
    return(result)
  }

  # get all names starting with "is."
  is.names <- unlist(sapply( search(),
                            function(name) ls(name, pattern="^is\\.")))

  # narrow to functions
  is.functions <- is.names[sapply( is.names, function(x) is.function(get(x)) )]

  not.using <- c("is.element", "is.empty.model", "is.loaded", "is.mts",
                 "is.na.data.frame", "is.na.POSIXlt", "is.na<-",
                 "is.na<-.default", "is.na<-.factor", "is.pairlist", "is.qr",
                 "is.R", "is.single", "is.unsorted",
                 "is.what")
  tests <- is.functions[!(is.functions %in% not.using)]
  names(tests) <- NULL
  results <- sapply(tests, do.test, object=object)
  names(results) <- tests


  if(verbose == FALSE)
  {
    output <- tests[results==TRUE & !is.na(results)]
  }
  else
  {
    results[results==TRUE] <- "T"
    results[results==FALSE] <- "."
    output <- data.frame(is=I(results))
  }

  return(output)
}

