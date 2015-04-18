Lattice Plotting System
=======================
The **{lattice}** plotting system in R is different from the **{base}** plotting system.
It is useful for plotting high-dimensional data and making many plots at once.

In the base plotting system, we are able to use functions like `mfrow()` and
`mfcol()` to create paneled plots. The lattice plotting system capitalizes on 
this idea and allows for high-density plots.

The lattice plotting system is implemented using the following packages:
* **{lattice}** contains code for producing Trellis graphics, which uses
  functions such as `xyplot`, `bwplot`, and `levelplot`
* **{grid}**, on which the **{lattice}** package builds upon

Both packages are independent of the **{base}** graphics system.
All plotting and annotation is done at once with a single function call.

Lattice Functions
-----------------
* `xyplot`: the main function for creating scatterplots
* `bwplot`: box-and-whiskers plots (or boxplots)
* `histogram`: histograms
* `stripplot`: similar to a boxplot, but with actual points
* `dotplot`: points connected by lines
* `splom`: scatterplot matrix (similar to `pairs` in **{base}**)
* `levelplot`, `contourplot`: for plotting "image" data (i.e. maps)

Lattice functions take a formula for their first argument, usually of the form:

    xyplot(y ~ x | f * g, data)
    # "I want to look at the scatterplot of y on x, for every level f and g

* `~` can be interpreted as "depends on"
* `y` represents the y-axis variable; `x` represents the x-axis variable
* `f` and `g` are optional *conditioning variables*
* `data` is the data frame from which `x`, `y`, `f`, and `g` can be found

Simple Lattice Plots
--------------------
    library(lattice)
    library(datasets)
    xyplot(Ozone ~ Wind, data = airquality)

<img src = "https://github.com/mcvmorales/datascience/blob/master/04exploratorydataanalysis/figures/xyplot1.png">

    library(lattice)
    library(datasets)
    airquality <- transform(airquality, Month = factor(Month)) # converts "Month" to factor variable
    xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5, 1))

<img src = "https://github.com/mcvmorales/datascience/blob/master/04exploratorydataanalysis/figures/xyplot2.png">

Now we can observe the ozone versus the wind, month by month!

Lattice Behavior
----------------
There are a few quirks to the **{lattice}** package:

    p <- xyplot(Ozone ~ Wind, data = airquailty) # nothing happens
    print(p) # plot is displayed

Compare this situation to the following:

    xyplot(Ozone ~ Wind, data = airquality) # plot auto-prints
    
**{lattice}** graphics functions return an object of class *trellis*; on the command line, trellis 
objects are auto-printed.

The package also contains a `panel()` function, which controls the contents 
inside each panel of the plot. For example:
    
    library(lattice)
    library(datasets)
    set.seed(10)
    x <- rnorm(100)
    f <- rep(0:1, each = 50)
    y <- x + f - f * x + rnorm(100, sd = 0.5)
    f <- factor(f, labels = c("Group 1", "Group 2"))
    xyplot (y ~ x | f, layout = c(2, 1)) # a 2 x 1 paneled plot

<img src = "https://github.com/mcvmorales/datascience/blob/master/04exploratorydataanalysis/figures/xyplot3.png">

Using the custom `panel` functions:

    xyplot(y ~ x | f, panel = function(x, y, ...) {
        panel.xyplot(x, y, ...)
        panel.abline(h = median(y), lty = 2)
    })

<img src = "https://github.com/mcvmorales/datascience/blob/master/04exploratorydataanalysis/figures/xyplot4.png">

First, we call the default panel for `xyplot`. We then add a horizontal line at the median, of line
type 2 (dashed line).

We can also add a regression line. Note that `panel.lmline(x, y)` is equivalent to `panel.abline(lm(y ~ x)).`

    xyplot(y ~ x | f, panel = function(x, y, ...) {
        panel.xyplot(x, y, ...)
        panel.lmline(x, y, col = 2)

<img src = "https://github.com/mcvmorales/datascience/blob/master/04exploratorydataanalysis/figures/xyplot5.png">

### Further Resources
[{lattice} | CRAN] (http://cran.r-project.org/web/packages/lattice/lattice.pdf)

[Line Style Arguments for R Graphics] (http://students.washington.edu/mclarkso/documents/line%20styles%20Ver2.pdf)

[Lattice Graphs | Quick R] (http://www.statmethods.net/advgraphs/trellis.html)

[Lattice: Multivariate Data Visualization with R] (http://www.springer.com/us/book/9780387759685)
