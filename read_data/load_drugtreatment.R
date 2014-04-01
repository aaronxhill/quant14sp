#install.packages("RCurl")

# IF USING WINDOWS: UNCOMMENT AND RUN THIS: 
#options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))

library(RCurl)

# read file from the cloud (GitHub)
x <- getURL("https://raw.githubusercontent.com/aaronxhill/quant14sp/master/datasets/drugtreatment.csv")
drugtreatment <- read.csv(text = x)
rm(x)

head(drugtreatment)

### FIXES ###

drugtreatment$DFREE <- (drugtreatment$DFREE == 1)
drugtreatment$IVHX <- factor(drugtreatment$IVHX, labels = c("never", "previous", "recent"))
drugtreatment$RACE <- factor(drugtreatment$RACE, labels = c("white", "other"))
drugtreatment$TREAT <- factor(drugtreatment$TREAT, labels = c("Short", "Long"))
drugtreatment$SITE <- factor(drugtreatment$SITE, labels = c("A", "B"))

# metadata about variables
ID.description <- 'ID'
AGE.description <- 'Age at enrollment'
BECK.description <- 'Beck depression score at admission'
IVHX.description <- 'IV drug use history at admission'
NDRUGTX.description <- 'Number of prior drug treatments'
RACE.description <- "Subject's race"
TREAT.description <- 'Treatment randomization assignment'
SITE.description <- 'Treatment site'
DFREE.description <- 'Remained drug free for 12 months'

# summary stats and data classes of raw dataset
nrow(drugtreatment)

head(drugtreatment)

summary(drugtreatment)

colnames(drugtreatment)

lapply(drugtreatment, class)
