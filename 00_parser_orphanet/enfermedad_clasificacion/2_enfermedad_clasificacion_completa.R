
enfermedad_clasificacion <- readRDS("/mnt/lustre/scratch/CBRA/projects/cov_rd/results/00_parser_orphanet/enfermedad_clasificacion/enfermedad_clasificacion.rds")
gen_enfermedad <- readRDS("/mnt/lustre/scratch/CBRA/projects/cov_rd/results/00_parser_orphanet/gen_enfermedad/name_enfermerdad_symbol.rds")

length(intersect(gen_enfermedad[,1], enfermedad_clasificacion[,1]))
length(gen_enfermedad[,1])
length(enfermedad_clasificacion[,1])

dis_non_rare_in_europe <- paste(gen_enfermedad[grep("NON RARE IN EUROPE: ",gen_enfermedad[,1]),2])
non_rare_in_europe <- rep("non_rare_in_europe", length(dis_non_rare_in_europe))
enfermedad_clasificacion_2 <- data.frame(enfermedad = c(paste(enfermedad_clasificacion[,1]),dis_non_rare_in_europe), clasificacion = c(paste(enfermedad_clasificacion[,2]), non_rare_in_europe))


x <- c("Rare bone disease","others","Rare neurologic disease","Rare bone disease","Rare neurologic disease","Rare neurologic disease","Rare endocrine disease",
       "Rare developmental defect during embryogenesis","Rare bone disease","Rare neoplastic disease","Rare skin disease",
       "Rare systemic or rheumatologic disease","Rare ophthalmic disorder","others","Rare neoplastic disease",
       "Rare bone disease","Rare neurologic disease","Rare developmental defect during embryogenesis",
       "Rare developmental defect during embryogenesis","Rare developmental defect during embryogenesis",
       "Rare developmental defect during embryogenesis","Rare skin disease","Rare systemic or rheumatologic disease",
       "others","others","Rare inborn errors of metabolism","Rare developmental defect during embryogenesis",
       "others","Rare bone disease","Rare developmental defect during embryogenesis","Rare neoplastic disease",
       "Rare neoplastic disease","others","others","others","others","others","others","Rare neurologic disease",
       "Rare developmental defect during embryogenesis","Rare bone disease","others","others","Rare skin disease",
       "others","Rare systemic or rheumatologic disease","Rare endocrine disease","Rare hematologic disease",
       "Rare developmental defect during embryogenesis","others","Rare neurologic disease","others","others","others",
       "Rare ophthalmic disorder","others","others","others","others")

enfermedad_clasificacion_3 <- data.frame(enfermedad = setdiff(gen_enfermedad[,1], enfermedad_clasificacion_2[,1]), clasificacion = x)
gen_enfermedad[,1]
enfermedad_clasificacion_all <- rbind(enfermedad_clasificacion,enfermedad_clasificacion_2)
enfermedad_clasificacion_all <- rbind(enfermedad_clasificacion_all, enfermedad_clasificacion_3)

saveRDS(enfermedad_clasificacion_all, file="/mnt/lustre/scratch/CBRA/projects/cov_rd/results/00_parser_orphanet/enfermedad_clasificacion/enfermedad_clasificacion_all.rds")


