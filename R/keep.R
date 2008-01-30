keep <- function(..., list=character(0), all=FALSE, sure=FALSE)
{
  if(missing(...) && missing(list))
  {
    warning("Keep something, or use rm(list=ls()) to clear workspace. ",
            "Nothing was removed.")
    return(invisible(NULL))
  }
  names <- as.character(substitute(list(...)))[-1]
  list <- c(list, names)
  keep.elements <- match(list, ls(1,all.names=all))
  if(any(is.na(keep.elements)))
  {
    warning("You tried to keep \"", list[which(is.na(keep.elements))[1]],
            "\" which doesn't exist in workspace. Nothing was removed.", sep="")
    return(invisible(NULL))
  }

  if(sure)
    rm(list=ls(1,all.names=all)[-keep.elements], pos=1)
  else
    return(ls(1,all.names=all)[-keep.elements])
}

