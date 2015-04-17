Reading from the Web
====================
We will focus on scraping data from websites, working with APIs, and authentication.

**Web scraping** is a computer software technique of extracting information from websites. Read about [How Netflix Reverse Engineered Hollywood](http://www.theatlantic.com/technology/archive/2014/01/how-netflix-reverse-engineered-hollywood/282679/).

Getting Data from Webpages -- `readLines()`
---------------------------------------------
    con = url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")  
    htmlCode = readLines(con)  
    close(con)

Parsing with XML
----------------
    url <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
    html <- htmlTreeParse(url, useInternalNodes = T)

    xpathSApply(html, "//title", xmlValue)

    xpathSApply(html, "//td[@id='col-citedby']", xmlValue)

`GET` from {httr}
-------------------
    library(httr); html2 = GET(url)
    content2 = content(html2, as = "text")
    parsedHTML = htmlParse(content2, asText = TRUE)
    xpathSApply(parsedHTML, "//title", xmlValue)

Accessing Websites with Passwords
---------------------------------
    pg1 = GET("http://httpbin.org/basic-auth/user/passwd")
    pg1

Since we did not specify a username and password, we are returned the following message:

    Response [http://httpbin.org/basic-auth/user/passwd]
      Status: 401
      Content-type:

To access a website that requires a username and password, use `authenticate()`.

    pg2 = GET("http://httpbin.org/basic-auth/user/passwd"),
	          authenticate("user", "password"))
    pg2

Our successful response is as follows:
    Response [http://httpbin.org/basic-auth/user/passwd]
      Status: 200
      Content-type: application/ json
    {
      "authenticated": true,
      "user": "user"
    }

Using Handles
-------------
We should use handles to use across authentication processes (through cookies). For example:

    google = handle("http://www.google.com")
    pg1 = GET(handle = google, path = "/")
    pg2 = GET(handle = google, path = "search")
    
Further Resources
-----------------
**{httr}** package: http://cran.r-project.org/web/packages/httr/httr.pdf  
**R Bloggers** | Web scraping: http://www.r-bloggers.com/search/web+scraping
