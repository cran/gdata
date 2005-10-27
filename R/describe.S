"describe"<-
function(y, digits=2)
{
    func <- function(y,digits)
      {
	x <- as.matrix(y)
	m <- length(x[1,  ])
	result <- matrix(nrow = 11, ncol = m)
	result[1,  ] <- apply(x, 2, mean, na.rm = TRUE)
	result[2,  ] <- apply(x, 2, min, na.rm = TRUE)
	result[3,  ] <- apply(x, 2, quantile, .25, na.rm = TRUE)
	result[4,  ] <- apply(x, 2, median, na.rm = TRUE)
	result[5,  ] <- apply(x, 2, quantile, .75, na.rm = TRUE)
	result[6,  ] <- apply(x, 2, max, na.rm = TRUE)
	result[7,  ] <- apply(x, 2, sum, na.rm = TRUE)
	result[8,  ] <- apply(x, 2, stdev)
	result[9,  ] <- apply(x, 2, numna)
	fun <- function(x) {length(unique(x))}
	result[10, ] <- apply(x,2, fun)
	result[11, ] <- length(x[, 1])

	dimnames(result) <- list(c("Mean", "Min", "Q1", "Median",
		"Q3", "Max", "Sum", "StdDev", "NA's",
		"Unique","Count"), dimnames(x)[[2]])

	return(round(result,digits))
      }

    if (is.data.frame(y)) 
      ret <- func(y,digits)
    else if (is.list(y)) 
      ret <- lapply(y,func,digits)
    else
      ret <- func(y,digits)
    
    ret

}

