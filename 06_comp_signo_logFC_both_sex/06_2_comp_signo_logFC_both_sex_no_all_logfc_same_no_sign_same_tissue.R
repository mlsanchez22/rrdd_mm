args=(commandArgs(TRUE))

gen_ko <- args[1]

library(dplyr)


file_kstest_pvadj_logfc_kovsctrl <- paste("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/06_comp_signo_logFC_both_sex/06_1_comp_signo_logFC_both_sex_no_all_logfc_same_sign/kstest_pvadj_logfc_kovsctrl_sign_both_sex_no_all_logfc_same_sign_",gen_ko,".rds",sep="")

kstest_pvadj_logfc_kovsctrl <- readRDS(file_kstest_pvadj_logfc_kovsctrl)

kstest_pvadj_logfc_kovsctrl_sign <- kstest_pvadj_logfc_kovsctrl[kstest_pvadj_logfc_kovsctrl$kspvadj < 0.05,]

kstest_pvadj_logfc_kovsctrl_sign$logFC_sig <- rep(".", length(kstest_pvadj_logfc_kovsctrl_sign$logFC))
kstest_pvadj_logfc_kovsctrl_sign$logFC_sig[kstest_pvadj_logfc_kovsctrl_sign$logFC > 0] <- "+"
kstest_pvadj_logfc_kovsctrl_sign$logFC_sig[kstest_pvadj_logfc_kovsctrl_sign$logFC < 0] <- "-"

if (length(as.data.frame(kstest_pvadj_logfc_kovsctrl_sign %>% filter(logFC_sig != ".") %>% group_by(circ, tissue, logFC_sig) %>% summarise(n=n()) %>% filter(n==1)  %>% group_by(circ, tissue) %>% summarise(n=n()) %>% filter(n!=1))$n) == 0){

	file <- paste("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/06_comp_signo_logFC_both_sex/06_2_comp_signo_logFC_both_sex_no_all_logfc_same_sign_same_tissue/kstest_pvadj_logfc_kovsctrl_sign_both_sex_no_all_logfc_same_sign_same_tissue_",gen_ko,".rds", sep="")
	saveRDS(kstest_pvadj_logfc_kovsctrl, file=file)
} else {

	file <- paste("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/06_comp_signo_logFC_both_sex/06_2_comp_signo_logFC_both_sex_no_all_logfc_same_sign_no_same_tissue/kstest_pvadj_logfc_kovsctrl_sign_both_sex_no_all_logfc_same_sign_no_same_tissue_",gen_ko,".rds", sep="")
	saveRDS(kstest_pvadj_logfc_kovsctrl, file=file)
}

