### doRUnit.R
###------------------------------------------------------------------------
### What: Run RUnit tests
### $Id: doRUnit.R 993 2006-10-30 17:10:08Z ggorjan $
### Time-stamp: <2006-10-29 16:37:40 ggorjan>
###------------------------------------------------------------------------

if(require("RUnit", quietly=TRUE)) {

  ## --- Setup ---

  wd <- getwd()
  pkg <- basename(sub(pattern="tests$", replacement="", wd))
  ## Path for standalone i.e. not by R CMD check testing
  if(Sys.getenv("RCMDCHECK") == "FALSE") {
    path <- file.path("..", "inst")
  } else {
    pkg <- sub(pattern="\.Rcheck$", replacement="", pkg)
    path <- file.path("..", pkg)
  }
  path <- file.path(wd, path, "unitTests")
  pathReport <- file.path(path, "report")

  library(package=pkg, character.only=TRUE)

  ## --- Testing ---

  ## Define tests
  testSuite <- defineTestSuite(name=paste(pkg, "unit testing"), dirs=path)
  ## Run
  tests <- runTestSuite(testSuite)

  ## Print results
  printTextProtocol(tests)
  printTextProtocol(tests, fileName=paste(pathReport, ".txt", sep=""))

  ## Print HTML version to a file
  printHTMLProtocol(tests, fileName=paste(pathReport, ".html", sep=""))

  ## Return stop() if there are any failures i.e. FALSE to unit test.
  ## This will cause R CMD check to return error and stop
  if(getErrors(tests)$nFail > 0) {
    stop("one of unit tests failed")
  }
}

###------------------------------------------------------------------------
### doRUnit.R ends here
