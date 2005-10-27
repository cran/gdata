is.what <- function(object, verbose=FALSE)
{
  do.test <- function(test, object)
  {
    result <- try(get(test)(object), silent=TRUE)
    if(!is.logical(result) || length(result)!=1)
      result <- NULL
    return(result)
  }

  ## Get all names starting with "is."
  is.names <- unlist(sapply(search(), function(name) ls(name,pattern="^is\\.")))

  ## Narrow to functions
  is.functions <- is.names[sapply(is.names, function(x) is.function(get(x)))]

  tests <- sort(unique(is.functions))
  results <- suppressWarnings(unlist(sapply(tests, do.test, object=object)))

  if(verbose)
  {
    results <- as.character(results)
    results[results=="TRUE"] <- "T"
    results[results=="FALSE"] <- "."
    output <- data.frame(is=results)
  }
  else
  {
    output <- names(results)[results]
  }

  return(output)
}

