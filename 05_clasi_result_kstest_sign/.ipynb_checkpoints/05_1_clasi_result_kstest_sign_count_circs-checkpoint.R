files_kstest_pv_adj_ko_vs_ctrol_sign <- list.files("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/05_clasi_result_kstest/05_1_clasi_result_kstest_sign/")

circ_sign <- function(file){
	
	file_sign <- paste("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/05_clasi_result_kstest/05_1_clasi_result_kstest_sign/",file,sep="")
	
	kstest_pv_adj_ko_vs_ctrol_sign <- readRDS(file_sign)

	return(unique(kstest_pv_adj_ko_vs_ctrol_sign$circ))	
}

circ_sign_2_sex <- unique(unlist(sapply(files_kstest_pv_adj_ko_vs_ctrol_sign, FUN=function(x) circ_sign(x))))

