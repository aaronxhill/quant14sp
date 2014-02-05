#install.packages("RCurl")

library(RCurl)

# read file from the cloud (GitHub)
x <- getURL("https://raw2.github.com/aaronxhill/quant14sp/e6cc53e98ce09a091003d579bdd6d6300e47109f/datasets/country.csv")
country <- read.csv(text = x, fileEncoding="latin1")

# clean country names, encoding problems
country$country <- gsub("\xca", " ", country$country)
country$country <- gsub("\xfc\xbe\x8e\x93\xa4\xbc", "o", country$country)
country$country <- gsub("\xfc\xbe\x99\x93\xa0\xbc", "e", country$country)

# remove case variable
country$case <- NULL

# summary stats and data classes of raw dataset
nrow(country)

head(country)

summary(country)

colnames(country)

lapply(country, class)


