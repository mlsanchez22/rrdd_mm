args=(commandArgs(TRUE))

gen_ko <- args[1]

file_kstest_pvadj_logfc_kovsctrl <- paste("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/05_clasi_result_kstest/05_2_clasi_result_kstest_sign_both_sex/kstest_pvadj_logfc_kovsctrl_sign_both_sex_",gen_ko,".rds",sep="")

logfc_kovsctrl <- readRDS(file_kstest_pvadj_logfc_kovsctrl)

ntotal_logfc <- length(as.numeric(na.omit(logfc_kovsctrl[logfc_kovsctrl$kspvadj < 0.05,"logFC"])))
ntotal_logfc_neg <- sum(as.numeric(na.omit(logfc_kovsctrl[logfc_kovsctrl$kspvadj < 0.05,"logFC"])) < 0.05)
ntotal_logfc_pos <- sum(as.numeric(na.omit(logfc_kovsctrl[logfc_kovsctrl$kspvadj > 0.05,"logFC"])) > 0.05)

if (ntotal_logfc_neg == ntotal_logfc | ntotal_logfc_pos == ntotal_logfc) {
	file <- paste("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/06_comp_signo_logFC_both_sex/06_1_comp_signo_logFC_both_sex_all_logfc_same_sign/kstest_pvadj_logfc_kovsctrl_sign_both_sex_all_logfc_same_sign_", gen_ko, ".rds", sep="")
	saveRDS(logfc_kovsctrl, file=file)
} else {
	file <- paste("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/06_comp_signo_logFC_both_sex/06_1_comp_signo_logFC_both_sex_no_all_logfc_same_sign/kstest_pvadj_logfc_kovsctrl_sign_both_sex_no_all_logfc_same_sign_", gen_ko, ".rds", sep="")
	saveRDS(logfc_kovsctrl, file=file)
}




