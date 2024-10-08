% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/BC_multiple.R
\name{BC_multiple}
\alias{BC_multiple}
\title{Create Plots and Reports for N Columns}
\usage{
BC_multiple(
  df_abundance,
  column = NULL,
  is_phyloseq = FALSE,
  supress_messages = TRUE,
  report_only = FALSE,
  file_output_mode = FALSE,
  called_from_many = NULL,
  ...
)
}
\arguments{
\item{df_abundance}{A data frame that contains abundance data.}

\item{column}{Optional. A vector that contains either column name strings or numeric column indices to be analyzed. By default includes all columns.}

\item{is_phyloseq}{Logical, optional. Use if the object to be analysed has the phyloseq class.}

\item{supress_messages}{Logical. Allows to skip messages that detail how many samples have been processed. Also stops the resulting data frame from being printed. Defaults to true.}

\item{report_only}{Logical. Use to output a data frame without the BC_plot object, intended to reduce the size of the output for large analyses. Defaults to false.}

\item{file_output_mode}{Logical. Whether to provide all analysis inside the R environment (when false) or to packet BC_report results into files (when true). Recommended when analyzing very large datasets.}

\item{called_from_many}{Automatically handled. An object name passed from BC_many.}

\item{...}{passes arguments to \code{BC_report} and \code{BC_plot}.}
}
\value{
A data frame where each row represents a fitted DGBD. The first column stores the BC_plot objects and the second column stores the BC_reports. Each object's output is stored inside of a list.
}
\description{
Basic wrapper for BC_plot and BC_report intended to be used for large data frames.
}
\examples{
BC_multiple(df_abundance=DGBD::MOMv3.3, column = c(7:8))

BC_multiple(df_abundance=DGBD::EC_Codon, model_extra="S",confint_col="#448666")
}
