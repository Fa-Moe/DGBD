
<!-- README.md is generated from README.Rmd. Please edit that file -->

# DGBD

<!-- badges: start -->
<!-- badges: end -->


Discrete Generalized Beta Distributions (DGBDs) provide a robust alternative for modeling Rank-Abundance Distributions. Traditional power-law distributions often offer accuracy within an intermediate range but struggle to capture the logarithmic behavior at the distribution's tail ends. While additional parameters can sometimes enhance power-law models, DGBDs inherently offer a superior fit for these critical tail regions.

Beyond their applicability to Rank-Abundance Distributions, DGBDs are effective in modeling ordering distributions across a wide array of biological systems and disciplines. This versatility makes them an invaluable tool for researchers in fields such as ecology, demography, bibliometrics, and more. For an in-depth exploration of DGBDs, please refer to Martínez-Mekler et al. (2009) at <https://doi.org/10.1371/journal.pone.0004791>.

DGBDs are characterized by three parameters: **A**, **a**, and **b**. This R' package facilitates fitting a DGBD to a given set of abundance data and reporting these parameters. It utilizes 'ggplot2' for visualizing the model.


## Installation

Install the development version of DGBD like so:

``` r
devtools::install_github("Fa-Moe/DGBD")
```

## Usage

Quickly analyze phyloseq-class objects and data frames.

``` r
library(DGBD)
Tara_Data
#> Loading required package: phyloseq
#> phyloseq-class experiment-level object
#> otu_table()   OTU Table:         [ 1701 taxa and 3 samples ]
#> sample_data() Sample Data:       [ 3 samples by 61 sample variables ]
#> tax_table()   Taxonomy Table:    [ 1701 taxa by 7 taxonomic ranks ]
Tara_DGBD <- BC_multiple(Tara_Data,is_phyloseq=TRUE,columns_select_multiple = c(1,2),plot_silent=T)
#> [1] "The data fit the DGB distribution with parameters:"
#>               A        a          b
#> 2.5 %  497.6530 1.147561 -0.1920345
#> 50 %   656.5237 1.114573 -0.1590458
#> 97.5 % 866.1122 1.081584 -0.1260571
#> [1] "And the fit has an R2 of:"
#> [1] 0.879234
```

<img src="man/figures/README-example-1.png" width="100%" />

    #> [1] "The data fit the DGB distribution with parameters:"
    #>               A        a            b
    #> 2.5 %  4327.562 1.288704 -0.024775637
    #> 50 %   5419.046 1.267957 -0.004028272
    #> 97.5 % 6785.821 1.247210  0.016719093
    #> [1] "And the fit has an R2 of:"
    #> [1] 0.6286568

<img src="man/figures/README-example-2.png" width="100%" />

``` r
Tara_DGBD <- BC_multiple(Tara_Data,is_phyloseq=TRUE,columns_select_multiple = c(3),plot_silent=T)
#> [1] "The data fit the DGB distribution with parameters:"
#>               A        a            b
#> 2.5 %  4555.386 1.285761 -0.016784526
#> 50 %   5588.316 1.267041  0.001935635
#> 97.5 % 6855.463 1.248321  0.020655796
#> [1] "And the fit has an R2 of:"
#> [1] 0.7930081
```

<img src="man/figures/README-example-3.png" width="100%" />

Generally, the nls method is better at fitting the values on the left of
the graph while performing worse on the right side. Yet,
the R2 tends to stay the same or increase when using the nls method.

``` r
Tara_DGBD <- BC_multiple(Tara_Data,is_phyloseq=TRUE,columns_select_multiple = c(3),plot_silent=T,nls=TRUE)
#> [1] "The data fit the DGB distribution with parameters:"
#>               A         a         b
#> 2.5 %  10.97475 0.7556983 0.3038271
#> 50 %   45.39142 0.7620199 0.4121401
#> 97.5 % 79.80809 0.7683415 0.5204532
#> [1] "And the fit has an R2 of:"
#> [1] 0.9867148
```

<img src="man/figures/README-example2-1.png" width="100%" />

``` r
BC_report(hmp_wgs,2) 
#> [1] "The data fit the DGB distribution with parameters:"
#>                   A          a        b
#> 2.5 %  4.591541e-11 -0.4345076 5.086016
#> 50 %   2.018236e-10 -0.6208510 5.272359
#> 97.5 % 8.871265e-10 -0.8071944 5.458703
#> [1] "And the fit has an R2 of:"
#> [1] 0.8341139
```

<img src="man/figures/README-example2-2.png" width="100%" />
