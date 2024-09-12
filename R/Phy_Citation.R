#' Phy_Citation.
#'
#' The degree distribution of links between pages in a network built from a 1997 web crawl.
#'
#' @format ## `Phy_Citation`
#' Data frame that contains.
#' \describe{
#'   \item{Volume}{Physical Review D Volume}
#'   \item{page number}{Physical Review D page number being referenced.}
#'   \item{Number of citations}{How many articles were cited in the given page}
#'   ...
#' }
#'
#' @details " 'This data covers all citations from the SPIRES High-Energy 
#' Physics Database at SLAC as of June 1997 and was compiled by Dr. H. Galic. 
#' ... The total number of articles in this list is 24,296.
#' Warning and Disclaimer (May 19, 1998)
#' I just discovered that there is inaccurary in this data which stems from
#' authors giving incorrect page numbers for citations. This leads, for example,
#' to citations to 524 separate articles in volume 13 while there are, in fact,
#' only 426 articles in this volume! This gives an idea of the number of articles
#' in the following list that are actually non-existent. SPIRES has been informed
#' of this disparity. Use this data with caution!' Quoted From:
#' Physical Review D Citation Data 1975-1994. (n.d.). Retrieved September 11, 2024,
#' from https://physics.bu.edu/~redner/projects/citation/prd.html 
#' The corrected 2003 data is not available at this moment."
#'
#' @source <https://github.com/robertoalvarezm/DataNonPowerLaws>
"Phy_Citation"