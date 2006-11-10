### tests.write.fwf.R
###------------------------------------------------------------------------
### What: Tests for write.fwf
### $Id: tests.write.fwf.R 997 2006-10-30 19:04:53Z ggorjan $
### Time-stamp: <2006-10-30 19:54:59 ggorjan>
###------------------------------------------------------------------------

library(gdata)

## --- Test data ---

num <- c(733070.345678, 1214213.78765456, 553823.798765678,
         1085022.8876545678,  571063.88765456, 606718.3876545678,
         1053686.6, 971024.187656, 631193.398765456, 879431.1)

testData <- data.frame(num1=c(1:10, NA),
                       num2=c(NA, seq(from=1, to=5.5, by=0.5)),
                       num3=c(NA, num),
                       int1=c(as.integer(1:4), NA, as.integer(5:10)),
                       fac1=factor(c(NA, letters[1:10])),
                       fac2=factor(c(letters[6:15], NA)),
                       cha1=c(letters[17:26], NA),
                       cha2=c(NA, letters[26:17]),
                       stringsAsFactors=FALSE)
levels(testData$fac1) <- c(levels(testData$fac1), "unusedLevel")
testData$Date <- as.Date("1900-1-1")
testData$Date[2] <- NA
testData$POSIXt <- as.POSIXct(strptime("1900-1-1 01:01:01", format="%Y-%m-%d %H:%M:%S"))
testData$POSIXt[5] <- NA

## --- Tests ---

## Default
write.fwf(testData)

## NA should be - or ------------
write.fwf(x=testData, na="-")
write.fwf(x=testData, na="------------")

## Some other separator than space
write.fwf(testData[, 1:4], sep="-mySep-")

## With quotes
write.fwf(testData, quote=TRUE)

## Without rownames
write.fwf(testData, rownames=FALSE)

## Without colnames
write.fwf(testData, colnames=FALSE)

## Without rownames and colnames
write.fwf(testData, rownames=FALSE, colnames=FALSE)

## With rownames and colnames and rowCol
write.fwf(testData, rowCol="HI!")

## formatInfo in unit tests

###------------------------------------------------------------------------
### tests.write.fwf.R ends
