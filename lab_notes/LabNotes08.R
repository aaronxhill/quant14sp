############################################################
# Quantitative Methods, Hill
# Statistical Computing Lab 8
############################################################

### dataset: instructorevals

# plot your data (scatterplot), with the dependent varible on the y axis
# plot(y ~ x)
plot(instructorevals$Insteval ~ instructorevals$Grade)

# simple regression
# lm(y ~ x)
simple.regression <- lm(instructorevals$Insteval ~ instructorevals$Grade)
summary(simple.regression)

# add a line to your plot, representing the regression line
# abline(lm(y ~ x), col="red")
abline(lm(instructorevals$Insteval ~ instructorevals$Grade), col="red")

### Dummy Variables

# Since the values of a nominal/ordinal variable do not convey numeric information, such a variable should not be used in a regression model. Instead, each value of the nominal/ordinal variable can be represented in the model with a dummy variable. A dummy variable contains only the values TRUE and FALSE (which are stores as values of 1 and 0), with a value of TRUE indicating that the associated observation has the given nominal/ordinal value. # What if we wanted to use states$REGION in a regression model? Even though the values in R are numeric, this is not an interval-ratio variable. But, we could include this by creating K-1 (K is number of categories) dummy variables. 

# states$REGION Freq ValidProp Proportion
#       Midwest   12      0.24       0.24
#     Northeast   11      0.22       0.22
#         South   14      0.28       0.28
#          West   13      0.26       0.26
#             N   50      1.00       1.00
#  NA / missing    0        NA       0.00
#         Total   50        NA       1.00

# Midwest dummy:# Region Value 	Midwest Dummy Value # Midwest 		TRUE # Northeast 	FALSE # South 		FALSE # West 			FALSE # Northeast dummy:# Region Value 	Northeast Dummy Value 
# Midwest 		FALSE 
# Northeast 	TRUE 
# South 		FALSE 
# West 			FALSE # South dummy:# Region Value 	South Dummy Value 
# Midwest 		FALSE 
# Northeast 	FALSE 
# South 		TRUE 
# West 			FALSE # Why no West dummy? # One of the categories needs to serve as a baseline. It doesn’t matter which one. You should always create k-1 dummy variables for each nominal or ordinal variable you plan to use. 

### syntax to create dummy variables for states$REGION

states$MIDWEST <- (states$REGION == "Midwest")
states$NORTHEAST <- (states$REGION == "Northeast")
states$SOUTH <- (states$REGION == "South")
