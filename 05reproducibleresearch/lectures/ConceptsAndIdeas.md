Concepts and Ideas
==================
Replication is the ultimate standard for strengthening scientific evidence; it is particularly important in studeies that can impact broad policy or regulatory decisions. It benefits most from independent investigators, data, methods, laboratories, instruments, etc. However, some studies cannot be replicated due to time constraints, money, etc.

The idea behind reproducible research is to make analytic data and code available so that others may replicate those findings.

Why do we need reproducible research?
* New technologies increasing data collection throughput; data are more complex and high-dimensional  
* Existing databases can be merged into new "megadatabases"  
* Computing power is greatly increased, allowing formore sophisticated analyses  
* For every field , there is a computational sub-field (i.e. computational astronomy)  
* Complex statistical methods are needed and subjected to intense scrutiny

What do we need for reproducible research?
* Analytic are available (perhaps a subset or raw data)  
* Analytic code are available (i.e. modeling code with documentation)  
* Documentation of code and data  
* Standard means of distribution  

Roughly speaking, there are *authors* who want to make their research reproducible and *readers* who want to reproduce and expand upon interesting findings.

Literate (Statistical) Programming
----------------------------------
* An article is a stream of *text* and *code*  
* Analysis code is divided into text and code "chunks"  
* Literate programs can be *weaved* to produce human-readable documnets and *tangled* to produce machine-readblae documents  

We will be using **{knitr}**, which adds upon Sweave to address those limitations. It also allows documentation languages such as LaTeX, Markdown, and HTML.

Summary
-------
* Reproducible research is important as a minimum standard, particularly for studies that are difficult to replicate
* Infrastructure is needed for creating and distributing reproducible documents, beyond what is currently available
* There is a growing number of tools for creating reproducible documents

### Further Resources
[{knitr}] (http://yihui.name/knitr)
