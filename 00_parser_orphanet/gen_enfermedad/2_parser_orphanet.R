name <- read.delim("/mnt/lustre/scratch/CBRA/projects/cov_rd/results/00_parser_orphanet/gen_enfermedad/list_name.txt",header = F)
symbol <- read.table("/mnt/lustre/scratch/CBRA/projects/cov_rd/results/00_parser_orphanet/gen_enfermedad/list_symbol.txt", sep="\t")
v_symbol <- as.vector(symbol)
name_enfermerdad_symbol <- cbind(name, symbol)

saveRDS(name_enfermerdad_symbol, file="/mnt/lustre/scratch/CBRA/projects/cov_rd/results/00_parser_orphanet/gen_enfermedad/name_enfermerdad_symbol.rds")

library(org.Hs.eg.db)

maps_ensembl <- AnnotationDbi::select(org.Hs.eg.db,keys=paste(name_enfermerdad_symbol[,2]),c("ENSEMBL"), keytype="SYMBOL")

symbol_ens_enf <- merge(maps_ensembl,name_enfermerdad_symbol, by.x=1, by.y=2, all.x=T)


saveRDS(symbol_ens_enf, file="/mnt/lustre/scratch/CBRA/projects/cov_rd/results/00_parser_orphanet/gen_enfermedad/symbol_ens_enf.rds")
saveRDS(symbol_ens_enf, file="/mnt/lustre/scratch/CBRA/projects/cov_rd/results/00_parser_orphanet/gen_enfermedad/genename_ens_raredisease.rds")




