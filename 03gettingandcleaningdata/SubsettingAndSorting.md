Subsetting and Sorting
======================
A quick review on subsetting data:

```r
> set.seed(13435)
> X <- data.frame("var1" = sample(1:5), "var2" = sample(6:10), "var3" = sample(11:15))
> X <- X[sample(1:5), ]; X$var2[c(1,3)] = NA
> X
    
   var1  var2  var3 
1     2    NA    15   
2     1    10    11   
3     3    NA    12   
4     5     6    14   
5     4     4    13   
```

We can subset our data by a specific column:

```r
> X[, 1]

[1] 2 1 3 5 4
```
    
We can subset by the name of the column as well:

```r
> X[, "var1"]
    
[1] 2 1 3 5 4
```

We can subset by both rows and columns simultaneously:

```r
> X[1:2, "var2"]
    
[1] NA 10
```

Logical Operators
-----------------
We can use logical operators (and, or) to subset data.

Suppose we want the values in "var1" less than or equal to 3 AND the values in
"var3" strictly greater than 11:

```r
> X[(X$var1 <=3 & X$var3 > 11, ]
    
   var1  var2  var3 
1     2    NA    15 
2     1    10    11 
```

Suppose we want the values in "var1" less than or equal to 3 OR the values in
"var3" strictly greater than 15:

```r
> X[(X$var1 <= 3 | X$var3 > 15), ]
    
   var1  var2  var3 
1     2    NA    15 
4     1    10    11 
2     3    NA    12
```
    
Dealing with Missing Values (NA)
--------------------------------
NA, the missing value, is not considered a number, so there are various ways to subset
NA-containing data.

```r
> X[which(X$var2 > 8), ]
    
   var1  var2  var3
4     1    10    11 
5     4     9    13
```
    
Sorting
-------
We can rearrange a subset of data in a particular order using `sort()`.

```r
> sort(X$var1)
    
    [1] 1 2 3 4 5
```

Notice in the example above, the data is listed in ascending order. One of the default arguments
for `sort()` is `decreasing = FALSE`. By setting that argument to `TRUE`, we can display
the data in descending order:

```r
> sort(X$var1, decreasing = TRUE)
    
[1] 5 4 3 2 1
```
    
We can also list NA values at a particular place:

```r
> sort(X$var2, na.last = TRUE)

[1]  6  9 10 NA NA
```
Ordering
--------
Let's order our data with preference to a particular column:

```r
> X[order(X$var1), ]
    
   var1  var2  var3
4     1    10    11 
1     2    NA    15
2     3    NA    12
5     4     9    13 
3     5     6    14
```

Notice "var1" is in ascending order as we read downward.

We can also order by multiple variables, i.e. `X[order(X$var1), order(X$var2), ]` (ordering first
by "var1", and within that ordering, doing the same with "var2").

{plyr}
------
We can perform similar operations using the **{plyr}** package.

```r
library(plyr)
arrange(X, var1)
    
arrange(X, desc(var1))
```

Adding rows and columns:

```r
X$var4 <- rnorm(5)
```

We can also use `cbind()` (column-bind) and `rbind()` (row-bind) to add rows and columns:

```r
Y <- cbind(X, rnorm(5))
```    
