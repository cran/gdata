# $Id: nobs.R,v 1.6 2005/06/09 14:20:24 nj7w Exp $

nobs <- function(x,...)
  UseMethod("nobs",x)

nobs.default <- function(x, ...) sum( !is.na(x) )

nobs.data.frame <- function(x, ...)
  sapply(x, nobs.default)

nobs.lm <- function(x, ...)
  nobs.default(x$residuals)
