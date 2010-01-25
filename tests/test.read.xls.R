library(gdata)


# iris.xls is included in the gregmisc package for use as an example
xlsfile <- file.path(.path.package('gdata'),'xls','iris.xls')

iris.1 <- read.xls(xlsfile) # defaults to csv format
iris.1

iris.2 <- read.xls(xlsfile,method="csv") # specify csv format
iris.2

iris.3 <- read.xls(xlsfile,method="tab") # specify tab format
iris.3

stopifnot(all.equal(iris.1, iris.2))
stopifnot(all.equal(iris.1, iris.3))

exampleFile <- file.path(.path.package('gdata'),'xls',
                         'ExampleExcelFile.xls')

exampleFile2007 <- file.path(.path.package('gdata'),'xls',
                         'ExampleExcelFile.xlsx')

# see the number and names of sheets:
sheetCount(exampleFile)
sheetCount(exampleFile2007)

sheetNames(exampleFile)
sheetNames(exampleFile2007)

example.1 <- read.xls(exampleFile, sheet=1) # default is first worksheet
example.1

example.2 <- read.xls(exampleFile, sheet=2) # second worksheet by number
example.2

example.3 <- read.xls(exampleFile, sheet=3) # second worksheet by number
example.3

example.4 <- read.xls(exampleFile, sheet=3) # second worksheet by number
example.4

example.x.1 <- read.xls(exampleFile2007, sheet=1) # default is first worksheet
example.x.1

example.x.2 <- read.xls(exampleFile2007, sheet=2) # second worksheet by number
example.x.2

example.x.3 <- read.xls(exampleFile2007, sheet=3) # second worksheet by number
example.x.3

example.x.4 <- read.xls(exampleFile2007, sheet=3) # second worksheet by number
example.x.4

data <- read.xls(exampleFile2007, sheet="Sheet Second") # and by name
data

# load the third worksheet, skipping the first two non-data lines...
data <- read.xls(exampleFile2007, sheet="Sheet with initial text", skip=2)
data
