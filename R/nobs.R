## Redefine here, so that the locally defined methods (particularly
## nobs.default) take precedence over the ones now defined in the
## stats package

nobs <- function(object, ...)
  UseMethod("nobs")

nobs.default <- function(object, ...)
{
  if(is.numeric(object) || is.logical(object))
    sum(!is.na(object))
  else
    stats::nobs(object, ...)
}


nobs.data.frame <- function(object, ...)
  sapply(object, nobs.default)

## Now provided by 'stats' package, so provide alias to satisfy
## dependencies
nobs.lm <- stats:::nobs.lm

n_obs <- function(object, ...) nobs(object, ...)
