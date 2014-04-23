############################################################
# Quantitative Methods, Hill
# Statistical Computing Lab 7
############################################################

### dataset: drugtreatment

### NOMINAL measures of association

# start with a crosstab: 
nominal.xtab <- table(drugtreatment$DFREE, drugtreatment$TREAT)

# store the value for chi square: 
chisquare <- as.numeric(chisq.test(nominal.xtab, correct=FALSE)[1])

# Phi
sqrt(chisquare / sum(nominal.xtab))

# Cramer's V
sqrt(chisquare / (sum(nominal.xtab) * (min(dim(nominal.xtab))-1)))

# lambda
e1 <- sum(nominal.xtab) - max(margin.table(nominal.xtab, 1))
e2 <- sum(margin.table(nominal.xtab, 2) - apply(nominal.xtab, 2, max))
(e1 - e2) / e1



### ORDINAL measure of association

# start with a crosstab: 
ordinal.xtab <- table(drugtreatment$DFREE, drugtreatment$IVHX)

# Gamma
gamma.ord <- function(x) {
	ns <- 0
	for (i in 1:(dim(x)[1]-1)) {
		for (j in 1:(dim(x)[2]-1)) {
			ns <- ns + x[i, j] * sum(x[i+1, (j+1):(dim(x)[2])])
		}
	}
	nd <- 0
	for (i in 1:(dim(x)[1]-1)) {
		for (j in dim(x)[2]:2) {
			nd <- nd + x[i, j] * sum(x[i+1, 1:(j-1)])
		}
	}	
	(ns - nd) / (ns + nd)
}
gamma.ord(ordinal.xtab)



### SCALE measures of association

cor(drugtreatment$BECK, drugtreatment$AGE, method="spearman", use="complete.obs")



### INTERVAL-RATIO measures of association

cor(drugtreatment$BECK, drugtreatment$AGE, method="pearson", use="complete.obs")
