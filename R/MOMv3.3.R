#' MOMv3.3.
#'
#' Average body mass of late quaternary mammals.
#'
#' @format ## `MOMv3.3`
#' Data frame that contains.
#' \describe{
#'   \item{Continent}{Continent that a species resides on. If species resides on more than one continent, a continent specific body mass is reported when available. Thus, some mammals have multiple entries. The division between North and South America occurs at the isthmus of Panama.}
#'   \item{Status}{Whether species is currently present in the wild (extant); extinct as of late Pleistocene (extinct), extinct within the last 300 years (historical); or an introduction (introduction); Note these do not necessarily follow CITES or IUCN categories.}
#'   \item{Order}{Taxonomic order of species}
#'   \item{Family}{Taxonomic family of species}
#'   \item{Genus}{Taxonomic genus of species}
#'   \item{Species}{Species epithet}
#'   \item{Log mass}{Log10 transformation of Combined Mass}
#'   \item{Combined mass}{Adult body mass averaged across males and females and geographic locations.}
#'   \item{Reference}{Reference source for body mass information and/or status for that species; the updated electronic version of Wilson and Reeder (1993). (6 June 2002; www.nmnh.si.edu/msw) serves as the status reference for all extant species.}
#'   ...
#' }
#'
#' @details " -999 is a missing value code.
#' 'The purpose of this data set was to compile body mass information
#' for all mammals on Earth so that we could investigate the patterns of body 
#' mass seen across geographic and taxonomic space and evolutionary time.' Quoted from: 
#' Smith, F. A., Lyons, S. K., Ernest, S. K. M., Jones, K. E., Kaufman, D. M., 
#' Dayan, T., Marquet, P. A., Brown, J. H., & Haskell, J. P. (2003). Body Mass 
#' of Late Quaternary Mammals. Ecology, 84(12), 3403–3403. https://doi.org/10.1890/02-9003
#' Metadata available:
#' Ecological Archives E084-093-metadata. (n.d.). Retrieved September 11, 2024, 
#' from https://esapubs.org/archive/ecol/E084/094/metadata.htm"
#'
#' @source <https://github.com/robertoalvarezm/DataNonPowerLaws>
"MOMv3.3"
