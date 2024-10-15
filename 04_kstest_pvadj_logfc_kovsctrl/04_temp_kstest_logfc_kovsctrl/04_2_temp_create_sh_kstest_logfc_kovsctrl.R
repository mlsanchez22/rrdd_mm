#!/usr/bin/env Rscript
args=(commandArgs(TRUE))
x <- args[1]
y <- args[2]

x <- as.numeric(x)
y <- as.numeric(y)

genes_pert_rrdd_path_physi <- readRDS("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/02_genes_pert_rrdd_path_physi.rds")

for (i in x:y){
	cat("Rscript /mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/code/04_kstest_pvadj_logfc_kovsctrl/04_kstest_pvadj_logfc_kovsctrl.R ")
	cat(unique(genes_pert_rrdd_path_physi$genes)[i])
	cat("\n")
	}

