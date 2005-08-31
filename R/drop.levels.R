drop.levels <- function(x, reorder = TRUE, ...) {
 as.data.frame(lapply(x, function(xi) {
    if(is.factor(xi)) {
      xi <- factor(xi)
      if(reorder)
        xi <- reorder(xi, ...)
    }
    xi
  }))
}
