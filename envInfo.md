---
title: "envInfo.Rmd"
date: "6/14/2021"
output:
  html_document:
    keep_md: true
---


```r
# Gathering and loading all used packages

lf <- list.files(pattern="\\.Rmd$", recursive = TRUE, full.names = TRUE)
lf <- lf[!grepl("envInfo",lf)]
packages <- unique(unlist(lapply(lf, FUN=function(x){
  trimws(grep("library",readLines(x),value=TRUE))
})))
```

```
## Warning in readLines(x): incomplete final line found on './Figures/Supplement/
## Suppl_6/Suppl_5.Rmd'
```

```r
packages <- gsub(")","",gsub("library(","",packages,fixed=TRUE),fixed=TRUE)

suppressPackageStartupMessages({
  for(f in packages){
    library(f, character.only=TRUE)
  }
})
```

```
## reset: creating "thermo" object
```

```
## OBIGT: loading default database with 1880 aqueous, 3418 total species
```


```r
sessionInfo()
```

```
## R version 4.0.3 (2020-10-10)
## Platform: x86_64-pc-linux-gnu (64-bit)
## Running under: Ubuntu 18.04 LTS
## 
## Matrix products: default
## BLAS:   /usr/lib/x86_64-linux-gnu/openblas/libblas.so.3
## LAPACK: /usr/lib/x86_64-linux-gnu/libopenblasp-r0.2.20.so
## 
## locale:
##  [1] LC_CTYPE=C.UTF-8       LC_NUMERIC=C           LC_TIME=C.UTF-8       
##  [4] LC_COLLATE=C.UTF-8     LC_MONETARY=C.UTF-8    LC_MESSAGES=C.UTF-8   
##  [7] LC_PAPER=C.UTF-8       LC_NAME=C              LC_ADDRESS=C          
## [10] LC_TELEPHONE=C         LC_MEASUREMENT=C.UTF-8 LC_IDENTIFICATION=C   
## 
## attached base packages:
##  [1] grid      parallel  stats4    stats     graphics  grDevices utils    
##  [8] datasets  methods   base     
## 
## other attached packages:
##  [1] CHNOSZ_1.4.0                           
##  [2] openxlsx_4.2.3                         
##  [3] BSgenome.Hsapiens.UCSC.hg38_1.4.3      
##  [4] motifStack_1.34.0                      
##  [5] TxDb.Rnorvegicus.UCSC.rn6.refGene_3.4.6
##  [6] AnnotationHub_2.22.0                   
##  [7] BiocFileCache_1.14.0                   
##  [8] dbplyr_2.1.0                           
##  [9] org.Hs.eg.db_3.12.0                    
## [10] gtable_0.3.0                           
## [11] gridExtra_2.3                          
## [12] ggpmisc_0.3.9                          
## [13] scales_1.1.1                           
## [14] data.table_1.14.0                      
## [15] ensembldb_2.14.0                       
## [16] AnnotationFilter_1.14.0                
## [17] GenomicFeatures_1.42.2                 
## [18] AnnotationDbi_1.52.0                   
## [19] scanMiRApp_0.99.13                     
## [20] viridis_0.5.1                          
## [21] viridisLite_0.3.0                      
## [22] ggpointdensity_0.1.0                   
## [23] cowplot_1.1.1                          
## [24] ggrepel_0.9.1                          
## [25] Matrix_1.3-2                           
## [26] BSgenome.Mmusculus.UCSC.mm10_1.4.0     
## [27] scanMiR_0.99.24                        
## [28] BiocParallel_1.24.1                    
## [29] BSgenome.Hsapiens.UCSC.hg19_1.4.3      
## [30] BSgenome_1.58.0                        
## [31] Biostrings_2.58.0                      
## [32] XVector_0.30.0                         
## [33] rtracklayer_1.50.0                     
## [34] ggsci_2.9                              
## [35] scanMiRData_0.99.2                     
## [36] edgeR_3.32.1                           
## [37] limma_3.46.0                           
## [38] SummarizedExperiment_1.20.0            
## [39] Biobase_2.50.0                         
## [40] GenomicRanges_1.42.0                   
## [41] GenomeInfoDb_1.26.4                    
## [42] IRanges_2.24.1                         
## [43] S4Vectors_0.28.1                       
## [44] BiocGenerics_0.36.0                    
## [45] MatrixGenerics_1.2.1                   
## [46] matrixStats_0.58.0                     
## [47] forcats_0.5.1                          
## [48] stringr_1.4.0                          
## [49] dplyr_1.0.5                            
## [50] purrr_0.3.4                            
## [51] readr_1.4.0                            
## [52] tidyr_1.1.3                            
## [53] tibble_3.1.0                           
## [54] ggplot2_3.3.3                          
## [55] tidyverse_1.3.0                        
## 
## loaded via a namespace (and not attached):
##  [1] readxl_1.3.1                  backports_1.2.1              
##  [3] lazyeval_0.2.2                shinydashboard_0.7.1         
##  [5] digest_0.6.27                 htmltools_0.5.1.1            
##  [7] fansi_0.4.2                   magrittr_2.0.1               
##  [9] memoise_2.0.0                 modelr_0.1.8                 
## [11] askpass_1.1                   prettyunits_1.1.1            
## [13] colorspace_2.0-0              blob_1.2.1                   
## [15] rvest_1.0.0                   rappdirs_0.3.3               
## [17] haven_2.3.1                   xfun_0.22                    
## [19] crayon_1.4.1                  RCurl_1.98-1.3               
## [21] jsonlite_1.7.2                glue_1.4.2                   
## [23] zlibbioc_1.36.0               DelayedArray_0.16.2          
## [25] DBI_1.1.1                     Rcpp_1.0.6                   
## [27] xtable_1.8-4                  progress_1.2.2               
## [29] bit_4.0.4                     DT_0.17                      
## [31] htmlwidgets_1.5.3             httr_1.4.2                   
## [33] ellipsis_0.3.1                pkgconfig_2.0.3              
## [35] XML_3.99-0.6                  sass_0.3.1                   
## [37] locfit_1.5-9.4                utf8_1.2.1                   
## [39] tidyselect_1.1.0              rlang_0.4.10                 
## [41] later_1.1.0.1                 munsell_0.5.0                
## [43] BiocVersion_3.12.0            cellranger_1.1.0             
## [45] tools_4.0.3                   cachem_1.0.4                 
## [47] cli_2.3.1                     generics_0.1.0               
## [49] RSQLite_2.2.4                 ade4_1.7-16                  
## [51] rintrojs_0.2.2                broom_0.7.5                  
## [53] evaluate_0.14                 fastmap_1.1.0                
## [55] yaml_2.2.1                    knitr_1.31                   
## [57] bit64_4.0.5                   fs_1.5.0                     
## [59] shinycssloaders_1.0.0         zip_2.1.1                    
## [61] mime_0.10                     xml2_1.3.2                   
## [63] biomaRt_2.46.3                compiler_4.0.3               
## [65] rstudioapi_0.13               plotly_4.9.3                 
## [67] curl_4.3                      interactiveDisplayBase_1.28.0
## [69] waiter_0.2.1                  reprex_1.0.0                 
## [71] bslib_0.2.4                   stringi_1.5.3                
## [73] lattice_0.20-41               ProtGenerics_1.22.0          
## [75] vctrs_0.3.6                   pillar_1.5.1                 
## [77] lifecycle_1.0.0               BiocManager_1.30.10          
## [79] jquerylib_0.1.3               bitops_1.0-6                 
## [81] httpuv_1.5.5                  R6_2.5.0                     
## [83] promises_1.2.0.1              MASS_7.3-53.1                
## [85] assertthat_0.2.1              seqLogo_1.56.0               
## [87] openssl_1.4.3                 withr_2.4.1                  
## [89] GenomicAlignments_1.26.0      Rsamtools_2.6.0              
## [91] GenomeInfoDbData_1.2.4        hms_1.0.0                    
## [93] fst_0.9.4                     rmarkdown_2.7                
## [95] shiny_1.6.0                   lubridate_1.7.10
```

