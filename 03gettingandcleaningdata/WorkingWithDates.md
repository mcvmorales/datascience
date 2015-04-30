Working with Dates
==================
* `date()` returns a `character` of the form `Day, Mon DD HH:MM: YYYY`.
* `Sys.Date()` returns a `date` of the form `YYYY-MM-DD`.

Formatting Dates
----------------
* Days: 
  * `%d` = numbered day (0-31)
  * `%a` = abbreviated day
  * `%A` = unabbreviated day
* Months:
  * `%m` = numbered month (00-12)
  * `%b` = abbreviated month
  * `%B`unabbreviated month
* Years:
  * `%y` = two-digit year
  * `%Y` = four-digit year

```r
> today <- Sys.Date()
> today
[1] "2015-04-30"

> format(today, "%a %b %d")
[1] "Thu Apr 30"
```

Creating Dates
--------------
```r
> x <- c("1jan1960", "2jan1960", "31mar1960", "30jul1960")
> z <- as.Date(x, "%d%b%Y")
> z
[1] "1960-01-01"  "1960-01-02"  "-1960-03-31"  "1960-07-30"
```

We can also observe the time difference between two dates:
```r
z[1] - z[2]
as.numeric(z[1] - z[2])
```

Other functions include:
* `weekdays()`
* `months()`
* `julian()`, the number of days since the origin, 1970-01-01.

The **{lubridate}** package makes manipulating dates and times much easier.

### Further Resources
[{lubridate} | CRAN] (http://cran.r-project.org/web/packages/lubridate/lubridate.pdf)

