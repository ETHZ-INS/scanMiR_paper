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
## Suppl_6/Suppl_6.Rmd'
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
## OBIGT: loading default database with 1903 aqueous, 3443 total species
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
##  [1] CHNOSZ_1.4.1                           
##  [2] openxlsx_4.2.4                         
##  [3] BSgenome.Hsapiens.UCSC.hg38_1.4.3      
##  [4] motifStack_1.34.0                      
##  [5] ComplexHeatmap_2.6.2                   
##  [6] TxDb.Rnorvegicus.UCSC.rn6.refGene_3.4.6
##  [7] org.Hs.eg.db_3.12.0                    
##  [8] fst_0.9.4                              
##  [9] readxl_1.3.1                           
## [10] AnnotationHub_2.22.0                   
## [11] BiocFileCache_1.14.0                   
## [12] dbplyr_2.1.0                           
## [13] scanMiRApp_0.99.22                     
## [14] gtable_0.3.0                           
## [15] gridExtra_2.3                          
## [16] ggpmisc_0.3.9                          
## [17] scales_1.1.1                           
## [18] data.table_1.14.0                      
## [19] ensembldb_2.14.0                       
## [20] AnnotationFilter_1.14.0                
## [21] GenomicFeatures_1.42.2                 
## [22] AnnotationDbi_1.52.0                   
## [23] viridis_0.5.1                          
## [24] viridisLite_0.4.0                      
## [25] ggpointdensity_0.1.0                   
## [26] cowplot_1.1.1                          
## [27] ggrepel_0.9.1                          
## [28] Matrix_1.3-4                           
## [29] BSgenome.Mmusculus.UCSC.mm10_1.4.0     
## [30] scanMiR_0.99.26                        
## [31] BiocParallel_1.24.1                    
## [32] BSgenome.Hsapiens.UCSC.hg19_1.4.3      
## [33] BSgenome_1.58.0                        
## [34] Biostrings_2.58.0                      
## [35] XVector_0.30.0                         
## [36] rtracklayer_1.50.0                     
## [37] ggsci_2.9                              
## [38] scanMiRData_0.99.2                     
## [39] edgeR_3.32.1                           
## [40] limma_3.46.0                           
## [41] SummarizedExperiment_1.20.0            
## [42] Biobase_2.50.0                         
## [43] GenomicRanges_1.42.0                   
## [44] GenomeInfoDb_1.26.7                    
## [45] IRanges_2.24.1                         
## [46] S4Vectors_0.28.1                       
## [47] BiocGenerics_0.36.1                    
## [48] MatrixGenerics_1.2.1                   
## [49] matrixStats_0.60.0                     
## [50] forcats_0.5.1                          
## [51] stringr_1.4.0                          
## [52] dplyr_1.0.5                            
## [53] purrr_0.3.4                            
## [54] readr_1.4.0                            
## [55] tidyr_1.1.3                            
## [56] tibble_3.1.0                           
## [57] ggplot2_3.3.4                          
## [58] tidyverse_1.3.0                        
## 
## loaded via a namespace (and not attached):
##   [1] circlize_0.4.13               backports_1.2.1              
##   [3] lazyeval_0.2.2                shinydashboard_0.7.1         
##   [5] digest_0.6.27                 htmltools_0.5.1.1            
##   [7] fansi_0.5.0                   magrittr_2.0.1               
##   [9] memoise_2.0.0                 cluster_2.1.2                
##  [11] modelr_0.1.8                  askpass_1.1                  
##  [13] prettyunits_1.1.1             colorspace_2.0-2             
##  [15] blob_1.2.2                    rvest_1.0.0                  
##  [17] rappdirs_0.3.3                haven_2.3.1                  
##  [19] xfun_0.24                     crayon_1.4.1                 
##  [21] RCurl_1.98-1.3                jsonlite_1.7.2               
##  [23] glue_1.4.2                    zlibbioc_1.36.0              
##  [25] GetoptLong_1.0.5              DelayedArray_0.16.3          
##  [27] shape_1.4.6                   DBI_1.1.1                    
##  [29] Rcpp_1.0.7                    xtable_1.8-4                 
##  [31] progress_1.2.2                clue_0.3-59                  
##  [33] bit_4.0.4                     DT_0.18                      
##  [35] htmlwidgets_1.5.3             httr_1.4.2                   
##  [37] RColorBrewer_1.1-2            ellipsis_0.3.2               
##  [39] pkgconfig_2.0.3               XML_3.99-0.6                 
##  [41] sass_0.4.0                    ggseqlogo_0.1                
##  [43] locfit_1.5-9.4                utf8_1.2.2                   
##  [45] tidyselect_1.1.0              rlang_0.4.11                 
##  [47] later_1.2.0                   munsell_0.5.0                
##  [49] BiocVersion_3.12.0            cellranger_1.1.0             
##  [51] tools_4.0.3                   cachem_1.0.5                 
##  [53] cli_3.0.1                     generics_0.1.0               
##  [55] RSQLite_2.2.4                 ade4_1.7-17                  
##  [57] rintrojs_0.3.0                broom_0.7.5                  
##  [59] evaluate_0.14                 fastmap_1.1.0                
##  [61] yaml_2.2.1                    knitr_1.31                   
##  [63] bit64_4.0.5                   fs_1.5.0                     
##  [65] shinycssloaders_1.0.0         zip_2.2.0                    
##  [67] mime_0.11                     xml2_1.3.2                   
##  [69] biomaRt_2.46.3                compiler_4.0.3               
##  [71] rstudioapi_0.13               png_0.1-7                    
##  [73] plotly_4.9.3                  interactiveDisplayBase_1.28.0
##  [75] curl_4.3.2                    waiter_0.2.3                 
##  [77] reprex_1.0.0                  bslib_0.2.5.1                
##  [79] stringi_1.7.3                 lattice_0.20-44              
##  [81] ProtGenerics_1.22.0           vctrs_0.3.8                  
##  [83] pillar_1.5.1                  lifecycle_1.0.0              
##  [85] BiocManager_1.30.16           GlobalOptions_0.1.2          
##  [87] jquerylib_0.1.4               bitops_1.0-7                 
##  [89] httpuv_1.5.5                  R6_2.5.0                     
##  [91] promises_1.2.0.1              MASS_7.3-54                  
##  [93] assertthat_0.2.1              rjson_0.2.20                 
##  [95] openssl_1.4.4                 withr_2.4.2                  
##  [97] GenomicAlignments_1.26.0      Rsamtools_2.6.0              
##  [99] GenomeInfoDbData_1.2.4        hms_1.1.0                    
## [101] rmarkdown_2.7                 Cairo_1.5-12.2               
## [103] shiny_1.6.0                   lubridate_1.7.10
```

