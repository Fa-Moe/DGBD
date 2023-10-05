library(vegan)
help(radfit)

fit<-radfit(ceiling(c(rnorm(n=1000, mean = 5000, sd = 800))))
fit
radlattice(fit)
help(rnorm)

predict(fit)

BC_plot(t(t(predict(fit))),4)[[7]]
BC_param((t(t(predict(fit)[,1]))),1)


rm(BC_data)
predict(fit)[,5]
...

BC_multiple(datasets::iris,c(1:4))
BC_
Tara_Data

BC_plot(t(t(c(100,10,8,4,2,2,2,1,1,1,1,1,1,1,1,1))),1,obs_size=2,confidence_interval=0.3)[[7]]
BC_plot((t(t(predict(fit)[,1]))),1,confidence_interval=0.9999999999)[[7]]

help(esophagus)
t(head(analyses_metadata_df))
mul_analysis<-BC_fromphyloseq(analyses_ps)
sample_data(analyses_ps)
guardado1 <- BC_param(t(t(c(100,10,8,4,2,2,2,1,1,1,1,1,1,1,1,1))),1)
guardado2 <- BC_model(BC_param_object = guardado1)
guardado3 <- BC_plot(BC_model_object = guardado2)
guardado4 <- BC_report(BC_plot_object = guardado3)

test_object <- t(t(c(100,10,8,4,2,2,2,1,1,1,1,1,1,1,1,1)))
BC_multiple(test_object)
BC_param(test_object,1)
BC_model(test_object,1)
BC_plot(test_object,1)
BC_report(test_object,1)
colnames(test_object)
abundance_column<- NULL
!is.null(abundance_column)

species1 <- data.frame(abundance1=c(1,2,23,12,421,34,1,24,124))
species2 <- data.frame(abundance1=c(3,5,45,746,42,5,1243,1,24),
                       abundance2=c(2,7,36,136,22,1,1843,4,54))
species3 <- data.frame(abundance=c(12,42,23,22,12,1,4,2,3,4),
                   abundance2=c(8,45,14,13,64,32,75,43,25,2))
to_analyze <- c("species1","species2","species3")
columns_to_use <-list(1,c(1,2),2)
BC_many(to_analyze,columns_to_use)[4,1][[1]]
problemo[4,1][[1]][[1]]
BC_rank(species3,2)
exper<-data.frame(obj1,obj2,obj3)
colnames(exper) <- NULL

BC_multiple(exper)
BC_multiple(exper)
BC_plot(exper,plot_column = 1,show_plot=T)

save(analyses_ps,file="analyses_ps")

dir <- "D:/class"
class(dir)
is.character(dir)
help("read.csv")
read.table("test.csv",sep=",")

load("crosssecdata.RData")
length(datatax[which(datatax[,"sample_id"]=="SRS2822941"),])




nombres<-c("obj1","obj2","obj3")
nombrespath<-c("test1.csv","test2.csv","test3.csv")
nombre_con_titulos <- "data-raw/SRS014890_vs_KEGG_v54_04b-mpm-cop-nul-nve-nul-nve.txt"
columnaspath<- list(c(2),c(2),c(2))
Tara_Data2<- Tara_Data
names_taras <- c("Tara_Data","Tara_Data2")
BC_many(nombres)
BC_many(names_taras,is_phylo_class = T)
BC_many(nombrespath,use_paths = T,columns_many_select=columnaspath)
BC_multiple(nombrespath[1],2)
BC_report(nombrespath[1],2)
BC_plot(nombrespath[1],2)
BC_report(nombrespath[1],2,obs_col="black")
BC_many(nombrespath,use_paths = T,columns_many_select = columnaspath,confidence_interval=0.99999999)
BC_many(nombre_con_titulos,columns_many_select=list(2),use_paths = T,header=T,sep="\t")



df_abundance <- species3
column_rank <- 2
df_abundance <-BC_file_format_handler(df_abundance)
if (!is.numeric(column_rank)){
  column_rank<-which(match(names(df_abundance),column_rank)==1)
}
if (!is.numeric(df_abundance[1,column_rank])){stop("The selected column does not store numeric values. If using paths, check the field separator characters and if file has headers.")}
if (colnames(df_abundance)[column_rank]=="abundance"){colnames(df_abundance)[column_rank] <- "abundance_original"}
temp_rank <- order(df_abundance[,column_rank],decreasing=T)
temp_2_rank <- NULL
for (i in 1:length(temp_rank)){temp_2_rank[temp_rank[i]]<-i}
ordered_frame <- cbind(temp_2_rank,df_abundance)
colnames(ordered_frame)[1] <- "BC_rank"
colnames(ordered_frame)[1+column_rank] <- "abundance"
positive_rows <- which(ordered_frame[,1+column_rank]>0)
ordered_frame <- ordered_frame[positive_rows,]
return(ordered_frame)

rm(list=ls())



BC_rank(species3,column_rank=2)

df_abundance <- species3
if (any(colnames(df_abundance)=="abundance")){colnames(df_abundance)[which(colnames(df_abundance)=="abundance")] <- "abundance_original"}

library(gitcreds)
help(gitcreds_set)

usethis::use_github(
  organisation = NULL,
  private = FALSE,
  protocol = "https",
  host = NULL
)
