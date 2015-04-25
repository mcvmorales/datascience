Merging Data
============
Sometimes we want to merge multiple datasets together based on an ID. This is not unlike having a linked set of tables and a database like MySQL.

Consider the data set from "Cooperation between Referees and Authors Increases Peer Review Accuracy."
http://www.plosone.org/article/info:doi/10.1371/journal.pone.0026895

```r
if(!file.exists("./data")) {dir.create("./data")}
fileURL1 <- "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileURL2 <- "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file(fileURL1, destfile = "./data/reviews.csv", method = "curl")
download.file(fileURL2, destfile = "./data/solutions.csv", method = "curl")

revs <- read.csv("./data/reviews.csv")
sols <- read.csv("./data/solutions.csv")
```

Both data sets `revs` and `sols` have various ID variables which correspond with one another.

Merging Data with `merge()`
---------------------------
Some important parameters: `x`, `y`, `by`, `by.x`, `by.y`, `all`.
```r
names(revs) # "id" "solution_id" "review_id" "start" "stop" "time_left" "accept"
names(sols) # "id" "problem_id" "subject_id" "start" "stop" "time_left" "answer"

mergedData <- merge(revs, sols, by.x = "solution_id", by.y = "id", all = TRUE)
```

The default is to merge all common column names. We can check which column names are common, use `intersect()`.
```r
intersect(names(sols), names(revs)) # "id" "start" "stop" "time_left"
```

If we try to merge without any specific arguments, R will attempt to merge the two data sets based on the intersecting variables.

Merging Data with {plyr}
------------------------
We can also use `join()` from the **{plyr}** package; it is faster than `merge()`, but also has less features. The default is to left join; check the help file for more information.
```r
library(plyr)

df1 <- data.frame(id = sample(1:10), x = rnorm(10))
df2 <- data.frame(id = sample(1:10), y = rnorm(10))
arrange(join(df1, df2), id) # arranges the joined data sets by id in increasing order
```

**{plyr}** is must better at joining multiple data frames. Use `join_all()`.
```r
df1 <- data.frame(id = sample(1:10), x = rnorm(10))
df2 <- data.frame(id = sample(1:10), y = rnorm(10))
df3 <- data.frame(id = sample(1:10), z = rnorm(10))
DFs <- list(df1, df2, df3)
join_all(DFs)
```

### Further Resources
[Merging Data | Quick-R] (http://statmethods.net/management/merging.html)  
[{plyr}] (http://plyr.had.co.nz/)
[Join (SQL)] (http://en.wikipedia.org/wiki/Join_%28SQL%29)
