Tanimoto_table<-read.table("../Tanimoto_table.csv", sep=",", header=TRUE, row.names = 1)
sink("Tanimoto_virs_0.9.csv")
for (i in 1:1475) {
for (y in 2:6858) {
if (Tanimoto_table[i,y] > 0.9) {
cat(rownames(Tanimoto_table)[i])
cat(' ')
cat(colnames(Tanimoto_table)[y])
cat(' ')
cat(Tanimoto_table[i,y])
cat("\n")
}
}
}
sink()
