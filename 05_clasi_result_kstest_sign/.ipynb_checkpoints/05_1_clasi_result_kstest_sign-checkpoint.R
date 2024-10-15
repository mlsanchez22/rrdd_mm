args=(commandArgs(TRUE))

gen_ko <- args[1]

file_kstest_pvadj_logfc_kovsctrl <- paste("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/04_kstest_pvadj_logfc_kovsctrl/kstest_pvadj_logfc_kovsctrl_",gen_ko,".rds",sep="")

kstest_pvadj_logfc_kovsctrl <- readRDS(file_kstest_pvadj_logfc_kovsctrl)

kstest_pvadj_logfc_kovsctrl_sign <- kstest_pvadj_logfc_kovsctrl[kstest_pvadj_logfc_kovsctrl$kspvadj < 0.05,]


if (length(kstest_pvadj_logfc_kovsctrl_sign$kspvadj) == 0){
	file <- paste("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/05_clasi_result_kstest/05_1_clasi_result_kstest_no_sign/kstest_pvadj_logfc_kovsctrl_no_sign_",gen_ko,".rds",sep="") 
	saveRDS(kstest_pvadj_logfc_kovsctrl_sign, file)

} else {
	file <- paste("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/05_clasi_result_kstest/05_1_clasi_result_kstest_sign/kstest_pvadj_logfc_kovsctrl_sign_",gen_ko,".rds",sep="") 
	saveRDS(kstest_pvadj_logfc_kovsctrl_sign, file)
}

