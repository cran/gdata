
drop.levels  <- function(x, reorder=TRUE, ...)
  UseMethod("drop.levels")

drop.levels.default <- function(x, reorder=TRUE, ...)
  return(x)

drop.levels.factor <- function(x, reorder=TRUE, ...)
{
  x <- factor(x)
  if(reorder) x <- reorder(x, ...)
  return(x)
}

drop.levels.list <- function(x, reorder=TRUE, ...)
{
  return(lapply(x, drop.levels, reorder=reorder, ...))
}

drop.levels.data.frame <- function(x, reorder=TRUE, ...)
{
  x[] <- drop.levels.list(x, reorder=reorder, ...)
  return(x)
}
