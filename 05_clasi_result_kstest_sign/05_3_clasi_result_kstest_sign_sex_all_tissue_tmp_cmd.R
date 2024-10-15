#!/usr/bin/env Rscript

files_kstest_sign <- list.files("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/05_clasi_result_kstest/05_2_clasi_result_kstest_sign_both_sex/")

genes <- gsub("kstest_pvadj_logfc_kovsctrl_sign_both_sex_","",gsub(".rds","",files_kstest_sign))

for (i in 1:length(genes)){
	cat("Rscript /mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/code/05_clasi_result_kstest_sign/05_3_clasi_result_kstest_sign_sex_all_tissue.R ")
	cat(genes[i])
	cat("\n")
}

