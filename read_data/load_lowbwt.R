#install.packages("RCurl")

# IF USING WINDOWS: UNCOMMENT AND RUN THIS: 
#options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))

library(RCurl)

# read file from the cloud (GitHub)
x <- getURL("https://raw2.github.com/aaronxhill/quant14sp/master/datasets/lowbwt.csv")
lowbwt <- read.csv(text = x)
rm(x)

lowbwt$LOW <- (lowbwt$LOW == 1)
lowbwt$RACE <- factor(lowbwt$RACE, labels = c("white", "black", "other"))
lowbwt$SMOKE <- (lowbwt$SMOKE == 1)
lowbwt$HT <- (lowbwt$HT == 1)
lowbwt$UI <- (lowbwt$UI == 1)

# prop.table(table(lowbwt$SMOKE2, lowbwt$SMOKE))

# metadata about variables
ID.description <- 'Identification Code'
LOW.description <- 'Low Birth Weight (0 = Birth Weight >= 2500g, 1 = Birth Weight < 2500g)'
AGE.description <- 'Age of the Mother in Years'
LWT.description <- 'Weight in Pounds at the Last Menstrual Period'
RACE.description <- 'Race (1 = White, 2 = Black, 3 = Other)'
SMOKE.description <- 'Smoking Status During Pregnancy (1 = Yes, 0 = No)'
PTL.description <- 'History of Premature Labor (0 = None  1 = One, etc.)'
HT.description <- 'History of Hypertension (1 = Yes, 0 = No)'
UI.description <- 'Presence of Uterine Irritability (1 = Yes, 0 = No)'
FTV.description <- 'Number of Physician Visits During the First Trimester (0 = None, 1 = One, 2 = Two, etc.)'
BWT.description <- 'Birth Weight in Grams'

# summary stats and data classes of raw dataset
nrow(country)

head(country)

summary(country)

colnames(country)

lapply(lowbwt, class)


