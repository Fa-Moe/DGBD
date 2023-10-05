generate_rank <- function(df_abundance,column){
  if (!is.numeric(column)){column<-which(match(names(df_abundance),column)==1)}
  colnames(df_abundance)[column] <- "abundance"
  temp_rank <- order(df_abundance[,column],decreasing=T)
  temp_2_rank <- NULL
  for (i in 1:length(temp_rank)){temp_2_rank[temp_rank[i]]<-i}
  ordered_frame <- cbind(temp_2_rank,df_abundance)
  colnames(ordered_frame)[1] <- "radBC_rank"
  return(ordered_frame)
}
