radBC_plot <- function(data_frame_abundance,column){
  temp_model <- BC_model(data_frame_abundance,column)
  BC_data <- temp_model[[1]]
  BC_func <- temp_model[[4]]
  temp_plot <- ggplot2::ggplot(data=BC_data,ggplot2::aes(x=BC_data[,"radBC_rank"],y=BC_data[,"abundance"]))+
    ggplot2::theme(text = ggplot2::element_text(family = "mono"))+
    ggplot2::geom_point(color="#ad8c79",size=1)+
    ggplot2::geom_line(ggplot2::aes(x=BC_data[,"radBC_rank"],y=BC_data[,"predicted_values"]),color="black",alpha=0.5,lwd=0.5)+
    ggplot2::geom_ribbon(ggplot2::aes(x=BC_data[,"radBC_rank"], ymax=BC_data[,"upr"], ymin=BC_data[,"lwr"]), fill="#ffd078", alpha=0.5)+
    ggplot2::geom_line(ggplot2::aes(y = BC_data[,"upr"]), colour = "#ed8666",lwd=1,alpha=0.5)+
    ggplot2::geom_line(ggplot2::aes(y = BC_data[,"lwr"]), colour = "#ed8666",lwd=1,alpha=0.5)+
    ggplot2::coord_trans(y = "log10")+
    ggplot2::labs(title=c("Rank-Abundance Diagram"),
           x="Rank",
           y="log10(Abundance)")+
    ggplot2::annotate("label",
             x = min(BC_data[,"radBC_rank"])+mean(BC_data[,"radBC_rank"])/5,
             y = min(BC_data[,"abundance"])+mean(BC_data[,"abundance"])/10,
             label = paste("R2 = ",format(round(temp_model[[5]]$adj.r.squared, 4), nsmall = 4),
                           "\n","DGBD distribution parameters:",
                           "\n","A=",format(round(temp_model[[2]]["A"], 4), nsmall = 4),
                           "\n","a=",format(round(temp_model[[2]]["a"], 4), nsmall = 4),
                           "\n","b=",format(round(temp_model[[2]]["b"], 4), nsmall = 4)),
             size=3)
  temp_model[[7]] <- temp_plot
  return(temp_model)
}
