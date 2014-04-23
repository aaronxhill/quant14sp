############################################################
# Quantitative Methods, Hill
# Statistical Computing Lab 9
############################################################

# data: instructorevals

# Refer to LabNotes05.R for guidance on getting means by group
# Specifically, go to line 27: you'll use the "aggregate" function

# Recall that you can include independent variables that are nominal/ordinal,
# as long as you have coded them properly as dummy variables. 
# Refer to LabNotes08.R for guidance on creating dummy variables
# (starting at line 21)

# Recall the general syntax for simple regression: 
# simple regression
# lm(y ~ x)
# simple.regression <- lm(instructorevals$Insteval ~ instructorevals$Grade)
# summary(simple.regression)

# This can be extended by adding more independent variables, separated by "+"
# General syntax, multiple regression: 
# lm(y ~ x1 + x2 + x3 + ... + xk)

# example: 
multiple.regression <- lm(instructorevals$Insteval ~ instructorevals$Grade + instructorevals$Clarity + instructorevals$Knowledge + instructorevals$Interest)
summary(multiple.regression)
