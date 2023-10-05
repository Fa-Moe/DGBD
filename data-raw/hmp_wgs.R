## code to prepare `hmp_wgs` dataset goes here

hmp_wgs<-read.table("data-raw/SRS014890_vs_KEGG_v54_04b-mpm-cop-nul-nve-nul-nve.txt",header=T)

usethis::use_data(hmp_wgs, overwrite = TRUE)
