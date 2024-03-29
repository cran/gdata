## Test setup
if(FALSE) {
  library("RUnit")
  library("gdata")
}

test.reorder.factor <- function()
{
  tmp <- Sys.getlocale(category="LC_COLLATE")
  Sys.setlocale(category="LC_COLLATE", locale="C")

  ## Create a 4 level example factor
  levs <- c("PLACEBO", "300 MG", "600 MG", "1200 MG")
  trt <- factor(rep(x=levs, times=c(22, 24, 28, 26)))

  ## Change the order to something useful
  ## default "mixedsort" ordering
  trt2 <- reorder(trt)
  levsTest <- c("300 MG", "600 MG", "1200 MG", "PLACEBO")
  checkIdentical(levels(trt2), levsTest)

  ## Using indexes
  trt3 <- reorder(trt, new.order=c(4, 2, 3, 1))
  levsTest <- c("PLACEBO", "300 MG", "600 MG", "1200 MG")
  checkIdentical(levels(trt3), levsTest)

  ## Using label names
  trt4 <- reorder(trt, new.order=c("PLACEBO", "300 MG", "600 MG", "1200 MG"))
  levsTest <- c("PLACEBO", "300 MG", "600 MG", "1200 MG")
  checkIdentical(levels(trt4), levsTest)

  ## Using frequency
  trt5 <- reorder(trt, X=as.numeric(trt), FUN=length)
  levsTest <- c("PLACEBO", "300 MG", "1200 MG", "600 MG")
  checkIdentical(levels(trt5), levsTest)

  ## Drop out the '300 MG' level
  trt6 <- reorder(trt, new.order=c("PLACEBO", "600 MG", "1200 MG"))
  levsTest <- c("PLACEBO", "600 MG", "1200 MG")
  checkIdentical(levels(trt6), levsTest)

  Sys.setlocale(category="LC_COLLATE", locale=tmp)
}
