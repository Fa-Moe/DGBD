#' Generate random points on a DGB Distribution.
#'
#' Receives a set of parameters and generates a set of "x" ranking points that
#' are uniformly random in a linear space and then calculates their expected "y"
#' or abundance values. Function derived from:
#' Fontanelli, O., Miramontes, P., Mansilla, R., Cocho, G., & Li, W. (2022).
#' Beta rank function: A smooth double-Pareto-like distribution. Communications
#' in Statistics - Theory and Methods, 51(11), 3645–3668.
#' https://doi.org/10.1080/03610926.2020.1800739
#'
#' @param parameters A numeric vector (A,a,b,max,n).
#'
#' @return A data frame with x,y values
#' @export
#'
#' @examples
#' BC_random(c(25,0.3,0.1,50,4))
#'
#' plot(BC_random(c(25,0.3,0.1,50,100)))

BC_random<-function(parameters){
  if (any(!is.numeric(parameters))){stop("All values in the parameters vector must be numeric")}
  if (length(parameters)!=5){stop("There is an incorrect number of elements in the parameters vector")}
  names(parameters) <- c("A","a","b","max","n")
  randomx<-parameters["max"]*stats::runif(parameters["n"])
  randomy<-parameters["A"]*(parameters["max"]-randomx)^parameters["b"]/randomx^parameters["a"]
  output <- cbind (randomx,randomy)
  return(output)
}
