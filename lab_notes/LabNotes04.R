###################################################################################################
################# ADMIN CODE -- DO NOT MODIFY #####################################################
options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))
library(RCurl)
xadmin <- getURL("https://raw.github.com/aaronxhill/quant14sp/master/admin/admin.R")
eval(parse(text=xadmin), envir= .GlobalEnv)
###################################################################################################

### dataset: states

# Two-Sample Hypothesis Test

### Level of measurement:# The dependent variable must be interval-ratio.# The independent variable must be nominal or ordinal, with two categories to be tested (this variable can have more than two categories, but with this test you will only be testing for a difference between only two of them).  

# Compare the variable turnout (% of voting age population that voted) by Regions Northeast and West
# Dependent variable is turnout and Independent variable is region.  This test will determine if there is a difference in average voter turnout between states in the Northeast and states in the West.  

### GENERAL SYNTAX
# t.test(y~x, dataset)

### SYNTAX FOR THIS EXAMPLE
t.test(TURNOUT~REGION, states) # BUT, there is a problem! REGION has four groups, and t-tests are for two groups

# when testing the difference between two groups when there are more than two, subset the data to include only the two groups that are going to be tested:
states.subset <- states[states$REGION %in% c("Northeast", "West"), ]

# look at the means differences between the groups:
aggregate(TURNOUT~REGION, states.subset, mean)

# run the test: 
t.test(TURNOUT~REGION, states.subset)

# interpreting the results: 

# First, evaluate the t score. Here, it is 2.266. Next, is it significant? The p-value is 0.03499. Since this is less than .05 it is significant.# Technically reporting Independent Sample T-Tests:# There was a significant effect for region, t(19.517) = 2.266, p = .035 with Northeast having a higher turnout than West.