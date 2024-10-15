library(hipathia)
library(AnnotationDbi)
library(org.Hs.eg.db)

## dataframe for each gene belong to pathway.

pathways <- load_pathways("hsa")
names_circs <- names(pathways$pathigraphs)
# extrac genes from a pathways
f_extract_genes <- function(j){

	genes <- unique(na.omit(unlist(V(getElement(get_element, j))$genesList)))
	genes_clean <- genes[genes != "/" & genes != "NA"]
	return(genes_clean)
}

# join every genes of every path
genes_com <- c()
circs_com <- c()
df <- c()

for (i in 1:length(names_circs)){
	x <- names_circs[i]
	get_element <- getElement(pathways$pathigraphs,x)$effector.subgraphs

	list_path_genes <- sapply(names(get_element), f_extract_genes)

	genes <- paste(do.call(c, list_path_genes)) 
	circs <- paste(do.call(c,sapply(1:length(list_path_genes), FUN=function(z) rep(names(list_path_genes)[z], length(list_path_genes[[z]])))))	
	genes_com <- c(genes_com, genes)
	circs_com <- c(circs_com, circs)	
}


df_circ_genes <- data.frame(circs = circs_com, genes = genes_com)


physiological_paths <- read.table("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/data/physiological_paths.tsv", sep="\t") 
df_circ_physi_genes <- df_circ_genes[unlist(lapply(physiological_paths$V2, FUN=function(x) grep(x, df_circ_genes$circs))),]
df_circ_physi_genes$circ_name <- get_path_names(pathways, df_circ_physi_genes$circs)


## dataframe with rare disease gene that belong to circuits of hipathia

name_enfermerdad_symbol <- readRDS("/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/00_parser_orphanet/gen_enfermedad/name_enfermerdad_symbol.rds")
colnames(name_enfermerdad_symbol) <- c("name_enf","gene")
symbol_entreid <- AnnotationDbi::select(org.Hs.eg.db, keys=paste(name_enfermerdad_symbol$gene), columns=c("ENTREZID"),keytype="SYMBOL")

gen_enf <- unique(merge(name_enfermerdad_symbol, symbol_entreid, by.x="gene",by.y="SYMBOL"))

genes_pert_rrdd_path_physi <- df_circ_physi_genes[df_circ_physi_genes$genes %in% gen_enf$ENTREZID,]

saveRDS(genes_pert_rrdd_path_physi, file="/mnt/lustre/scratch/CBRA/research/projects/rrdd_mm/results/02_genes_pert_rrdd_path_physi.rds")
