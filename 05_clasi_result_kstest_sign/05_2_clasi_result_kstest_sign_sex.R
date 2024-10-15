args=(commandArgs(TRUE))

gen_ko <- args[1]

file_sign <-  paste("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/05_clasi_result_kstest/05_1_clasi_result_kstest_sign/kstest_pvadj_logfc_kovsctrl_sign_",gen_ko,".rds",sep="")

kstest_pvadj_logfc_kovsctrl_sign <- readRDS(file_sign) 

if (length(which(kstest_pvadj_logfc_kovsctrl_sign$sex == "male")) == 0){
	file <- paste("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/05_clasi_result_kstest/05_2_clasi_result_kstest_sign_only_female/kstest_pvadj_logfc_kovsctrl_sign_only_female_",gen_ko,".rds",sep="")
	saveRDS(kstest_pvadj_logfc_kovsctrl_sign, file)

} else if (length(which(kstest_pvadj_logfc_kovsctrl_sign$sex == "female")) == 0){
	file <- paste("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/05_clasi_result_kstest/05_2_clasi_result_kstest_sign_only_male/kstest_pvadj_logfc_kovsctrl_sign_only_male_",gen_ko,".rds",sep="")
	saveRDS(kstest_pvadj_logfc_kovsctrl_sign, file)

}else{
	file <- paste("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/05_clasi_result_kstest/05_2_clasi_result_kstest_sign_both_sex/kstest_pvadj_logfc_kovsctrl_sign_both_sex_",gen_ko,".rds",sep="")
	saveRDS(kstest_pvadj_logfc_kovsctrl_sign, file)

}


