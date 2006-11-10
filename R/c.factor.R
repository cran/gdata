# $Id: c.factor.R 993 2006-10-30 17:10:08Z ggorjan $

c.factor <- function(...,
                     recursive=FALSE # ignored
                     )
{
  dots <- list(...) # recursive below is not related to one above!
  if (!all(sapply(dots,class),factor) )
    NextMethod("c")
  mapCha <- c(mapLevels(dots, codes=FALSE), recursive=TRUE)
  class(mapCha) <- "levelsMap"
  dots <- unlist(lapply(dots, "mapLevels<-", mapCha))
  mapLevels(dots) <- mapLevels(as.character(mapCha))
  dots
}



                                               
                                            
