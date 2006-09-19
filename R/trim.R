# $Id: trim.R 983 2006-09-18 20:24:18Z warnes $

trim <- function(s, recode.factor=TRUE)
  UseMethod("trim", s)

trim.default <- function(s, recode.factor=TRUE)
  s

trim.character <- function(s, recode.factor=TRUE)
{
  s <- sub(pattern="^ +", replacement="", x=s)
  s <- sub(pattern=" +$", replacement="", x=s)
  s
}

trim.factor <- function(s, recode.factor=TRUE)
{
  levels(s) <- trim(levels(s))
  if(recode.factor) s <- reorder.factor(s, sort=sort)
  s
}

trim.list <- function(s, recode.factor=TRUE)
  lapply(s, trim, recode.factor=recode.factor)

trim.data.frame <- function(s, recode.factor=TRUE)
{
  s[] <- trim.list(s, recode.factor=recode.factor)
  s
}
