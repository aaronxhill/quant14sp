############################################################
# Quantitative Methods, Hill
# Statistical Computing Lab 6
############################################################

### dataset: states

# Chi Square
### Level of measurement:
# The dependent variable must be nominal or ordinal.# The independent variable must be nominal or ordinal.   

### GENERAL SYNTAX
chisq.test(x, correct=FALSE) # where "x" is a crosstab

# see LabNotes02.R to review crosstabs

### Example:  Does poverty vary by region?  In this example, we are going to use the Chi-Square test for statistical significance.  
### Dependent variable: POVERTY (recoded to ordinal)
### Independent variable: REGION

# states$POVERTY is interval-ratio, and Chi Square requires a nominal/ordinal dependent variable. First, recode POVERTY:
states$poverty.ordinal[states$POVERTY <= 10.5] <- 1
states$poverty.ordinal[states$POVERTY > 10.5] <- 2
states$poverty.ordinal <- factor(states$poverty.ordinal, labels=c("Low poverty (<=10.5)", "High poverty (>10.5)"))

# show a crosstab and column percentages (for review of this, see LabNotes02.R):
table(states$poverty.ordinal, states$REGION)
prop.table(table(states$poverty.ordinal, states$REGION), 2) #column percentages

# conduct the Chi Square test: 
chisq.test(table(states$poverty.ordinal, states$REGION), correct=FALSE)

# interpreting the results: 

# Check whether the p-value is less than 0.05.  If it is less than 0.05, it means that there is a statistically significant difference between two variables.    If the p-value greater than 0.05, we will fail to reject the null hypothesis.### Technically reporting Chi Square:# The percentage of persons below the poverty line varied by region.  X2(3, N = 50) = 21.3, p < .001.  