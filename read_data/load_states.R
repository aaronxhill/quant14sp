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
x <- getURL("https://raw2.github.com/aaronxhill/quant14sp/e6cc53e98ce09a091003d579bdd6d6300e47109f/datasets/states.csv")
states <- read.csv(text = x)

# metadata about variables
STATE.description <- 'STATE NAME'
REGION.description <- 'REGION: 1=NE, 2=So., 3=MW, 4=W'
POPULATI.description <- 'Population in millions'
URBAN.description <- '% of population urban'
MOBILITY.description <- '%born in state of residence'
LT18.description <- '% younger than 18'
GT65.description <- '% older than 65'
DENSITY.description <- 'Population per square mile'
PCTWHITE.description <- '% of population white'
PCTBLACK.description <- '% of population black'
PCTNAM.description <- '% of population Native American'
PCTASIAN.description <- '% of population Asian and Pacific Islander'
PCTHISP.description <- '% of population Hispanic'
IMMIG.description <- 'New immigrants per 10,000 population'
MARRIAGE.description <- 'Number of marriages per 1000 population'
DIVORCES.description <- 'Number of divorces per 1000 population'
FEMHEAD.description <- '% of households female-headed'
BRATE.description <- 'Births per 1000 population'
LOWBWT.description <- '% of births w low birth weight'
PRISONER.description <- '% living in correctional institutions'
HOMELESS.description <- '% living in shelters for homeless'
DRATE.description <- 'Deaths per 1000 population'
SUICIDES.description <- 'Suicides per 100,000 population'
TEENMOM.description <- '% of all births to teen moms'
INFMORT.description <- 'Infant mortality rate'
BEER.description <- 'Gallons of beer consumed'
AIDS.description <- 'AIDS/HIV deaths per 100,000 population'
ABORTION.description <- 'Abortions per 1000 women'
DOCTORS.description <- 'Number pf Drs per 100,000 population'
POVERTY.description <- '% of persons below poverty line'
MDFAMINC.description <- 'Median family income'
UNEMPLY.description <- 'Unemployment rate'
DROPOUT.description <- '% of population older than 25 who have not completed HS'
HSGRAD.description <- '% of population with HS degree'
COLLGRAD.description <- '% of population with college degree'
HOMICIDE.description <- 'Homicides per 100,000 population'
RAPE.description <- 'Rapes per 100,000 population'
ROBBERY.description <- 'Robberies per 100,000 population'
ASSAULT.description <- 'Assaults per 100,000 population'
BURGLARY.description <- 'Burglaries per 100,000 population'
LARCENY.description <- 'Larcenies per 100,000 population'
CARTHEFT.description <- 'Car thefts per 100,000 population'
BUSH00.description <- '% voting for Bush in 2000'
GORE00.description <- '% voting for Gore in 2000'
NADER00.description <- '% voting for Nader in 2000'
TURNOUT.description <- '% of voting age population that voted'

# summary stats and data classes of raw dataset
nrow(states)

head(states)

summary(states)

colnames(states)

lapply(states, class)


