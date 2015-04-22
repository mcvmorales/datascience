{ggplot2}
=========
* Written by Hadley Wickham
* Implementation of *Grammer and Graphics* by Leland Wilkinson
* Considered a "third" graphics system for R
  (along with **{base}** and **{lattice}**)
  
"In brief, the gramar tells us that a statistical graphic is a mpping 
from data to aesthetic attributes (color, shape, size) of geometric 
objects (points, lines, bars). The plot may also contain statistical transformations 
of the data and is drawn on a specific coordinate system."

Plotting with `qplot()` and `ggplot()`
--------------------------------------
Not unlike `plot()` in **{base}**, `qplot()` looks for data in a data fram.
Plots are made up of *aesthetics* (i.e. size, shape, color, etc.) and *geoms*, like 
(i.e. points, lines, bars, etc.). However, `ggplot()` is the core function; it has 
more capabilities than `qplot()`.

Factors are important for indicating subsets of the data -- they should be labelled
something descriptive/informative.

    library(ggplot2)
    str(mpg)
    
We should have a data frame of 234 observations with 11 variables.

    # qplot(x-coord, y-coord, dataframe)
    qplot(displ, hwy, data = mpg)

<img src = "https://github.com/mcvmorales/datascience/blob/master/04exploratorydataanalysis/figures/ggplot1.png">

Let's modify the aesthetics. Since our data has factors (four-wheel, rear-wheel, and front-wheel drive),
we can include that information using a color code and legend that is created by the function automatically.

    qplot(displ, hwy, data = mpg, color = drv)

<img src = "https://github.com/mcvmorales/datascience/blob/master/04exploratorydataanalysis/figures/ggplot2.png">

Adding a geom:
    
    qplot(displ, hwy, data = mpg, geom = c("point", "smooth"))
    
<img src = "https://github.com/mcvmorales/datascience/blob/master/04exploratorydataanalysis/figures/ggplot3.png">

We may also make histograms with `qplot()`.

    qplot(hwy, data = mpg, fill = drv)

<img src = "https://github.com/mcvmorales/datascience/blob/master/04exploratorydataanalysis/figures/ggplot4.png">

Facets, which are similar to panels in **{lattice}**, help to look at subsets in the data.
Whatever is left of the `~` defines the rows; whatever is right of the `~` defines the columns.
Observe:

    qplot(displ, hwy, data = mpg, facets = . ~ drv)
    
<img src = "https://github.com/mcvmorales/datascience/blob/master/04exploratorydataanalysis/figures/ggplot5.png">

    qplot(hwy, data = mpg, facets = drv ~ ., binwidth = 2)

<img src = "https://github.com/mcvmorales/datascience/blob/master/04exploratorydataanalysis/figures/ggplot6.png">

### Further Resources
http://www.ggplot2.com

[Mouse Allergen and Ashthma Cohort Study (MAACS)] (http://goo.gl/WqE9j8)
