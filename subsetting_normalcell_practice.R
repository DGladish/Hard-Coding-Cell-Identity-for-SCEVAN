#!/usr/bin/env Rscript
# read in the data
pb2_csvPath <- "/home/dgladish/projects/rrg-tperkins/dgladish/Projects/MSc/Brand_Perkins/T-ALL_Clonal/CITE-seq/data/PB2_rna_CITE.csv"
th1_csvPath <- "/home/dgladish/projects/rrg-tperkins/dgladish/Projects/MSc/Brand_Perkins/T-ALL_Clonal/CITE-seq/data/TH1_rna_CITE.csv"
th2_csvPath <- "/home/dgladish/projects/rrg-tperkins/dgladish/Projects/MSc/Brand_Perkins/T-ALL_Clonal/CITE-seq/data/TH2_rna_CITE.csv"

bm4_raw <- read.csv(bm4_csvPath)
rownames_bm4 <- bm4_raw$X
rownames(bm4_raw) <- rownames_bm4
bm4_raw$X <- NULL

th1_raw <- read.csv(th1_csvPath)
rownames_th1 <- th1_raw$X
rownames(th1_raw) <- rownames_th1
th1_raw$X <- NULL

th2_raw <- read.csv(th2_csvPath)
rownames_th2 <- th2_raw$X
rownames(th2_raw) <- rownames_th2
th2_raw$X <- NULL

# add sample-specific suffixes
colnames(bm4_raw) <- paste0(colnames(bm4_raw), "-BM4")
colnames(th1_raw) <- paste0(colnames(th1_raw), "-TH1")
colnames(th2_raw) <- paste0(colnames(th2_raw), "-TH2")

# merge the TH1 and TH2 matrices
merged_norm <- merge(th1_raw, th2_raw, by="row.names", all=TRUE)
rownames(merged_df) <- merged_df$Row.names
merged_df$Row.names <- NULL

# subset the normal cell data frame
set.seed(123)

norm_names <- colnames(merged_norm)
sampled_norm_names <- sample(norm_names, )

merged_norm_subset <- subset(merged_norm, select = sampled_norm_names, drop = FALSE)


