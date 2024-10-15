library(hipathia)
library(edgeR)

## get GTEXv8 rnaseq data. 

gtex_counts <- readRDS("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/01_annotation_donors_sex_age_tissue_subset_gene_expresion/01_subset_gtex_gene_expresion.rds")

## we delete gen who variation is 0
gtex_var <- apply(gtex_counts[,!(colnames(gtex_counts) ==  c("gene_id"))],1,var)
gtex_fvar0 <- gtex_counts[gtex_var != 0,] 

## we have to select the ens id without version, hipathia doesn't recognise them
gtex_hip <- gtex_fvar0[,!(colnames(gtex_fvar0) ==  c("gene_id"))]
rownames(gtex_hip) <- unlist(lapply(strsplit(gtex_fvar0$gene_id, ".", fixed = T), FUN=function(x) x[1])) 

## data normalization
y <- DGEList(counts=gtex_hip)
y <- calcNormFactors(y)
logcpm <- cpm(y, prior.count=3, log=TRUE)

## translate ens id to entrez id
trans_data <- translate_data(logcpm, "hsa")
exp_data <- normalize_data(trans_data)

## save normalized data with entrez id
saveRDS(exp_data, file="/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/03_mechanistic_models_ko/exp_data_ctrol.rds")

## load pathways for human specie
pathways <- load_pathways(species = "hsa") 

## celular function activity calculation == activation circuits values.
results <- hipathia(exp_data, pathways, decompose = FALSE, verbose=FALSE)

## save results with activation circuits values. 
path_vals <- get_paths_data(results, matrix = TRUE)

path_normalized <- normalize_paths(path_vals, pathways)

saveRDS(path_normalized, file="/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/03_mechanistic_models_ko/path_vals_ctrol.rds")

