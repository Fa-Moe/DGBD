radBC_report <- function(data_frame_abundance,column,show_plot=T,show_stats=T){
  t_BCplot<-radBC_plot(data_frame_abundance,column)
  if(show_stats){print("The data fit the DGBD distribution with parameters:")}
  param_matrix <- rbind(t(t_BCplot[[4]])[1,],t_BCplot[[2]],t(t_BCplot[[4]])[2,])
  rownames(param_matrix) <- c("2.5%","50%","97.5%")
  colnames(param_matrix) <- c("A","a","b")
  if(show_stats){print(param_matrix)}
  if(show_stats){print("And the fit has an R2 of:")}
  r2<-t_BCplot[[5]]$adj.r.squared
  if(show_stats){print(r2)}
  if(show_plot){plot(t_BCplot[[7]])}
  summary_output<-list(param_matrix,r2,t_BCplot[[7]])
  invisible(summary_output)
}
