args=(commandArgs(TRUE))

gen_ko <- args[1]

library(dplyr)

file_sign <-  paste("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/05_clasi_result_kstest/05_3_clasi_result_kstest_sign_both_sex_no_all_tissue/kstest_pvadj_logfc_kovsctrl_sign_both_sex_no_all_tissue_",gen_ko,".rds",sep="")

kstest_pvadj_logfc_kovsctrol_sign <- readRDS(file_sign) 

summ <- kstest_pvadj_logfc_kovsctrol_sign %>% group_by(circ,tissue)  %>% summarise(n=n())

if (sum(summ$n != 2) != 0){
	file <- paste("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/05_clasi_result_kstest/05_4_clasi_result_kstest_sign_both_sex_no_all_tissue_no_same/kstest_pvadj_logfc_kovsctrol_sign_both_sex_no_all_tissue_no_same_",gen_ko,".rds",sep="")
	saveRDS(kstest_pvadj_logfc_kovsctrol_sign,file=file)
}else{
	file <- paste("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/05_clasi_result_kstest/05_4_clasi_result_kstest_sign_both_sex_no_all_tissue_but_same/kstest_pvadj_logfc_kovsctrol_sign_both_sex_no_all_tissue_but_same_",gen_ko,".rds",sep="")
	saveRDS(kstest_pvadj_logfc_kovsctrol_sign,file=file)
}


