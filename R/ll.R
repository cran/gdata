ll <- function(pos=1, unit=c("KB","MB","bytes"), digits=0, dimensions=FALSE,
               function.dim="", sort.elements=FALSE, ...)
{
  get.object.classname <- function(object.name, pos)
  {
    object <- get(object.name, pos=pos)
    classname <- class(object)[1]
    return(classname)
  }

  get.object.dimensions <- function(object.name, pos)
  {
    object <- get(object.name, pos=pos)
    if(class(object)[1] == "function")
      dimensions <- function.dim
    else if(!is.null(dim(object)))
      dimensions <- paste(dim(object), collapse=" x ")
    else
      dimensions <- length(object)
    return(dimensions)
  }

  get.object.size <- function(object.name, pos)
  {
    object <- get(object.name, pos=pos)
    size <- try(object.size(object), silent=TRUE)
    if(class(size) == "try-error")
      size <- 0
    return(size)
  }

  unit <- match.arg(unit)
  denominator <- switch(unit, "KB"=1024, "MB"=1024^2, 1)

  if(is.character(pos))  # pos is an environment name
    pos <- match(pos, search())
  if(is.list(pos))  # pos is a list-like object
  {
    if(length(pos) == 0)
      return(data.frame())
    attach(pos, pos=2)
    original.rank <- rank(names(pos))
    was.list <- TRUE
    pos <- 2
  }
  else
  {
    was.list <- FALSE
  }
  if(length(ls(pos,...)) == 0)  # pos is an empty environment
  {
    object.frame <- data.frame()
  }
  else if(search()[pos] == "Autoloads")  # pos is the autoload environment
  {
    object.frame <- data.frame(rep("function",length(ls(pos,...))),
                      rep(0,length(ls(pos,...))), row.names=ls(pos,...))
    if(dimensions)
    {
      object.frame <- cbind(object.frame, rep(function.dim,nrow(object.frame)))
      names(object.frame) <- c("Class", unit, "Dimensions")
    }
    else
      names(object.frame) <- c("Class", unit)
  }
  else
  {
    class.vector <- sapply(ls(pos,...), get.object.classname, pos=pos)
    size.vector <- sapply(ls(pos,...), get.object.size, pos=pos)
    size.vector <- round(size.vector/denominator, digits)
    object.frame <- data.frame(class.vector=class.vector,
                      size.vector=size.vector, row.names=names(size.vector))
    names(object.frame) <- c("Class", unit)
    if(dimensions)
      object.frame <- cbind(object.frame, Dim=sapply(ls(pos,...),
                        get.object.dimensions, pos=pos))
  }
  if(was.list)
  {
    detach(pos=2)
    if(!sort.elements)
      object.frame <- object.frame[original.rank, ]
  }

  return(object.frame)
}

