arch = "/mnt/lustre/scratch/CBRA/projects/cov_rd/data/00_parser_orphanet/enfermedad_clasificacion/en_product7.xml"

# Load the package required to read XML files.
library("XML")

# Also load the other required package.
library("methods")

# Give the input file name to the function.
result <- xmlParse(file = arch)

# Print the result.
print(result)

xmldataframe <- xmlToDataFrame(arch)

rootnode <- xmlRoot(result)
rootsize <- xmlSize(rootnode)

v1 <- c()
v2 <- c()
for (i in 1:7433){
  cat(dim(xmlToDataFrame(rootnode[[2]][[i]])))
  cat("\n")
  v1 <- c(v1, dim(xmlToDataFrame(rootnode[[2]][[i]]))[1])
  v2 <- c(v2, dim(xmlToDataFrame(rootnode[[2]][[i]]))[2])
}

completos <- which(v2==2)

enfermedad <- c()
clasificacion <- c()
for (i in completos){
  
  cat(dim(xmlToDataFrame(rootnode[[2]][[i]])))
  cat("\n")
  
  enfermedad <- c(enfermedad, paste(xmlToDataFrame(rootnode[[2]][[i]])[,1][3]))
  clasificacion <- c(clasificacion,gsub("[0-9]","",gsub("Preferential parent","",xmlToDataFrame(rootnode[[2]][[i]])[,2][4])))
  
}
df_enfermedad_clasificacion[1,]
df_enfermedad_clasificacion <- data.frame(enfermedad, clasificacion)
saveRDS(df_enfermedad_clasificacion, file="/mnt/lustre/scratch/CBRA/projects/cov_rd/results/00_parser_orphanet/enfermedad_clasificacion/enfermedad_clasificacion.rds")



