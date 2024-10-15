args=(commandArgs(TRUE))

gen_ko <- args[1]

library(gtools)
library(reshape2)

function_calc_ks_pvadj_logFC <- function(gen_ko, tissue, sex){

## we know with samples belong to each tissue and sex
	annotation_donors_sex_age_tissue <- readRDS("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/01_annotation_donors_sex_age_tissue_subset_gene_expresion/01_annotation_donors_sex_age_tissue.rds")


## we know with that belong to cicuits are in hipathia
	genes_pert_rrdd_path_fisio <- readRDS("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/02_genes_pert_rrdd_path_physi.rds")

## circuit activation of ko
	path_vals_ko <- paste('/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/03_mechanistic_models_ko/path_vals_',gen_ko,'.rds', sep='')

	path_vals_ko <- readRDS(path_vals_ko)

## circuit activation of control
	path_vals_control <- readRDS("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/03_mechanistic_models_ko/path_vals_ctrol.rds")

## samples with sex and tissue
	samples <- annotation_donors_sex_age_tissue[intersect(which(annotation_donors_sex_age_tissue$tissue == tissue),which(annotation_donors_sex_age_tissue$sex == sex)),"patients"]

## circuits that belong gene
	circ_belong_gene <- genes_pert_rrdd_path_fisio[which(genes_pert_rrdd_path_fisio$genes == gen_ko),"circs"]

## we apply ks.test and get the p.value
	ks_p.value <- lapply(1:length(circ_belong_gene), FUN=function(k) ks.test(path_vals_ko[circ_belong_gene[k],samples], path_vals_control[circ_belong_gene[k],samples])$p.value)
## we adjust pvalue by FDR	
	ks_p.adjust <- p.adjust(ks_p.value, method="fdr", n=length(ks_p.value))
	
	fc <- unlist(lapply(1:length(circ_belong_gene), FUN=function(k) mean(foldchange2logratio(foldchange(path_vals_ko[circ_belong_gene[k],samples], path_vals_control[circ_belong_gene[k],samples]), base=2))))
	df <- data.frame("kspvadj"=ks_p.adjust,"logFC"=fc, "ko"=rep(gen_ko, length(circ_belong_gene)), "circ"=circ_belong_gene, "sex"=rep(sex, length(circ_belong_gene)),"tissue"=rep(tissue, length(tissue)))
	return(df)

}

annotation_donors_sex_age_tissue <- readRDS("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/01_annotation_donors_sex_age_tissue_subset_gene_expresion/01_annotation_donors_sex_age_tissue.rds")

genes_pert_rrdd_path_fisio <- readRDS("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/02_genes_pert_rrdd_path_physi.rds")

tissues_female <- unique(annotation_donors_sex_age_tissue[which(annotation_donors_sex_age_tissue$sex == "female"),"tissue"])
tissues_male <- unique(annotation_donors_sex_age_tissue[which(annotation_donors_sex_age_tissue$sex == "male"),"tissue"])

tissues <- setdiff(intersect(tissues_female, tissues_male), "Kidney")

results_female <- do.call(rbind,lapply(tissues, FUN=function(tissue) function_calc_ks_pvadj_logFC(gen_ko, tissue, "female")))
results_male <- do.call(rbind,lapply(tissues, FUN=function(tissue) function_calc_ks_pvadj_logFC(gen_ko, tissue, "male")))

results <- rbind(results_female, results_male)

file_save <- paste("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/04_kstest_pvadj_logfc_kovsctrl/kstest_pvadj_logfc_kovsctrl_",gen_ko,".rds", sep="")
saveRDS(results, file= file_save)


