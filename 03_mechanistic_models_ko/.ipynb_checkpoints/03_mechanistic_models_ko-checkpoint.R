#!/usr/bin/env Rscript
args=(commandArgs(TRUE))
x <- args[1]


library(hipathia)
	
exp_data <- readRDS("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/03_mechanistic_models_ko/exp_data_ctrol.rds")
exp_data[x,] <- exp_data[x,]*0.01	

pathways <- load_pathways("hsa")
results <- hipathia(exp_data, pathways, decompose = FALSE, verbose=FALSE)

path_vals <- get_paths_data(results, matrix = TRUE)

path_normalized <- normalize_paths(path_vals, pathways)
	
file_name <- paste("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/03_mechanistic_models_ko/path_vals_", x, ".rds",sep="")
	
saveRDS(path_normalized, file=file_name)
