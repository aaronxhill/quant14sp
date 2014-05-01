############################################################
# Quantitative Methods, Hill
# Statistical Computing Lab 10
############################################################

# data: empdat

# To assess problems with circularity and/or colinearity, you need to see a matrix of Pearson's R scores for all the possible variable combinations. To generate this matrix, use the cor() function as used in LabNotes07.R, adding all the variables that belong in the matrix (hint: level of measurement matters).

# example: 
cor(empdat[ ,c("salary","educ","jobtime")], use="complete.obs", method="pearson")
