#' Print method for convenience.table
#' 
#' @param x A list of convenience.diag type
#' @param ... (various) Additional arguments
#' 
#' @export

print.convenience.table <- function(x, ...){
  print(summary(x))
}