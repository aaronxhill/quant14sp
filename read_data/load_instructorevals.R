#install.packages("RCurl")

# IF USING WINDOWS: UNCOMMENT AND RUN THIS: 
#options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))

library(RCurl)

# read file from the cloud (GitHub)
x <- getURL("https://raw.githubusercontent.com/aaronxhill/quant14sp/master/datasets/instructorevals.csv")
instructorevals <- read.csv(text = x)
rm(x)

head(instructorevals)

# metadata about variables
Insteval.description <- 'Instructor evaluation'
Clarity.description <- 'Clarity of presentation'
Stimul.description <- 'Stimulating presentation'
Knowledge.description <- "Instructor's knowledge of subject area"
Interest.description <- 'Your interest in subject'
Grade.description <- 'Your expected grade'

# summary stats and data classes of raw dataset
nrow(instructorevals)

head(instructorevals)

summary(instructorevals)

colnames(instructorevals)

lapply(instructorevals, class)
