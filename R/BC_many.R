#' BC_multiple for Many Objects
#'
#' Analyses N objects using \code{BC_multiple} in sequence.
#'
#' @param object_names A vector containing the names of the objects to process.
#' @param column Optional. A list that contains vectors that indicate which columns to select for each processed object. Order must be matched with object_names.
#' @param use_paths Optional. Set to true when the object_names vector uses paths instead of loaded objects.
#' @param is_phyloseq Optional. Set to true if the objects to analyse have the phyloseq class.
#' @param supress_messages_many Whether to hide the report progress that indicates how many objects are left to analyse. Also stops the resulting data frame from being printed. Defaults to true.
#' @param ... Passes arguments to \code{BC_multiple}
#'
#' @return A data frame that contains BC_multiple style information with a column appended to the right that indicates to which object the analysis belongs.
#' @export
#'
#' @examples
#' to_analyze <- c("Weblinks","Billionaires","MOMv3.3")
#' columns_to_use <-list(2,2,c(7,8))
#' BC_many(to_analyze,columns_to_use)

BC_many <- function(object_names,column=NULL,use_paths=FALSE,is_phyloseq=FALSE,supress_messages_many=TRUE,...){
  temp_object <- NULL
  temp_mul_analysis <- NULL
  many_analysis <- NULL
  object_length <-length(object_names)
  for (i in 1:object_length){
    if(use_paths){temp_object <- object_names[i]}
    else{temp_object <- get(object_names[i])}
    temp_mul_analysis <- BC_multiple(df_abundance=temp_object,column=column[[i]],is_phyloseq=is_phyloseq,called_from_many=object_names[i],...)
    temp_mul_analysis <- cbind(temp_mul_analysis,object_names[i])
    many_analysis <- rbind(many_analysis,temp_mul_analysis)
    if (!supress_messages_many){print(paste("Processed object",i,"out of",object_length))}
  }
  return(many_analysis)
}
