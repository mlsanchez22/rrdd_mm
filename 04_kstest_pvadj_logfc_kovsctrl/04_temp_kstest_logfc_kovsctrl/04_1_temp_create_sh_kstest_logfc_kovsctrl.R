#!/usr/bin/env Rscript

for (i in seq(1, 579, by=10)){
	cat("Rscript 04_2_temp_create_sh_kstest_logfc_kovsctrl.R ")
	cat(i)
	cat(" ")
	cat(i + 9)
	cat(" > /mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/code/04_kstest_pvadj_logfc_kovsctrl/04_temp_kstest_logfc_kovsctrl/04_temp_kstest_logfc_kovsctrl_")
	cat(i)
	cat("_")
	cat(i + 9)
	cat(".sh")
	cat("\n")
}
