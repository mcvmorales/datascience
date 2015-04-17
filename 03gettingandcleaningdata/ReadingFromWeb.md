<h1>Reading From the Web</h1>

<p>We will focus on scraping data from websites, working with APIs, and authentication.</p>

<p><strong>Web scraping</strong> is a computer software technique of extracting information from websites. Read about <a href="http://www.theatlantic.com/technology/archive/2014/01/how-netflix-reverse-engineered-hollywood/282679/">How Netflix Reverse Engineered Hollywood</a>.</p>

<h2>Getting Data Off of Webpages -- <code>readLines()</code></h2>

<p><code>R
con = url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&amp;hl=en") <br />
htmlCode = readLines(con) <br />
close(con)
</code></p>

<h2>Parsing with XML</h2>

<p><code>R
url &lt;- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ&amp;hl=en"
html &lt;- htmlTreeParse(url, useInternalNodes = T)
</code></p>

<p><code>R
xpathSApply(html, "//title", xmlValue)
</code></p>

<p><code>R
xpathSApply(html, "//td[@id='col-citedby']", xmlValue)
</code></p>

