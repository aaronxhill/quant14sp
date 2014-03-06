###################################################################################################
################# ADMIN CODE -- DO NOT MODIFY #####################################################
options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))
library(RCurl)
xadmin <- getURL("https://raw.github.com/aaronxhill/quant14sp/master/admin/admin.R")
eval(parse(text=xadmin), envir= .GlobalEnv)
###################################################################################################

### Variable Recoding# Often, we need to change the level of measurement of a variable.  It is possible to collapse interval-ratio level variables into nominal or ordinal variables.  It is not possible to transform nominal or ordinal variables into interval-ratio variables.  We can create a new nominal/ordinal version of an interval-ratio variable by recoding it.  Recoding a variable should follow this important rule: Variables should be exhaustive and mutually exclusive (meaning: every observation must fit into a category, but only one category).  # Before you recode a variable, you need to decide the coding scheme.  To decide the coding scheme, you need to understand the variable’s distribution:  

### RECODE THE VARIABLE physicians INTO AN ORDINAL VARIABLE

physicians.description

# First, look at the distribution of physicians
summary(country$physicians)
hist(country$physicians)
quantile(country$physicians, seq(0, 1, 0.1), na.rm=TRUE)

# Next, use subset assignment statements to assign an ordinal coding scheme for a new variable: physiciansCat

country$physiciansCat[country$physicians <= 25] <- 1
country$physiciansCat[country$physicians > 25 & country$physicians <= 100] <- 2
country$physiciansCat[country$physicians > 100 & country$physicians <= 250] <- 3
country$physiciansCat[country$physicians > 250] <- 4

# Convert the new variable to a "factor" (to indicate that it's nominal or ordinal) and assign value labels
country$physiciansCat <- factor(country$physiciansCat, labels=c('0-25 physicians per 100k', '26-100 physicians per 100k', '101-250 physicians per 100k', '>250 physicians per 100k'))

# Create a description variable to document the nature of your new variable
physiciansCat.description <- "ORDINAL: Physicians per 100,000 people"

# Check your work: 
# 1. look at the distribution of the new variable and compare it to the distribution of the old variable
# 2. use the tapply funtion to summarize the old variable across categories of the new ordinal variable
table(country$physiciansCat, useNA="ifany") # distribution of new variable (including missing values)
summary(country$physicians) # distribution of old variable
tapply(country$physicians, country$physiciansCat, summary)

### IN CLASS EXERCISE: 

# Recode mort2004 into an ordinal variable:
# 1. Look at its distribution to decide on a coding scheme that creates THREE categories
# 2. Create a new variable that implements your coding scheme
# 3. Convert it to a factor and label the values
# 4. Create the description variable
# 5. Check your work
# 6. Create a crosstab of physicians and infant mortality

mort2004.description

# First, look at the distribution of physicians
summary(country$mort2004)
hist(country$mort2004)
quantile(country$mort2004, seq(0, 1, 0.05), na.rm=TRUE)

# Next, use subset assignment statements to assign an ordinal coding scheme for a new variable: physiciansCat

country$mort2004Cat[country$mort2004 <= 15] <- 1
country$mort2004Cat[country$mort2004 > 15 & country$mort2004 <= 50] <- 2
country$mort2004Cat[country$mort2004 > 50] <- 3

# Convert the new variable to a "factor" (to indicate that it's nominal or ordinal) and assign value labels
country$mort2004Cat <- factor(country$mort2004Cat, labels=c('Low: 0-15 infant deaths per 1k', 'Medium: 16-50 infant deaths per 1k', 'High: >50 infant deaths per 1k'))

# Create a description variable to document the nature of your new variable
country$mort2004Cat.description <- "ORDINAL: Infant mortality rate"

# Check your work: 
# 1. look at the distribution of the new variable and compare it to the distribution of the old variable
# 2. use the tapply funtion to summarize the old variable across categories of the new ordinal variable
table(country$mort2004Cat, useNA="ifany") # distribution of new variable (including missing values)
summary(country$mort2004) # distribution of old variable
tapply(country$mort2004, country$mort2004Cat, summary)
