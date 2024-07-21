library(DGBD)
Billionaires <- read.table("raw_file/Billionaires_Statistics_Dataset_Two_Columns.tsv",sep="\t",header=T)[,1:2]
BC_plot(df_abundance = Billionaires, column_plot = "finalWorth")
save(Billionaires, file="Billionaires.rda",compress = "xz")

Citation_count <- as.data.frame(read.table("raw_file/CitationCount1120TopPhysiciste1981_1997_fix.txt",sep="\t",header=F))
colnames(Citation_count) <- c("Name","Citations per article","Articles","Citations","Rank")
BC_plot(df_abundance = Citation_count, column_plot = "Citations per article")
save(Citation_count, file="CitationCount1120TopPhysiciste1981_1997.rda",compress = "xz")

Weblinks <- read.table("raw_file/weblinks.hist",sep="\t",header=T)
BC_plot(df_abundance = Weblinks, column_plot = "frequency")
save(Weblinks, file="Weblinks.rda",compress = "xz")

Quakes <- read.table("raw_file/quakes.txt",sep="\t",header=F)
BC_plot(df_abundance = Quakes, column_plot = 1)
save(Quakes, file="Quakes.rda",compress = "xz")

MOMv3 <- read.table("raw_file/MOMv3.3.txt",sep="\t",header=F)
BC_plot(df_abundance = MOMv3, column_plot = 8)
save(MOMv3, file="MOMv3.rda",compress = "xz")

Flares <- read.table("raw_file/flares.txt",sep="\t",header=F)
BC_plot(df_abundance = Flares, column_plot = 1)
save(Flares, file="Flares.rda",compress = "xz")

Ecoli_deg <- read.table("raw_file/ecoli-degree.txt",sep="\t",header=T)
BC_plot(df_abundance = Ecoli_deg, column_plot = "count")
save(Ecoli_deg, file="Ecoli_deg.rda",compress = "xz")

Citation_ISICatalogued <- read.table("raw_file/CitationDistributionISICataloguedPapers_fix.txt",sep="\t",header=T)
Citation_ISICatalogued <- Citation_ISICatalogued[,c(1,3)]
BC_plot(df_abundance = Citation_ISICatalogued, column_plot = 2)
save(Citation_ISICatalogued,file="CitationDistributionISICataloguedPapers.rda",compress = "xz")

Phy_Citation<- read.table("raw_file/CitationDistributionPhyRevD1975_1994_fix.txt",sep="\t",header=T)
Phy_Citation[,2]<- as.numeric(Phy_Citation[,2])
Phy_Citation[,3]<- as.numeric(Phy_Citation[,3])
colnames(Phy_Citation)<-c("t_label","value1","value2")
BC_plot(df_abundance = Phy_Citation, column_plot = 2)
save(Phy_Citation,file="Phy_Citation.rda",compress = "xz")
