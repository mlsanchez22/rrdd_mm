#!/usr/bin/env Rscript

files_kstest_sign <- list.files("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/05_clasi_result_kstest/05_1_clasi_result_kstest_sign/")

genes <- gsub("kstest_pvadj_logfc_kovsctrl_sign_","",gsub(".rds","",files_kstest_sign))

for (i in 1:length(genes)){
	cat("Rscript /mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/code/06_comp_signo_logFC_both_sex/06_1_comp_signo_logFC_both_sex_no_all_logfc_same_sign.R ")
	cat(genes[i])
	cat("\n")
}

