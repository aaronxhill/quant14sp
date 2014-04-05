### READS IN ALL DATA FOR LABS AND CLASS ASSIGNMENTS

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

################## COUNTRY #############################################################
#options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))
#library(RCurl)

# read file from the cloud (GitHub)
x <- getURL("https://raw2.github.com/aaronxhill/quant14sp/e6cc53e98ce09a091003d579bdd6d6300e47109f/datasets/country.csv", ssl.verifypeer=FALSE)
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

################## STATES #############################################################

# read file from the cloud (GitHub)
x <- getURL("https://raw2.github.com/aaronxhill/quant14sp/e6cc53e98ce09a091003d579bdd6d6300e47109f/datasets/states.csv", ssl.verifypeer=FALSE)
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

################## LOWBWT #############################################################

# read file from the cloud (GitHub)
x <- getURL("https://raw2.github.com/aaronxhill/quant14sp/master/datasets/lowbwt.csv", ssl.verifypeer=FALSE)
lowbwt <- read.csv(text = x)

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

################## INSTRUCTOREVALS #################################################

# read file from the cloud (GitHub)
x <- getURL("https://raw.githubusercontent.com/aaronxhill/quant14sp/master/datasets/instructorevals.csv", ssl.verifypeer=FALSE)
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

################## DRUGTREATMENT ###################################################

# read file from the cloud (GitHub)
x <- getURL("https://github.com/aaronxhill/quant14sp/raw/master/datasets/drugtreatment.csv", ssl.verifypeer=FALSE)
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
AGE.description <- 'Age'
BECK.description <- 'Beck depression score at admission'
IVHX.description <- 'IV drug use history at admission'
NDRUGTX.description <- 'Number of prior drug treatments'
RACE.description <- 'Race'
TREAT.description <- 'Treatment randomization assignment'
SITE.description <- 'Treatment site'
DFREE.description <- 'Remained drug free for 12 months'

################## EMPDAT ##########################################################

# read file from the cloud (GitHub)
x <- getURL("https://raw.githubusercontent.com/aaronxhill/quant14sp/master/datasets/empdat.csv, ssl.verifypeer=FALSE")
empdat <- read.csv(text = x)

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



################## END #############################################################

#check naming conventions

#names <- c(colnames(country), colnames(states), colnames(lowbwt), colnames(empdat), colnames(drugtreatment), colnames(instructorevals))
#namestab <- table(names)
#namestab

####################################################################################
rm(x)
rm(xadmin)