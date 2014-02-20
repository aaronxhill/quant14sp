###################################################################################################
################# ADMIN CODE -- DO NOT MODIFY #####################################################
options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))
library(RCurl)
xadmin <- getURL("https://raw.github.com/aaronxhill/quant14sp/master/admin/admin.R")
eval(parse(text=xadmin), envir= .GlobalEnv)
###################################################################################################

############################################################
# Quantitative Methods, Hill
# Statistical Computing Lab 2
############################################################

#DATA: lowbwt
#(data description at the bottom of this document)

#Graphs: Pie Chart & Bar Chart#Pie charts and bar charts are appropriate for nominal #or ordinal variables with only a few values.  To get #charts for the variable race: 

RACE.description

pie(table(lowbwt$RACE), main="Title of Graph", col=c("red", "blue", "green"))

barplot(table(lowbwt$RACE), main="Title of Graph", xlab="X Axis Label")

#Graphs: Histogram#Histograms are appropriate for interval-ratio #variables with only a few values.  Histograms can be #obtained in the Explore function.  To get summary #statistics and a histogram for the variable age: 

AGE.description

hist(lowbwt$AGE)

#Crosstabs#A crosstab displays the joint frequency distributions #of two nominal or ordinal variables.  Crosstabs can #help show whether there is a relationship between two #nominal or ordinal variables.  

HT.description

table(lowbwt$HT, lowbwt$RACE)
prop.table(table(lowbwt$HT, lowbwt$RACE)) # cell percentages
prop.table(table(lowbwt$HT, lowbwt$RACE), 2) # column percentages

#############################################################################
#SOURCE:  Hosmer and Lemeshow (2000) Applied Logistic Regression: Second #	Edition.  These data are copyrighted by John Wiley & Sons Inc. and must #	be acknowledged and used accordingly. Data were collected at Baystate#	Medical Center, Springfield, Massachusetts during 1986.#DESCRIPTIVE ABSTRACT:#The goal of this study was to identify risk factors associated with#giving birth to a low birth weight baby (weighing less than 2500 grams).#Data were collected on 189 women, 59 of which had low birth weight babies#and 130 of which had normal birth weight babies.  Four variables which were#thought to be of importance were age, weight of the subject at her last#menstrual period, race, and the number of physician visits during the first#trimester of pregnancy.#STORY BEHIND THE DATA:   #Low birth weight is an outcome that has been of concern to physicians#for years. This is due to the fact that infant mortality rates and birth#defect rates are very high for low birth weight babies. A woman's behavior#during pregnancy (including diet, smoking habits, and receiving prenatal care)#can greatly alter the chances of carrying the baby to term and, consequently,#of delivering a baby of normal birth weight.        #The variables identified in the code sheet given in the table have been#shown to be associated with low birth weight in the obstetrical literature. The#goal of the current study was to ascertain if these variables were important#in the population being served by the medical center where the data were#collected.