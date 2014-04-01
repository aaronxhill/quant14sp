#install.packages("RCurl")

# IF USING WINDOWS: UNCOMMENT AND RUN THIS: 
#options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))

library(RCurl)

# read file from the cloud (GitHub)
x <- getURL("https://raw.githubusercontent.com/aaronxhill/quant14sp/master/datasets/empdat.csv")
empdat <- read.csv(text = x)

# summary stats and data classes of raw dataset
summary(empdat)
nrow(empdat)
colnames(empdat)

attach(empdat)
lapply(empdat, class)


### FIX DATE (convert from factor to date; correct two-year date problem) ###

# convert factor to date class
empdat$dob.datex <- as.Date(empdat$dob, format = "%m/%d/%y")

# set all dates to 20th century
empdat$dob.date <- as.Date(ifelse(empdat$dob.datex > Sys.Date(), 
  format(empdat$dob.datex, "19%y-%m-%d"), 
  format(empdat$dob.datex)))

# delete raw and interim date variables 
empdat$dob.datex <-NULL
empdat$dob <-NULL

detach(empdat)

summary(empdat)