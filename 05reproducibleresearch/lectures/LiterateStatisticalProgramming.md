Literate Statistical Programming with {knitr}
=============================================
* Original idea comes from Don Knuth
* An article is a stream of **text** and **code**
* Analysis code is divided into text and code "chunks"
* Presentation code formats results (tables, figures, etc.)
* Article text explains the process and what's going on
* Literate programs are **weaved** to produce human-readable documents and **tangled** to produce machine-readable documents

How to Make Reproducible Work
-----------------------------
* Keep track of everything, ideally with a version control system to track snapshots and changes
* Use software whose operation can be coded
* Do not save the output
* Save data in non-proprietary formats

Pros and Cons
-------------
Pros:
* Text and code all in one place, in logical order  
* Data, results automatically update to reflect external changes  
* Code is live; that is, it is tested when the document is built

Cons:
* If there is a lot of code, it can make the document difficult to read  
* Can substantially slow down processing of documents (though there are tools available for this)

{knitr}
-------
Written by Yihui Xie, **{knitr}** is a package (available on CRAN) that supports RMarkdown, LaTeX, and HTML as documentation languages. It can export documents in both PDF and HTML formats. RStudio already has this package built in.

**{knitr}** is great for manuals, short/medium-length technical documents, tutorials, periodic reports, and data preprocessing documents/summaries. It is not, however, ideal for very long research articles, copmlex time-consuming computations, or documents that require precise-formatting.

Since we are using RStudio, creating an R Markdown file and knitting it to HTML is easy. Otherwise, the manual process is as follows:

```r
library(knitr)
setwd(<working directory>)
knit2html("document.Rmd")
browseURL("document.html")
```

Reminder: do **not** edit the resulting .md and .html files.

Remember to begin and end code chunks in the following way:

    ```{r}
    # Insert R code here
    ```

They can also have names, which is useful for making graphics:

    ```{r firstchunk}
    # Insert R code here
    ```

When a code in a code chunk is echoed, the computation will display; otherwise, use the option `echo = FALSE` in the `{r}` tag of the code chunk. If for some reason we do not want to display the results of some computation, we can may say `results = hide`.

Inline text computations can be performed using the backtick (`).

We can also incorporate graphics in the following way:

    Let us first simulate some data.
    ```{r simulatedata, echo = TRUE}
    x <- rnorm(100); y <- x + rnorm(100, sd = 0.5)
    ```
    Here is a scatterplot of the data.
    ```{r scatterplot, fig.height = 4}
    par(mar = c(5, 4, 1, 1,), las = 1)
    plot(x, y, main = "My Simulated Data")
    ```
    
Another useful package is **{xtable}**, also available on CRAN.

    ```{r fitmodel}
    library(datasets)
    data(airquality)
    fit <- lm(Ozone ~ Wind + Temp + Solar.R, data = airquality)
    ```
    Here is a table of regression coefficients.
    ```{r showtable, results = "asis"}
    library(xtable)
    xt <- xtable(summary(fit))
    print(xt, type = "html")
    ```
    
We can set global options for all code chunks.

    ```{r setoptions, echo = FALSE}
    opts_chunk$set(echo = FALSE, results = "hide")
    ```
    
We can cache computations (code chunks); use the `cache = TRUE` option on a chunk-by-chunk basis to store results of computation. After the first run, results are loaded from the cache. Obviously if the data, code, or anything external changes, the cached code chunks need to be re-run.

### Further Resources
[{knitr} | CRAN] (http://cran.r-project.org/web/packages/knitr/knitr.pdf)
