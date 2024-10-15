args=(commandArgs(TRUE))

gen_ko <- args[1]


file_sign <-  paste("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/05_clasi_result_kstest/05_2_clasi_result_kstest_sign_both_sex/kstest_pvadj_logfc_kovsctrl_sign_both_sex_",gen_ko,".rds",sep="")

kstest_pvadj_logfc_kovsctrl_sign <- readRDS(file_sign) 

annotation_donors_sex_age_tissue <- readRDS("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/01_annotation_donors_sex_age_tissue_subset_gene_expresion/01_annotation_donors_sex_age_tissue.rds")

tissues_female <- unique(annotation_donors_sex_age_tissue[which(annotation_donors_sex_age_tissue$sex == "female"),"tissue"])
tissues_male <- unique(annotation_donors_sex_age_tissue[which(annotation_donors_sex_age_tissue$sex == "male"),"tissue"])

tissues <- setdiff(intersect(tissues_female, tissues_male), "Kidney")

n_circ <- length(unique(kstest_pvadj_logfc_kovsctrl_sign$circ))
n_tissue <- length(unique(tissues))
n_female_circ_tissue <- length(which(kstest_pvadj_logfc_kovsctrl_sign$sex == "female"))
n_male_circ_tissue <- length(which(kstest_pvadj_logfc_kovsctrl_sign$sex == "male"))


if (n_female_circ_tissue/n_circ == n_tissue & n_male_circ_tissue/n_circ == n_tissue){
	file <- paste("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/05_clasi_result_kstest/05_3_clasi_result_kstest_sign_both_sex_all_tissue/kstest_pvadj_logfc_kovsctrl_sign_both_sex_all_tissue_",gen_ko,".rds",sep="")
	saveRDS(kstest_pvadj_logfc_kovsctrl_sign, file)
}else if (n_female_circ_tissue/n_circ == n_tissue ){
	file <- paste("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/05_clasi_result_kstest/05_3_clasi_result_kstest_sign_only_female_all_tissue/kstest_pvadj_logfc_kovsctrl_sign_only_female_all_tissue_",gen_ko,".rds",sep="")
	saveRDS(kstest_pvadj_logfc_kovsctrl_sign, file)

}else if (n_male_circ_tissue/n_circ == n_tissue ){
	file <- paste("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/05_clasi_result_kstest/05_3_clasi_result_kstest_sign_only_male_all_tissue/kstest_pvadj_logfc_kovsctrl_sign_only_male_all_tissue_",gen_ko,".rds",sep="")
	saveRDS(kstest_pvadj_logfc_kovsctrl_sign, file)
} else{
	file <- paste("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/05_clasi_result_kstest/05_3_clasi_result_kstest_sign_both_sex_no_all_tissue/kstest_pvadj_logfc_kovsctrl_sign_both_sex_no_all_tissue_",gen_ko,".rds",sep="")
	saveRDS(kstest_pvadj_logfc_kovsctrl_sign, file)

}
