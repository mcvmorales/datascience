Creating New Variables
======================
Sometimes raw data will not have the values we are looking for. As a result, we may need to
transform the data to get such values. We canare able to add these values to the data frames
with which we are working. Common variables to create include:
* missingness indicators
* "cutting up" quantitative variables
* applying transforms

Consider the example data set, "Restaurants," from Open Baltimore.
https://data.baltimorecity.gov/Community/Restaurants/k5ry-ef3g

Recall the process of getting data from the web:

```r
if(!file.exists("./data")) {dir.create("./data")}
fileURL <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileURL, destfile = "./data/restaurants.csv", method = "curl")
data <- read.csv("./data/restaurants.csv")
```

Creating Sequences
------------------
Sometimes we need an index for our data set, so we need a sequence of numbers.
Here are some examples of how to build sequences:
```r
seq(1, 10, by = 2)       # creates a sequence from 1 to 10, skipping every other/even number
seq(1, 10, length = 3)   # creates a sequence sequence of three numbers from 1 to 10

x <- c(1, 3, 8, 25, 100) # vector x have five values
seq(along = x)           # loops over the length of x, whose length is 5.
```

Working with Variables
----------------------
Subsetting variables:
```r
data$nearMe <- data$neighborhood %in% c("Roland Park", "Homeland")
table(data$nearMe)
```

Creating binary variables:
```r
data$zipWrong <- ifelse(data$zipCode < 0, TRUE, FALSE) # returns TRUE when true, FALSE when false
table(data$zipWrong, data$zipCode < 0)
```

In our data, there is exactly one zip code less than zero. Therefore, the above code returns a `1` for `TRUE`.
This method can be used to help filter out data.

Creating categorical variables (good for looking at clusters):
```r
data$zipGroups <- cut(data$zipCode, breaks = quantile(data$zipCode))
table(data$zipGroups)

table(data$zipGroups, data$ZipCode)
```

Working with Factor Variables
-----------------------------
Creating factor variables:
```r
data$zcf <- factor(data$zipCode)
data$zcf[1:10]

class(data$zcf) # returns "factor"
```

Levels of factor variables:
```r
yesno    <- sample(c("yes", "no"), size = 10, replace = TRUE)
yesnofac <- factor(yesno, levels = c("yes", "no"))
relevel(yesnofac, ref = "yes")

as.numeric(yesnofact) # changes factors back into numeric variables; yes = 1, no = 2
```

Using {Hmisc} and {plyr}
------------------------
The **{Hmisc}** package makes cutting a little more streamlined to write compared to `cut()`.
```r
library(Hmisc)
data$zipGroups <- cut2(data$zipCode, g = 4)
table(data$zipGroups)
```

We can also use `mutate()` from **{plyr}** with **{Hmisc}**.
```r
library(Hmisc); library(plyr)
data2 <- mutate(data, zipGroups = cut2(zipCode, g = 4))
table(data2$zipGroups)
```

Common Transforms
-----------------
* `abs()`: absolute value
* `sqrt()`: square root
* `ceiling()`: ceiling value
* `floor()`: floor value
* `round(x, digits = n)`: rounding to n decimal places
* `signif(x, digits = n)`: rounding to n significant digits
* trigonometric functions, i.e. `sin()`, `cos()`, etc.
* `log()`: natural logarithm; other common logs include `log2()` and `log10()`
* `exp()`: exponentiating function


### Further Resources
{plyr} Tutorial: http://plyr.had.co.nz/09-user/  
Built-in Functions | Quick-R: http://statmethods.net/management/functions.html  
Andre Jaffe's Lecture: http://www.biostat.jhsph.edu/~ajaffe/lec_winterR/Lecture%202.pdf  
