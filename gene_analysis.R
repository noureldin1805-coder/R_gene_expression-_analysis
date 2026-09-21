gene_names = c("BRCA1", "TP53", "EGFR", "MYC", "PTEN", "KRAS")
control    = c(5.2, 7.8, 3.1, 9.4, 6.0, 4.5)
treated    = c(8.9, 7.6, 6.7, 12.1, 2.3, 9.8)

names(control) = gene_names #يتقول ان اسماء الحاجات هتبقي اللي في كنترول هل جين نيمز
names(treated) = gene_names

fold_change = treated / control

some_fold_changes = fold_change[fold_change > 1.5]

expression_matrix  = cbind(control, treated) #column bind حط كل واحد في عمود

dimnames(expression_matrix) <- list(
  c("gene_name 1","gene_name 2","gene_name 3","gene_name 4","gene_name 5","gene_name 6"),
  c("Control", "Treated")
)

mean_of_the_expression <- rowMeans(expression_matrix)#rowmeans عشان يحسب كل واحد لوحده 

Categorization = 
  ifelse(
    fold_change > 1.2,"upregulated",
    ifelse(
      fold_change < 0.8,"downregulated",
      "stable"
    )
  )

Categorization <- factor(
  Categorization,
  levels = c("upregulated", "downregulated", "stable")
)


results = data.frame(
  Fold_Change = fold_change,
  Classification = Categorization
)

print(results)


write.table(results, file = "results.txt")

