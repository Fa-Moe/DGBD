library(DGBD)
Billionaires <- read.table("raw_file/Billionaires_Statistics_Dataset_Two_Columns.tsv",sep="\t",header=T)[,1:2]
BC_plot(df_abundance = Billionaires, column_plot = "finalWorth")
save(Billionaires, file="Billionaires.rda",compress = "xz")

Author_Citations <- as.data.frame(read.table("raw_file/CitationCount1120TopPhysiciste1981_1997_fix.txt",sep="\t",header=F))
colnames(Author_Citations) <- c("Name","Citations per article","Articles","Citations","Rank")
#BC_plot(df_abundance = Author_Citations, column_plot = "Citations per article")
save(Author_Citations, file="Author_Citations.rda",compress = "xz")

Weblinks <- read.table("raw_file/weblinks.hist",sep="\t",header=T)
BC_plot(df_abundance = Weblinks, column_plot = "frequency")
save(Weblinks, file="Weblinks.rda",compress = "xz")

Quakes <- read.table("raw_file/quakes.txt",sep="\t",header=F)
colnames(Quakes) <- "magnitude"
BC_plot(df_abundance = Quakes, column_plot = 1)
save(Quakes, file="Quakes.rda",compress = "xz")

MOMv3.3 <- read.table("raw_file/MOMv3.3.txt",sep="\t",header=F)
colnames(MOMv3.3) <- c("Continent","Status","Order","Family","Genus","Species","Log mass", "Combined mass","Reference")
head(MOMv3.3)
#BC_plot(df_abundance = MOMv3, column_plot = 8)
save(MOMv3.3, file="MOMv3.3.rda",compress = "xz")

Flares <- read.table("raw_file/flares.txt",sep="\t",header=F)
colnames(Flares) <- "intensity"
#BC_plot(df_abundance = Flares, column_plot = 1)
save(Flares, file="Flares.rda",compress = "xz")

EC_Metabolite <- read.table("raw_file/ecoli-degree.txt",sep="\t",header=T)
#BC_plot(df_abundance = Ecoli_deg, column_plot = "count")
save(EC_Metabolite, file="EC_Metabolite.rda",compress = "xz")

Citation_ISICatalogued <- read.table("raw_file/CitationDistributionISICataloguedPapers_fix.txt",sep="\t",header=T)
Citation_ISICatalogued <- Citation_ISICatalogued[,c(1,3)]
#BC_plot(df_abundance = Citation_ISICatalogued, column_plot = 2)
save(Citation_ISICatalogued,file="Citation_ISICatalogued.rda",compress = "xz")

Phy_Citation<- read.table("raw_file/CitationDistributionPhyRevD1975_1994_fix.txt",sep="\t",header=T)
Phy_Citation[,2]<- as.numeric(Phy_Citation[,2])
Phy_Citation[,3]<- as.numeric(Phy_Citation[,3])
colnames(Phy_Citation)<-c("Volume","page number","Number of citations")
#BC_plot(df_abundance = Phy_Citation, column_plot = 2)
save(Phy_Citation,file="Phy_Citation.rda",compress = "xz")

EC_Codon <- read.csv("../inst/extdata/EC_Codon.csv",header=TRUE,row.names=1)
save(EC_Codon,file="EC_Codon.rda",compress = "xz")
