suppressPackageStartupMessages({
  library(scanMiR)
  library(scanMiRData)
  library(rtracklayer)
  library(GenomicRanges)
  library(BSgenome.Mmusculus.UCSC.mm10)
  library(BiocParallel)
})

seqs <- readRDS("mcircSeqs_processed.rds")

mods <- getKdModels("mmu", c("Conserved across mammals","Conserved across vertebrates","Poorly conserved"))
m <- findSeedMatches(seqs, mods, onlyCanonical=TRUE, BP=MulticoreParam(12,progressbar = TRUE),verbose=TRUE,
                     useTmpFiles=FALSE, keepTmpFiles=FALSE)

saveRDS(m, file="canonical.GR.rds")