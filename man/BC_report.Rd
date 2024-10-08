% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/BC_report.R
\name{BC_report}
\alias{BC_report}
\title{Summarize the Modeled DGB Distribution}
\usage{
BC_report(
  df_abundance = NULL,
  column = NULL,
  BC_plot_object = NULL,
  show_plot = TRUE,
  show_stats = TRUE,
  ...
)
}
\arguments{
\item{df_abundance}{A data frame that contains abundance data.}

\item{column}{Either a string with the name of the column or the number of the column that stores the abundances in the data frame.}

\item{BC_plot_object}{A previous object generated by \code{BC_plot}.}

\item{show_plot}{Logical. Whether to plot the DGB distribution. Defaults to true.}

\item{show_stats}{Logical. Whether to print the parameters of the DGB distribution and its model_extra to the console. Defaults to true.}

\item{...}{passes arguments to \code{BC_plot}.}
}
\value{
A list with the following elements: a matrix that contains the parameters used and their confidence intervals, the model_extra vector and the DGBD plot.
}
\description{
Summarize the Modeled DGB Distribution
}
\examples{
BC_report(EC_Metabolite,2)

BC_report(df_abundance=DGBD::MOMv3.3, column=7, show_stats=FALSE)

BC_report(Tara_Data,2,is_phyloseq=TRUE)

EC_codon_dir <- system.file("extdata", "EC_Codon.csv", package = "DGBD")
EC_codon <- read.csv(EC_codon_dir,header=TRUE,row.names=1)
BC_report(EC_codon, column=1)
}
