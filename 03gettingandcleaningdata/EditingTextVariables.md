Editing Text Variables
======================
Sometimes we need to programmatically manipulate text in our data to make it easier to read. We will illustrate our problem with the help of Baltimore camera data.

```
if(!file.exists("./data)) {dir.create("./data")}
fileURL <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileURL, destfile = "./data/cameras.csv", method = "curl")
cameraDate <- read.csv("./data/cameras.csv")
```
Fixing Character Vectors -- `tolower()`, `toupper()`
----------------------------------------------------
```r
> names(cameraData)
[1] "address"  "direction"  "street"  "crossStreet"  "intersection"  "Location.1"

> tolower(names(cameraData))
[1] "address"  "direction"  "street"  "crossstreet"  "intersection"  "location.1"

> toupper(names(cameraData))
[1] "ADDRESS"  "DIRECTION"  "STREET"  "CROSSSTREET"  "INTERSECTION"  "LOCATION.1"
```

Fixing character vectors
------------------------
We can automatically split variable names using `strsplit()`.
```r
> names(cameraData)
[1] "address"  "direction"  "street"  "crossStreet"  "intersection"  "Location.1"

> splitNames <- strsplit(names(cameraData), "\\.") 
  # use \\ (escape character) since . is a reserve character
> splitNames[[5]]
[1] "intersection"

> splitNames[[6]]
[1] "Location" "1"
```

Say we want to use only the variable name before the `.`. We can use `sapply()`.  
For example, say we want `Location` instead of `Location.1`:
```r
> splitNames[[6]][1]
[1] "Location"

> firstElement <- function(x) {x[1]}
> sapply(splitNames, firstElement)
[1] "address"  "direction"  "street"  "crossStreet"  "intersection"  "Location"
```

Suppose we want to substitute out characters, i.e. removing an underscore `_` and deleting that space.
```r
> names(reviews)
[1] "id"  "solution_id"  "reviewer_id"  "start"  "stop"  "time_left"  "accept"

> sub("_", "", names(reviews), )
[1] "id"  "solutionid"  "reviewerid"  "start"  "stop"  "timeleft"  "accept"
```

We can also use `sub()` and/or `gsub()`.
```r
> testName <- "this_is_a_test"
> sub("_", "", testName)  # replaces only the first _
[1] "thisis_a_test"

> sub("_", "", testName)  # replaces all _
[1] "thisisatest"
```

Finding Values -- `grep()`, `grepl()`
-------------------------------------
Going back to the Baltimore City camera data, suppose we want to look at all the intersections including "Alameda" as one of the roads.
```r
grep("Alameda", cameraData$intersection)                # returns numbered locations within "intersection"
table(grepl("Alameda", cameraData$intersection))        # returns numbers of true/false values
grep("Alameda", cameraData$intersection, value = TRUE)  # returns actual values where "Alameda" appears
```

More Useful String Functions
----------------------------
```r
library(stringer)

nchar("Mario Luigi")          # counts number of characters; in this case, the function would return "11."
substr("Mario Luigi", 7, 11)  # returns 7th through 11th letters: "Luigi"
paste("Mario", "Luigi")       # returns "Mario Luigi" with space included
paste0("Mario", "Luigi")      # "MarioLuigi"
str_trim("Mario     ")        # returns "Mario"
