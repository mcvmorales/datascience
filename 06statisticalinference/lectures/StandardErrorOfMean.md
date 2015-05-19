Standard Error of the Mean
==========================
We call the standard deviation of a statistic a **standard error**.

*S*, The **standard deviation** describes how variable the population is.

The **standard error** describes how variable averages of random samples of size *n* from the population are.

<img src = "http://upload.wikimedia.org/math/b/b/2/bb234d9a63401082dbd197c430fd35c9.png">

Simulation Example
------------------
Standard normals have a variance of 1. Thus, the means of *n* standard normals have standard deviation 1 divded by the square root of *n*.

```r
nosim <- 1000
n <- 10
sd(apply(matrix(rnorm(nosim * n), nosim), 1, mean)
```
