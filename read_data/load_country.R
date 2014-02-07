#install.packages("RCurl")

# IF USING WINDOWS: UNCOMMENT AND RUN THIS: 
#options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))

# function to get mode:
getmode <- function(x) {
	z <- table(x)
	names(z)[z == max(z)]
}

# function to make tidier tables
freqtable <- function(x) {
	zf <- as.data.frame(table(x))
	zp <- as.data.frame(prop.table(table(x)))
	z <- cbind(zf, zp[2])
	z$x <- factor(z$x, levels = c(levels(z$x), "N", "NA / missing", "Total"))
	colnames(z)[1] <- deparse(substitute(x))
	colnames(z)[3] <- "ValidProp"
	sumf <- sum(z[2])
	sump <- sum(z[3])
	z[nrow(z)+1, 2] <- sumf
	z[nrow(z), 1] <- "N"
	z[nrow(z), 3] <- sump
	z[nrow(z)+1, 1] <- "NA / missing"
	z[nrow(z), 2] <- sum(is.na(x))
	z$Proportion <- z$Freq / (sumf + sum(is.na(x)))
	z[nrow(z)+1, 1] <- "Total"
	z[nrow(z), 2] <- sumf + sum(is.na(x))
	z[nrow(z), 4] <- 1
	print.data.frame(z, row.names=FALSE)
}

library(RCurl)

# read file from the cloud (GitHub)
x <- getURL("https://raw2.github.com/aaronxhill/quant14sp/e6cc53e98ce09a091003d579bdd6d6300e47109f/datasets/country.csv")
country <- read.csv(text = x)

# clean country names, encoding problems for special characters
country$country <- gsub("\xca", " ", country$country)
country$country <- gsub("\xfc\xbe\x8e\x93\xa4\xbc", "o", country$country)
country$country <- gsub("\xfc\xbe\x99\x93\xa0\xbc", "e", country$country)

# remove case variable
country$case <- NULL

# metadata about variables
country.description <- 'country'
hdirank.description <- 'HDI Rank'
hdicat.description <- 'HDI Category'
pop2004.description <- 'Total population 2004 in millions'
urban2004.description <- 'Urban Population 2004 % of total'
physicians.description <- 'Physicians per 100,000 people'
mort2004.description <- 'Infant mortality rate (per 1,000 births) 2004'
tele2004.description <- 'Telephone mainlines (per 1,000 people) 2004'
cell2003.description <- 'Cell phones per 1,000 people 2003'
internet03.description <- 'Internet users per 1,000 people 2003'
gdp.description <- 'GDP per capita US$ 2004'
inequality.description <- 'Ratio of richest 10% to poorest 10%'
educ04.description <- 'Public expenditure on education (% of GDP) 2004'
milit2004.description <- 'Public expenditure on military (% of GDP) 2004'
debt04.description <- 'Total debt service % of GDP 2004'
cde2003.description <- 'Carbon dioxide emissions share of world total % 2003'
lifef.description <- 'Female life expectancy 2004'
lifem.description <- 'Male life expectancy 2004'

# summary stats and data classes of raw dataset
nrow(country)

head(country)

summary(country)

colnames(country)

lapply(country, class)


