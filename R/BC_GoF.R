BC_GoF <- function(values=NULL,type=NULL,...){
 if (is.null(values)){stop("An error ocurred when retrieving model data in BC_plot()")}
 if (type=="MSE"){
   n <- length(values[,"predicted_values"])
   t_error <- values[,"predicted_values"]-values[,"abundance"]
   sqerror <- t_error^2
   sqerror_sum <- sum(sqerror)
   output <- sqerror_sum/n
 }
 else if (type=="S"){
   n <- length(values[,"predicted_values"])
   t_error <- values[,"predicted_values"]-values[,"abundance"]
   sqerror <- t_error^2
   sqerror_sum <- sum(sqerror)
   output <- sqrt(sqerror_sum/(n-2))
 }
 else if (type=="R2"){
   t_error <- values[,"predicted_values"]-values[,"abundance"]
   n <- length(values[,"predicted_values"])
   sqerror <- t_error^2
   ss_res <- sum(sqerror)

   t_mean <- mean(values[,"abundance"])
   t_tot <- values[,"abundance"]-t_mean
   sqtot <- t_tot^2
   ss_tot <- sum(sqtot)
   output <- 1-ss_res/ss_tot
 }
 else {stop("An invalid model_extra string was given to BC_plot()")}
 invisible(output)
}


