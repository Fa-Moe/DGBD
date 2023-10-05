BC_file_format_handler <- function(df_abundance,is_phyloseq=FALSE,separator=",",...){
  if (is.character(df_abundance)){
    if (is_phyloseq){df_abundance<-load(df_abundance)}
    else {df_abundance<-R.utils::doCall(utils::read.table,args=list(file=df_abundance,sep=separator,...), .ignoreUnusedArgs=TRUE)}
  }
  if (is_phyloseq){df_abundance<-as.data.frame(phyloseq::otu_table(df_abundance))}
  return(df_abundance)
}
