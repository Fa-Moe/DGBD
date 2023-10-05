#' Estimate the DGBD Distribution Parameters
#'
#' Estimates the parameters of the DGBD distribution proposed in Martinez-Mekler (2009) <doi:10.1371/journal.pone.0004791> for a given set of data.
#' \code{BC_param} calculates the log of the data and estimates the abundance from the ranking using a linear model.
#' The coefficients of the linear model are then scaled for posterior use.
#'
#' @param df_abundance A data frame that contains abundance data.
#' @param column Either a string with the name of the column or the number of the column that stores the abundances in the data frame.
#' @param confidence_interval The confidence interval to calculate for the DGBD distribution.
#'
#' @return A list with the following elements: The input data frame with added processed ranking data and predicted confidence interval values, the adjusted parameters, the confidence interval of the parameters, the linear model and a summary of the model.
#' @export
#'
#' @examples
#' BC_param(datasets::iris,"Petal.Length")
#'
#' BC_param(datasets::PlantGrowth,1,confidence_interval=0.99)
#'
#' BC_param(datasets::ToothGrowth,"len",confidence_interval=0.999)

BC_param <- function(df_abundance,column,confidence_interval=0.95){
  ranked_frame <- generate_rank(df_abundance,column)
  r <- ranked_frame[,"radBC_rank"]
  N <- max(r)
  pre_numerator <- N+1-r
  pre_denominator <- r
  log_num <- log(pre_numerator)
  log_den <- log(pre_denominator)
  log_abundance  <- log(df_abundance[,column])
  lfit <- stats::lm(log_abundance~log_den+log_num)
  params<- c(exp(stats::coef(lfit)[1]),-1*stats::coef(lfit)[2],stats::coef(lfit)[3])
  names(params) <- c("A","a","b")
  conf_inter <- stats::predict(lfit, as.data.frame(cbind(log_abundance,log_den,log_num)), interval = "confidence", level = confidence_interval)
  conf_inter <- exp(conf_inter)
  param_conf <- stats::confint(lfit)
  param_conf[1,] <- exp(param_conf[1,])
  param_conf[2,] <- -1*param_conf[2,]
  output_frame <- cbind(ranked_frame[,1],pre_numerator,pre_denominator,conf_inter[,2:3],ranked_frame[,2:dim(ranked_frame)[2]])
  colnames(output_frame)[1] <- "radBC_rank"
  output <- list(output_frame,params,param_conf,lfit,summary(lfit))
  return(output)
}
