#' Rank the Abundance from a File or Data Frame
#'
#' Sorts the df_abundance dataframe by the given column_rank column.
#'
#' @param df_abundance The data frame to use. A string that contains a path can be used to load files.
#' @param column_rank Can be either a string containing the name of the column or an int that is its index
#' @param rank_threshold Optional. Integer. Discards rows if their column_rank value is equal to or lower than it. Defaults to 0.
#' @param is_phyloseq Logical, optional. Use if the object to be analysed has the phyloseq class.
#' @param ... passes arguments to \code{read.table}.
#'
#' @return The input data frame with a column appended to the left that stores the generated ranking. The column used for ranking is renamed "abundance".
#' @export
#'
#' @examples
#' BC_rank(df_abundance=DGBD::Weblinks, column_rank=2, rank_threshold=4)
#'
#' BC_rank(Tara_Data,3,is_phyloseq=TRUE)
#'

BC_rank <- function(df_abundance,column_rank,rank_threshold=0,is_phyloseq=FALSE,...){
  df_abundance <-BC_file_format_handler(df_abundance,is_phyloseq,...)
  if (!is.numeric(column_rank)){
    column_rank<-which(match(names(df_abundance),column_rank)==1)
  }
  if (!is.numeric(df_abundance[1,column_rank])){stop("The selected column does not store numeric values. If using paths, check the field separator characters and if file has headers.")}
  df_abundance[1,column_rank] <- as.numeric(df_abundance[1,column_rank]) #While the class "integer" passes the as.numeric() check, the 'gslnls' package cannot accept "integer" class data.
  temp_rank <- order(df_abundance[,column_rank],decreasing=T)
  temp_2_rank <- NULL
  for (i in 1:length(temp_rank)){temp_2_rank[temp_rank[i]]<-i}
  if (any(colnames(df_abundance)=="abundance")){colnames(df_abundance)[which(colnames(df_abundance)=="abundance")] <- "abundance_original"}
  ordered_frame <- cbind(temp_2_rank,df_abundance)
  colnames(ordered_frame)[1] <- "BC_rank"
  colnames(ordered_frame)[1+column_rank] <- "abundance"
  positive_rows <- which(ordered_frame[,1+column_rank]>rank_threshold)
  ordered_frame <- ordered_frame[positive_rows,]
  return(ordered_frame)
}
