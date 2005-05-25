# $Id: nobs.R,v 1.5 2004/09/03 17:27:44 warneg Exp $

nobs <- function(x,...)
  UseMethod("nobs",x)

nobs.default <- function(x, ...) sum( !is.na(x) )

nobs.data.frame <- function(x, ...)
  sapply(x, nobs.default)

nobs.lm <- function(x, ...)
  nobs.default(x$residuals)
