### runRUnitTests.R
###------------------------------------------------------------------------
### What: Run RUnit tests (wrapper function) - R code
### $Id$
### Time-stamp: <2008-12-30 20:59:11 ggorjan>
###------------------------------------------------------------------------

.runRUnitTestsGdata <- function(testFileRegexp="^runit.+\\.[rR]$")
{
  ## Setup
  .pkg <- environmentName(environment(.runRUnitTestsGdata))
  .path <- system.file("unitTests", package=.pkg)
  .suite <- file.path(.path, "runRUnitTests.R")

  ## Some checks
  stopifnot(file.exists(.path),
            file.info(path.expand(.path))$isdir,
            file.exists(.suite))

  ## Run the suite
  .way <- "function"
  source(.suite, local=TRUE)
  ## local=TRUE since .pkg and other vars do not exists in .suite environment
}

###------------------------------------------------------------------------
### runRUnitTests.R ends here
