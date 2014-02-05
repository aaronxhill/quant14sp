#install.packages("RCurl")

library(RCurl)

# read file from the cloud (GitHub)
x <- getURL("https://raw2.github.com/aaronxhill/quant14sp/e6cc53e98ce09a091003d579bdd6d6300e47109f/datasets/states.csv")
states <- read.csv(text = x)

# summary stats and data classes of raw dataset
nrow(states)

head(states)

summary(states)

colnames(states)

lapply(states, class)


