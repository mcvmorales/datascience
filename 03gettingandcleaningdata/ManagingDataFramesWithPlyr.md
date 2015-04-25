Managing Data Frames with {dplyr}
=================================
Developed by Hadley Wickham of RStudio, **{dplyr}** is  an optimized and distilled version of the **{plyr}** package.
While it doesn't provide any "new" functionality, it greatly simplifies existing functionality in R. It provides a 
"grammar" (particularly verbs, like those listed below) for data manipulation.
It is very fast, as many key operations are coded in C++.

* `select()` returns a subset of the columns of a data frame
* `filter()` extracts a subset of rows from a data frame based on logical conditions
* `arrange()` reorders rows of a data fram
* `rename()` renames variables in a data frame
* `mutate()` adds new variables and/or colums, or transforms existing variables
* `summarize()` generates summary statistics with different variables in the data frame

Properties
----------
The functions in **{dplyr}** all have a similar format.
* The first argument is always the data frame
* The subsequent arguments describe what to do with it
* Subsetting does not require the `$` operator -- simply use the names
* The new result is a new data frame
* Data frames must be properly formatted and annotated for this to all be useful

Consider the data set on air pollution and weather variables in Chicago, Illinois from 1987-2005:
https://github.com/DataScienceSpecialization/courses/blob/master/03_GettingData/dplyr/chicago.rds.
```r
library(dplyr)
chicago <- readRDS("./chicago.rds") 

str(chicago)   # data frame, 6940 observations, 8 variables
names(chicago) # "city" "tmpd" "dptp" "date" "pm25tmean2" "pm10tmean2" "03tmean2" "no2tmean2"
```

Using `select()`
----------------
Observe how efficient it is for `select()` to display specified columns by using `:`.

```r
head(select(chicago, city:dptp)     # includes only columns "city," "tmpd," and "dptp"
head(select(chicago, -(city:dptp))) # includes all but columns "city," "tmpd," and "dptp"
```

In the basic R language, we would have had to say:
```r
i <- match("city", names(chicago))
j <- match("dptp", names(chicago))
head(chicago[, -(i:j)])
```

Using `filter()`
----------------
```r
filter(chicago, pm25tmean2 > 30)             # shows only observations where pm25tmean2 > 30
filter(chicago, pm25tmean2 > 30 & tmpd > 80) # shows only observations where pm25tmean2 > 30 AND tmpd > 80
```

Using `arrange()`
-----------------
```r
chicago <- arrange(chicago, date)       # arranges the data by date in ascending order (1987-01-01 first)
chicago <- arrange(chicago, desc(date)) # arranges the data by date in descending order (2005-12-31 first)
```

Using `rename()`
----------------
We will rename variables in our data frame, which surprisingly is a convoluted process in the
basic R language.
```r
chicago <- rename(chicago, pm25 = pm25tmean2, dewpoint = dptp)
```

Notice the format in the above arguments: `newname = oldname`

Using `mutate()`
----------------
Let us create a new variable called `pm25detrend`.
Let `pm25detrend` be `pm25` but with the mean subtracted off.
```r
chicago <- mutate(chicago, pm25detrend = pm25 - mean(pm25, na.rm = TRUE))
head(select(chicago, pm25, pm25detrend))
```

Using `group_by()`
------------------
Let us create a new variable called 'tempcat'.
Let 'tempcat' be a temperature category variable indicating whether a given day was hot or cold
(whether the temperature was above or below 80°F).
```r
chicago <- mutate(chicago, tempcat = factor(1 * (tmpd > 80), labels = c("cold", "hot")))
hotcold <- group_by(chicago, tempcat)
```

Using `summarize()`
-------------------
Now that we have split our data into two categories, "hot" and "cold," suppose we want to summarize
that data into the means of `pm25`, the max ozone `o3`, and the median nitrogen dioxide `no2`.
```r
summarize(hotcold, pm25 = mean(pm25, na.rm = TRUE), o3 - max(o3tmean2, no2 = median(no2tmean2)
```

Let us find summaries by year. First, we must create a variable for the year.
```r
chicago <- mutate(chicago, year = as.POSIXlt(date)$year + 1900)
years <- group_by(chicago, year)
summarize(years, pm25 = mean(pm25, na.rm = TRUE), max(o3tmean2, no2 = median(no2tmean2))
```

Chaining Different Operations with `%>%`
----------------------------------------
The **{dplyr}** package implements a special operator `%>%` allowing for "chaining" of different operations. The idea is that we take a data set and send it through the "pipeline" of operations to create a new data set.

Suppose we want to create a month variable (so we can create summaries of each pollutant variable by month)
```r
chicago %>% mutate(month - as.POSIXlt(date)$mon +1)
        %>% group_by(month)
        %>% summarize(pm25 = mean(pm25, na.rm = TRUE), o3 = max(o3tmean2), no2 = median(not2mean2))
```

Other Benefits of {dplyr}
-------------------------
* Works with other data frame "backends"
* `data.table` for large fast tables
* SQL interface for relational databases via the **{DBI}** package
