## code to prepare `Tara_Data` dataset goes here

library(vegan)
library(ggplot2)
library(phyloseq)
library(MGnifyR)
mgnify_study_accession <- "MGYS00001918"
mg <- mgnify_client(usecache = T, cache_dir = '/')
analyses_accessions <- mgnify_analyses_from_studies(mg, mgnify_study_accession)
analyses_accessions
analyses_metadata_df <- mgnify_get_analyses_metadata(mg, head(analyses_accessions, 3));
analyses_ps <- mgnify_get_analyses_phyloseq(mg, analyses_metadata_df$analysis_accession, tax_SU = "SSU")
Tara_Data <- analyses_ps

usethis::use_data(Tara_Data, overwrite = TRUE)
