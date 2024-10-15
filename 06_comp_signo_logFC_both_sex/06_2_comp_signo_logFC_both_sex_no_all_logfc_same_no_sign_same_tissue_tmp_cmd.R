#!/usr/bin/env Rscript

files_kstest_sign <- list.files("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/06_comp_signo_logFC_both_sex/06_1_comp_signo_logFC_both_sex_no_all_logfc_same_sign/")

genes <- gsub("kstest_pvadj_logfc_kovsctrl_sign_both_sex_no_all_logfc_same_sign_","",gsub(".rds","",files_kstest_sign))

for (i in 1:length(genes)){
	cat("Rscript /mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/code/06_comp_signo_logFC_both_sex/06_2_comp_signo_logFC_both_sex_no_all_logfc_same_no_sign_same_tissue.R ")
	cat(genes[i])
	cat("\n")
}


