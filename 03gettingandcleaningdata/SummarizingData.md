Summarizing Data
================
Consider the example data set, "Restaurants," from Open Baltimore.  
https://data.baltimorecity.gov/Community/Restaurants/k5ry-ef3g

Recall the process of getting data from the web:

```r
if(!file.exists("./data")) {dir.create("./data")}
fileURL <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileURL, destfile = "./data/restaurants.csv", method = "curl")
data <- read.csv("./data/restaurants.csv")
```

Use functions like `head()`, `tail()`, `summary()`, and `str()` to get a glimpse of our data.
`quantile()` is also useful for finding out more about quantitative variables. For example:

```r
quantile(data$councilDistrict, na.rm = TRUE)
quantile(data$councilDistrict, probs = c(0.5, 0.75, 0.9))
```

Other Approaches
----------------
We can make tables from our data using `table()`.

```r
table(data$zipCode, useNA = "ifany")
table(data$councilDistrict, data$zipCode)
```

Check for missing values.

```r
sum(is.na(data$councilDistrict)) # counts the number of missing values
any(is.na(data$councilDistrict)) # checks if any value is missing (returns TRUE or FALSE)
all(data$zipCode > 0)            # checks every value to see if it satisfies specified condition
```

Taking sums of rows and columns:

```r
colSums(is.na(data))
all(colSums(is.na(data)) == 0)
```

Values with specific characteristics:

```r
table(data$zipCode %in% c("21212"))
table(data$zipCode %in% c("21212", "21213"))
data[data$zipCode %in% c("21212", "21213"), ]
```

Cross tabs:

```r
data(UCBAdmissions)
DF = as.data.frame(UCBAdmissions)
summary(DF)

xt <- xtabs(Freq ~ Gender + Admit, data = DF)
xt
```

Flat tables:

```r
warpbreaks$replicate <- rep(1:9, len = 54)
xt <- xtabs(breaks ~ ., data = warpbreaks)
xt

ftable(xt)
```

Lastly, we can check the size of a data set:

```r
exampleData <- rnorm(1e5)
object.size(exampleData)                      # returns number of bytes
print(object.size(exampleData), units = "Mb") # returns number of megabytes
```
