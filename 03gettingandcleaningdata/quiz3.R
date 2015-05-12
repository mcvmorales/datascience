# Q1
# --
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL, destfile = "./housing.csv", method = "auto")
housing <- read.csv("./housing.csv")

agricultureLogical <- housing$ACR == 3 & housing$AGS == 6
which(agricultureLogical)

# Q2
# --
install.package("jpeg")
library(jpeg)

imgURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(imgURL, destfile = "./jtleek.jpg", method = "auto")
img <- readJPEG("./jtleek.jpg", native = TRUE)

quantile(img, probs = c(.30, .80))

# Q3
# --
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileURL, destfile = "./gdp-data.csv", method = "auto")
gdp <- read.csv("./gdp-data.csv", skip = 5, nrows = 190) # looking only at the 190 countries
names(gdp)[1] <- "CountryCode"
names(gdp)[2] <- "GDP"

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileURL, destfile = "./fedstats.csv", method = "auto")
edu <- read.csv("./fedstats.csv")

mdat <- as.data.frame(merge(gdp, edu, by.x = "CountryCode", by.y = "CountryCode"))
mdat$GDP <- as.numeric(as.character(mdat$GDP))
mdat <- arrange(mdat, desc(GDP))
View(mdat)

# Q4
# --
mean(mdat[mdat$Income.Group == "High income: OECD", ]$GDP)
mean(mdat[mdat$Income.Group == "High income: nonOECD", ]$GDP)

# Q5
# --
per <- c(.20, .40, .60, .80, 1)
val <- quantile(mdat$GDP, per)
res <- mdat$V2 <= 38

xtabs(res ~ combined$Income.Group)