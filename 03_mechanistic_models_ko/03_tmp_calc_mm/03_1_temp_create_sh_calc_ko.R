#!/usr/bin/env Rscript

for (i in seq(1, 579, by=10)){
	cat("Rscript 03_2_temp_create_sh_calc_ko.R ")
	cat(i)
	cat(" ")
	cat(i + 9)
	cat(" > /mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/code/03_mechanistic_models_ko/03_tmp_calc_mm/03_temp_calc_ko_")
	cat(i)
	cat("_")
	cat(i + 9)
	cat(".sh")
	cat("\n")
}

