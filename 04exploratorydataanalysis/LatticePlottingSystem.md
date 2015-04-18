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

Lattice functions take a formula for their first argument, usually of the form
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
    
### Further Resources
[{lattice} | CRAN] (http://cran.r-project.org/web/packages/lattice/lattice.pdf)
[Lattice Graphs | Quick R] (http://www.statmethods.net/advgraphs/trellis.html)
[Lattice: Multivariate Data Visualization with R] (http://www.springer.com/us/book/9780387759685)
