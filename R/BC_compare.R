#' Compare the linear and the nls methods parameters
#'
#' Creates a graph that illustrates error in the predictions of the linear and nls models for quick comparison. The y axis is the difference between the predicted value and the original abundance value. This value is then made absolute and 1 is added before taking its logarithm. The addition of 1 keeps a difference of 0 as 0 in the plot and prevents a small decimal linear difference from becoming a large difference in the plot. The x axis is the rank for that given error. This allows us to see where in the distribution each model performs better or worse.
#'
#'
#' @param df_abundance A data frame that contains abundance data.
#' @param column Either a string with the name of the column or the number of the column that stores the abundances in the data frame.
#' @param BC_plot_list A list that contains 2 objects previously generated with \code{BC_plot}. The first one must use the linear paramenters and the second one parameters estimated by the nls method.
#' @param c_gfx_title String. Changes the title of the graph.
#' @param c_gfx_label Logical. Adds a label that adds the model_extra data of both models. Defaults to true.
#' @param ... passes arguments to \code{BC_plot}.
#'
#' @return A list with that includes a graph and a data frame with difference data between predicted and real values per model.
#' @export
#'
#' @examples
#' comparehmp_wgs <- BC_compare(hmp_wgs,2)
#' comparehmp_wgs[[1]]
#' head(comparehmp_wgs[[2]])
#'
#' compareEC_Metabolite <- BC_compare(EC_Metabolite, column = 2,model_extra="S")
#' compareEC_Metabolite[[1]]
#' head(compareEC_Metabolite[[2]])

BC_compare <- function(df_abundance=NULL,column=NULL,BC_plot_list=NULL,c_gfx_title="Linear vs nls model error",c_gfx_label=TRUE,...){
  if(!is.null(BC_plot_list)){
    naive <- BC_plot_list[[1]]
    nls_obj <- BC_plot_list[[2]]
    }
  else if (!is.null(df_abundance)){
    naive <- BC_plot(df_abundance,column=column,...)
    nls_obj <- BC_plot(df_abundance,column=column,nls=T,...)
    }
  else {stop("Neither an abundance data frame or a BC_plot_list were provided")}
  ys_data <-  data.frame(
    y_real = naive[[1]][,"abundance"],
    y_linear = naive[[1]][,"predicted_values"],
    y_nls =  nls_obj[[1]][,"predicted_values"],
    x_real = naive[[1]][,"BC_rank"]
  )

  ys_diffs <- c(t(log10(abs(ys_data[,"y_linear"]-ys_data[,"y_real"])+1)),t(log10(abs(ys_data[,"y_nls"]-ys_data[,"y_real"])+1)))
  ys_diff_type <- c(rep("linear",length(ys_data[,"y_linear"])), rep("nls",length(ys_data[,"y_nls"])))
  diff_data <-  as.data.frame(cbind(c(naive[[1]][,"BC_rank"],naive[[1]][,"BC_rank"]),ys_diffs,ys_diff_type))
  colnames(diff_data) <- c("Rank","Difference","Type")

  grafx_compare <- ggplot2::ggplot(data=diff_data,ggplot2::aes(x=as.numeric(diff_data[,"Rank"]),y=as.numeric(diff_data[,"Difference"]),group=diff_data[,"Type"],col=diff_data[,"Type"]))+
    ggplot2::geom_line()+
    ggplot2::scale_color_manual(values=c("#61C906","#B606C9"))+
    ggplot2::labs(title=c_gfx_title,
                  x="Rank",
                  y="log10(Error+1)")+
    ggplot2::annotate("label",
                      x = max(as.numeric(diff_data[,"Rank"]))*4/5,
                      y = max(as.numeric(diff_data[,"Difference"]))*4/5,
                      label =
                        if (c_gfx_label){paste(naive[[8]][1]," value of the different models",
                                             "\n","linear =",format(round(as.numeric(naive[[8]][2]), 4), nsmall = 4),
                                             "\n","nls =",format(round(as.numeric(nls_obj[[8]][2]), 4), nsmall = 4)
                                             )}
                      else {NULL},
                      size=3)

  return(list(grafx_compare,diff_data))
  }

