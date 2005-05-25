drop.levels <- function(x, reorder = TRUE, ...) {
  sapply(x, function(xi)
              {
                if(is.factor(xi))
                  {
                    xi <- factor(xi)
                    if(reorder)
                      xi <- reorder.factor(xi, ...)
                  }
                xi
              }
         )
}
