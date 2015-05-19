Quiz #3
=======
The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using `download.file()` from here: 
https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv

The code book, describing the variable names is here:  
https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf 

Create a logical vector that identifies the households on greater than 10 acres who sold more than $10,000 worth of
agriculture products. Assign that logical vector to the variable `agricultureLogical`. Apply the `which()` function like this to identify the rows of the data frame where the logical vector is `TRUE`.

What are the first three values of the result from `which(agricultureLogical)`?

```r
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL, destfile = "./housing.csv", method = "auto")
housing <- read.csv("./housing.csv")

agricultureLogical <- housing$ACR == 3 & housing$AGS == 6
which(agricultureLogical)
```



Using the **{jpeg}** package, read in the following picture of your instructor into R:  
https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg 

Use the parameter `native = TRUE`.  
What are the 30th and 80th quantiles of the resulting data? (some Linux systems may produce an answer 638 different for the 30th quantile)

```r
install.package("jpeg")
library(jpeg)

imgURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(imgURL, destfile = "./jtleek.jpg", method = "auto")
img <- readJPEG("./jtleek.jpg", native = TRUE)

quantile(img, probs = c(.30, .80))
```



Load the Gross Domestic Product data for the 190 ranked countries in this data set:  
https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 

Load the educational data from this data set:  
https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv 

Match the data based on the country shortcode. How many of the IDs match? Sort the data frame in descending order by GDP rank (so United States is last). What is the 13th country in the resulting data frame? 

Original data sources: 
http://data.worldbank.org/data-catalog/GDP-ranking-table 
http://data.worldbank.org/data-catalog/ed-stats

```r
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
```



What is the average GDP ranking for the `High income: OECD` and `High income: nonOECD` group?

```r
mean(mdat[mdat$Income.Group == "High income: OECD", ]$GDP)
mean(mdat[mdat$Income.Group == "High income: nonOECD", ]$GDP)
```



Cut the GDP ranking into five separate quantile groups. Make a table versus `Income.Group`. How many countries are lower-middle income but among the 38 nations with highest GDP?

```r
per <- c(.20, .40, .60, .80, 1)
val <- quantile(mdat$GDP, per)
res <- mdat$V2 <= 38

xtabs(res ~ combined$Income.Group)
```
