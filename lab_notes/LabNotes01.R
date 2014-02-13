############################################################
#http://www.r-project.org

# To familiarize yourself with the software, watch sections 1.1, 1.2, 1.3, 1.4, and 2.1 at:
# http://www.youtube.com/watch?v=iffR3fWv4xw&list=PLOU2XLYxmsIK9qQfztXeybpHvru-TrqAP

# Also, here's a broad overview of R:
# http://www.nytimes.com/2009/01/07/technology/business-computing/07program.html?pagewanted=all
# At https://github.com/aaronxhill/quant14sp in the "read_data" folder, you'll find R scripts for loading data for use in this class.  

# For these examples, load the "states" data. Then create a new R script for your analysis: 

# To get the number of rows/observations: 
nrow(states)

# To get the raw values for the first few rows in the dataset: 
head(states)

# To summarize every variable in the dataset: 
summary(states)

# To get the names of the variables in the dataset: 
colnames(states)

# To get the class of every variable in the dataset: 
lapply(states, class)

# The class function is particularly helpful in determining the level of measurement of a variable. 

# Descriptions about each variable are saved in variables with the same name, but with ".description" appended. For example, run: 

CARTHEFT.description

# Output: 

# Frequency Tables

#        12        11        14        13 

nrow(states)

prop.table(table(states$REGION))
#   Midwest Northeast     South      West 
#      0.24      0.22      0.28      0.26

freqtable(states$REGION)

# Output: 
#  states$REGION Freq ValidProp Proportion
#        Midwest   12      0.24       0.24
#      Northeast   11      0.22       0.22
#          South   14      0.28       0.28
#           West   13      0.26       0.26
#              N   50      1.00       1.00
#   NA / missing    0        NA       0.00
#          Total   50        NA       1.00


summary(states$DENSITY)
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#    1.10   41.35   88.05  181.90  186.10 1134.00 

# The range function in R also give you the min and max:

range(states$DENSITY)

# Output: 

# [1]    1.099998 1134.199219

max(states$DENSITY) - min(states$DENSITY)

# [1] 1133.099

# The mode is somewhat tricky to get in R, so for this class, a special function "getmode" was written to show the mode:

getmode(states$REGION)

# Compute the variance and standard deviation for DENSITY: 

var(states$DENSITY)

# Output: 

# [1] 62570.44

sd(states$DENSITY)

# [1] 250.1408

# What's the standard deviation squared? 

sd(states$DENSITY) ^ 2

# What's the square root of the variance? 

sqrt(var(states$DENSITY))

# The interquartile range shows the difference between the upper and lower quartiles:

IQR(states$DENSITY)

# Output: 

# [1] 144.7997

# To get the value of a specific percentile, use the quantile function. Find the value of the 60th percentile:
 
quantile(states$DENSITY, 0.60, na.rm=TRUE)

# Output: 

#      60% 
# 135.0397 

# You can also use the quantile function with the seq function to get the percentiles of a sequence (such as deciles): 

quantile(states$DENSITY, seq(0, 1, 0.1))
# Output:

#          0%         10%         20%         30%         40%         50%         60%         70%         80%         90%        100% 
#    1.099998   14.489999   31.759912   48.669958   64.199854   88.049927  135.039746  171.119971  233.519922  415.799707 1134.199219 