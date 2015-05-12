Reading from Other Sources
==========================
Interacting more directly with files:
* `file()` opens a connection to a text file
* `url()` opens a connection to a URL
* `gzfile()` opens a connection to a .gz file
* `bzfile()` opens a connection to a .bz2 file

Type `?connections` for more information.
**Remeber to close connections!**

The following will be a summary of a few useful packages; in general, the best way to find out if 
an R package exists is to google "[data storage mechanism] R package" (i.e. "MySQL R package").

* **{foreign}** loads data from Minitab, S, SAS, SPSS, Stata, Systat, etc.
* **{RPostresSQL}** provides a DBI-compliant database connection
* **{RODBC}** provides interfaces to multiple databases like MySQL and Microsoft Access
* **{RMongo}** and **{rmongodb}** provide interfaces to MongoDB
* **{jpeg}**, **{readbitmap}**, **{png}**, and **{EBImage}** (Bioconductor) read image files
* **{rdgal}**, **{rgeos}**, and **{raster}** read GIS (geographical) data
* **{tuneR}** and **{seewave}** read musical data
