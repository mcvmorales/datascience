Reshaping Data
==============
Our ultimate goal in this course is to have a tidy data set, where:  
1. each variable forms a column  
2. each observation forms a row  
3. each table/file stores data about one kind of observation

We will use the **{reshape2}** package on the `mtcars` data set.
```r
library(reshape2)
head(mtcars)
```

Restructuring Data Frames
-------------------------
We can manipulate and reshape data using `melt()` from the **{reshape2}** package.
```r
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars, id = c("carname", "gear", "cyl"), measure.vars = c("mpg", "hp"))

head(carMelt, n = 3)
tail(carMelt, n = 3)
```

Now that the data is melted, we can recast (reform) the data set into a different shape using `dcast()`.
```r
cylData <- dcast(carMelt, cyl ~ variable)       # creates a summary of observations/measures
cylData <- dcast(carMelt, cyl ~ variable, mean) # calculating mean for variables mpg, hp
```

Split-Apply-Combine Functions
-----------------------------
Averaging Values using `tapply()`:
```r
head(InsectSprays)
tapply(InsectSprays$count, InsectSprays$spray, sum) # sums up counts for sprays A through F
```

Using `split()`:
```r
sprCount <- lapply(spIns, sum) # returns a list
unlist(sprCount)
sapply(spIns, sum)             # returns a matrix
```

The **{plyr}** package can come in handy, as well, allowing to perform a task in one step.
```r
ddply(InsectSprays, .(spray), summarize, sum = sum(count))
```

**{plyr}** also allows us to create new variables.
```r
spraySums <- ddply(InsectSprays, .(spray), summarize, sum = ave(count, FUN = sum))

dim(spraySums)
head(spraySums)
```

Other Functions
---------------
* `acast()` for casting multi-dimensional arrays
* `arrange()` for faster reordering without using `order()` commands
* `mutate()` for adding new variables

### Further Resources
[Tidy Data | Hadley ] (http://vita.had.co.nz/papers/tidy-data.pdf)  
[{melt} | CRAN] (http://cran.r-project.org/web/packages/reshape2/reshape2.pdf)  
[A Quick Primer on Split-Apply-Combine Problems | R-Bloggers] (http://www.r-bloggers.com/a-quick-primer-on-split-apply-combine-problems/)  
[Reshaping Data in R | Jeffrey Breen] (http://www.slideshare.net/jeffreybreen/reshaping-data-in-r)
