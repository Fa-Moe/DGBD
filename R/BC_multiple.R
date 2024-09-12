#' Create Plots and Reports for N Columns
#'
#' Basic wrapper for BC_plot and BC_report intended to be used for large data frames.
#'
#' @param df_abundance A data frame that contains abundance data.
#' @param columns_select_multiple Optional. A vector that contains either column name strings or numeric column indices to be analyzed. By default includes all columns.
#' @param is_phyloseq Logical, optional. Use if the object to be analysed has the phyloseq class.
#' @param supress_messages Logical. Allows to skip messages that detail how many samples have been processed. Also stops the resulting data frame from being printed. Defaults to true.
#' @param report_only Logical. Use to output a data frame without the BC_plot object, intended to reduce the size of the output for large analyses. Defaults to false.
#' @param file_output_mode Logical. Whether to provide all analysis inside the R environment (when false) or to packet BC_report results into files (when true). Recommended when analyzing very large datasets.
#' @param called_from_many Automatically handled. An object name passed from BC_many.
#' @param ... passes arguments to \code{BC_report} and \code{BC_plot}.
#'
#' @return A data frame where each row represents a fitted DGBD. The first column stores the BC_plot objects and the second column stores the BC_reports. Each object's output is stored inside of a list.
#' @export
#'
#' @examples
#' BC_multiple(df_abundance=DGBD::MOMv3.3, columns_select_multiple = c(7:8))
#'

BC_multiple <- function(df_abundance, columns_select_multiple=NULL,is_phyloseq=FALSE,supress_messages=TRUE,report_only=FALSE,file_output_mode=FALSE,called_from_many=NULL, ...){
  df_abundance <- BC_file_format_handler(df_abundance,is_phyloseq,...)
  if(!is.null(columns_select_multiple))
    {
    abundance_samples <- columns_select_multiple
    if (is.numeric(columns_select_multiple[1])&!is.null(colnames(df_abundance)))
      {
      abundance_samples <- colnames(df_abundance)[columns_select_multiple]
      }
    }
  else if (!is.null(colnames(df_abundance))){abundance_samples <- colnames(df_abundance)}
  else {abundance_samples <- 1:dim(df_abundance)[2]}
  multiple_analysis <- NULL
  temp_plot <- NULL
  temp_report <- NULL
  temp_row <- NULL
  temp_name <- NULL
  sample_amount <- length(abundance_samples)
  for (i in 1:sample_amount){
    temp_plot <- BC_plot(df_abundance,abundance_samples[i],...)
    temp_report <- BC_report(BC_plot_object=temp_plot,...)
    if (file_output_mode) {
      if (!is.null(called_from_many)) {
        temp_name <- paste0(called_from_many, "_", "BC_report_", abundance_samples[i], ".pdf", sep = "")
      }
      else {
        temp_name <- paste0("BC_report_", abundance_samples[i], ".pdf", sep = "")
      }
      grDevices::pdf(temp_name, onefile = TRUE)
      print(temp_report[[3]])
      grDevices::dev.off()
      temp_row <- c(temp_report[[1]][,1],temp_report[[1]][,2],temp_report[[1]][,3],as.numeric(temp_report[[2]][2]),abundance_samples[i])
    }
    else{
      if (report_only) {temp_row <- c(I(list(temp_report)),abundance_samples[i])}
      else {temp_row <- c(I(list(temp_plot)),I(list(temp_report)),abundance_samples[i])}
    }
    multiple_analysis <- rbind(multiple_analysis,temp_row)
    if (!supress_messages){print(paste("Processed sample",i,"out of",sample_amount))}
  }
  if (file_output_mode){
    conf_names <- rownames(temp_report[[1]])
    colnames(multiple_analysis) <- c(paste0(conf_names[1],"_A",sep=""),paste0(conf_names[2],"_A",sep=""),paste0(conf_names[3],"_A",sep=""),paste0(conf_names[1],"_a",sep=""),paste0(conf_names[2],"_a",sep=""),paste0(conf_names[3],"_a",sep=""),paste0(conf_names[1],"_b",sep=""),paste0(conf_names[2],"_b",sep=""),paste0(conf_names[3],"_b",sep=""),paste(temp_report[[2]][1]),"SampleID")
    if (!is.null(called_from_many))
      {
        temp_name <- paste0(called_from_many,"_BC_report_frame")
        assign(temp_name,multiple_analysis)
        save(list=temp_name,file=paste0(temp_name,".RData",sep=""))
      }
      else
      {
        temp_name <- paste0("BC_report_frame", sep = "")
        assign(temp_name,multiple_analysis)
        save(list=temp_name,file=paste0(temp_name,".RData",sep=""))
      }
    }
  else{
    if (report_only) {colnames(multiple_analysis) <- c("output_BC_reports","SampleID")}
    else {colnames(multiple_analysis) <- c("otput_BC_plots","output_BC_reports","SampleID")}
  }
  if (!supress_messages){return(multiple_analysis)}
  else {invisible(multiple_analysis)}
}



