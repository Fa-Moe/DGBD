#' Create Plots and Reports for N Columns
#'
#' Basic wrapper for BC_plot and BC_report intended to be used for large data frames.
#'
#' @param df_abundance A data frame that contains abundance data.
#' @param columns_select_multiple Optional. A vector that contains either column name strings or numeric column indices to be analyzed. By default includes all columns.
#' @param is_phyloseq Logical, optional. Use if the object to be analysed has the phyloseq class.
#' @param supress_messages Logical. Allows to skip messages that detail how many samples have been processed. Also stops the resulting data frame from being printed. Defaults to true.
#' @param report_only Logical. Use to output a data frame without the first column, intended to reduce the size of the output for large analyses. Defaults to false.
#' @param ... passes arguments to \code{BC_report} and \code{BC_plot}.
#'
#' @return A data frame where each row represents a fitted DGBD. The first column stores the BC_plot objects and the second column stores the BC_reports. Each object's output is stored inside of a list.
#' @export
#'
#' @examples
#' BC_multiple(Tara_Data,is_phyloseq=TRUE,columns_select_multiple = c(1:3))
#'

BC_multiple <- function(df_abundance, columns_select_multiple=NULL,is_phyloseq=FALSE,supress_messages=TRUE,report_only=FALSE,...){
  df_abundance <- BC_file_format_handler(df_abundance,is_phyloseq,...)
  if(!is.null(columns_select_multiple)){abundance_samples <- columns_select_multiple}
  else if (!is.null(colnames(df_abundance))){abundance_samples <- colnames(df_abundance)}
  else {abundance_samples <- 1:dim(df_abundance)[2]}
  multiple_analysis <- NULL
  temp_plot <- NULL
  temp_report <- NULL
  temp_row <- NULL
  sample_amount <- length(abundance_samples)
  for (i in 1:sample_amount){
    temp_plot <- BC_plot(df_abundance,abundance_samples[i],...)
    temp_report <- BC_report(BC_plot_object=temp_plot,...)
    if (report_only) {temp_row <- c(I(list(temp_report)))}
    else {temp_row <- c(I(list(temp_plot)),I(list(temp_report)))}
    multiple_analysis <- rbind(multiple_analysis,temp_row)
    if (!supress_messages){print(paste("Processed sample",i,"out of",sample_amount))}
  }
  if (report_only) {colnames(multiple_analysis) <- c("output_BC_reports")}
  else {colnames(multiple_analysis) <- c("otput_BC_plots","output_BC_reports")}
  rownames(multiple_analysis) <- abundance_samples
  return(multiple_analysis)
}



