## Test setup
if(FALSE) {
  library("RUnit")
  library("gdata")
}

test.trim <- function()
{
  tmp <- Sys.getlocale(category="LC_COLLATE")
  Sys.setlocale(category="LC_COLLATE", locale="C")

  sTrim <- "    this is an example string    "
  sTrimR <- "this is an example string"

  fTrim <- factor(c(sTrim, sTrim, " A", " B ", "  C ", "D "))
  fTrimR <- factor(c(sTrimR, sTrimR, "A", "B", "C", "D"))

  lTrim <- list(s=rep(sTrim, times=6), f=fTrim, i=1:6)
  lTrimR <- list(s=rep(sTrimR, times=6), f=fTrimR, i=1:6)

  dfTrim <- as.data.frame(lTrim)
  dfTrimR <- as.data.frame(lTrimR)

  checkIdentical(trim(sTrim), sTrimR)
  checkIdentical(trim(fTrim), fTrimR)
  checkIdentical(levels(trim(fTrim, recode.factor=FALSE)),
                 c("this is an example string", "C", "A", "B", "D"))
  checkIdentical(trim(lTrim), lTrimR)
  checkIdentical(trim(dfTrim), dfTrimR)

  Sys.setlocale(category="LC_COLLATE", locale=tmp)
}
