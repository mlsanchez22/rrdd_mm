#!/usr/bin/env Rscript

genes_pert_rrdd_path_physi <- readRDS("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/02_genes_pert_rrdd_path_physi.rds")

genes <- unique(genes_pert_rrdd_path_physi$genes)

for (i in 1:length(genes)){
	cat("Rscript /mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/code/05_clasi_result_kstest_sign/05_1_clasi_result_kstest_sign.R ")
	cat(genes[i])
	cat("\n")
}

