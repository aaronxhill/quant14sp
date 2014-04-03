###################################################################################################
################# ADMIN CODE -- DO NOT MODIFY #####################################################
options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))
library(RCurl)
xadmin <- getURL("https://raw.github.com/aaronxhill/quant14sp/master/admin/admin.R")
eval(parse(text=xadmin), envir= .GlobalEnv)
###################################################################################################

### dataset: states

# ANOVA

### Level of measurement:# The dependent variable must be interval-ratio.# The independent variable must be nominal or ordinal, with more than two categories to be tested.

# Test whether the poverty rate differs across regions of the U.S.  # Dependent variable: poverty# Independent variable: region

### GENERAL SYNTAX
# aggregate(y~x, dataset, mean) # look at the means by category
# anova.results <- aov(y~x, dataset) # use the aov function to compute anova and store the results in the variable anova.results
# summary(anova.results) # show the table of results


### SYNTAX FOR THIS EXAMPLE

# look at the means by REGION
aggregate(POVERTY~REGION, states, mean) 

# use the aov function to compute anova and store the results in the variable anova.results
anova.results <- aov(POVERTY~REGION, states) 

# show the table of results
summary(anova.results) 

# interpreting the results: 

# Does F-obtained (F value) fall in the critical region?  In other words, is the difference statistically significant? If the value of Pr(>F) is smaller than alpha (typically 0.05), we will reject the null hypothesis that there is no difference among the three populations represented by the three groups.  If the value of Pr(>F) is greater than 0.05, we will fail to reject the null hypothesis.# Technically reporting ANOVA:# We examined poverty by region.  There was a significant main effect of region F(3,46) = 8.284, p < 0.001. The highest level of poverty is in the South, and the lowest is in the Northeast. 

### ADVANCED: 

# Multiple comparisons: 
TukeyHSD(anova.results)
