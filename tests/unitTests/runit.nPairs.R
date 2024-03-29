## Test setup
if(FALSE) {
  library("RUnit")
  library("gdata")
}

test.nPairs <- function()
{
  ## 'x' must be a data.frame or a matrix
  x <- rpois(100, lambda=10)
  checkException(nPairs(x=x))
  checkException(nPairs(x=table(x)))

  test <- data.frame(V1=c(1, 2, 3, 4, 5),
                     V2=c(NA, 2, 3, 4, 5),
                     V3=c(1, NA, NA, NA, NA),
                     V4=c(1, 2, 3, NA, NA))
  testCheck <- matrix(data=as.integer(c(5, 4, 1, 3,
                                        4, 4, 0, 2,
                                        1, 0, 1, 1,
                                        3, 2, 1, 3)),
                      nrow=4, ncol=4, byrow=TRUE)
  class(testCheck) <- c("nPairs", class(testCheck))

  testCheckNames <- testCheck
  colnames(testCheckNames) <- rownames(testCheckNames) <- colnames(test)

  checkIdentical(nPairs(x=test), testCheckNames)
  checkIdentical(nPairs(x=test, names=FALSE), testCheck)
  checkIdentical(nPairs(x=as.matrix(test)), testCheckNames)
  checkIdentical(nPairs(x=as.matrix(test), names=FALSE), testCheck)

  testCheck <- cbind(testCheckNames, as.integer(c(5, 4, 0, 0)))
  class(testCheck) <- class(testCheckNames)
  colnames(testCheck) <- c(colnames(test), "all")
  checkIdentical(nPairs(x=test, margin=TRUE), testCheck)

  testCheckSumm <- matrix(data=as.integer(c(0, 1, 4, 2,
                                            0, 0, 4, 2,
                                            0, 1, 0, 0,
                                            0, 1, 2, 0)),
                          nrow=4, ncol=4, byrow=TRUE)
  dimnames(testCheckSumm) <- dimnames(testCheckNames)
  tmp <- summary(nPairs(x=test))
  checkEquals(tmp, testCheckSumm)
}
