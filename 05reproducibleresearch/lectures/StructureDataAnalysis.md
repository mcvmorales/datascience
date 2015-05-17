Structure of a Data Analysis
============================
1.  Define the question  
2.  Define the ideal data set  
3.  Determine what data is accessible  
4.  Obtain the data  
5.  Clean the data  
6.  Exploratory data analysis  
7.  Statistical prediction and modeling  
8.  Interpret results  
9.  Challenge results  
10. Synthesize (write up) results
11. Create reproducible code

Define the Question
-------------------
Start with a general question, then make it concrete:
* General: "Can I automatically detect emails that are SPAM?"  
* Concrete: "Can I use quantitative characteristics of the emails themselves to classify them as SPAM?"

Define the Ideal Data Set
-------------------------
The data set depends on the goal:
* Descriptive: a whole population  
* Exploratory: a random sample with many variables measured  
* Inferential: the right population, randomly sampled  
* Predictive: a training and test data set from the same population  
* Causal: data from a randomized study  
* Mechanistic: data about all components of the system

Determine What Data is Accessible
---------------------------------
Sometimes data is available for free on the web; otherwise, the data may need to be purchased. In either case, respect the terms of use. If the data does not exist, however, we may need to generate it ourselves.

Obtain the Data
---------------
* Try to obtain the raw data  
* Be sure to reference the source  
* Polite emails go a long way  
* When loading the data from an internet source, record the URL and time accessed

Clean the Data
--------------
* Raw data often needs to be processed  
 * If the data is pre-procesesd, understand how it was pre-processed  
* Understand the source of the data (census, sample, etc.)  
* May need reformatting, subsampling, etc.; make sure to record these steps
* Determine if the data are good enough!

Exploratory Data Analysis
-------------------------
Subsample the data set; generate a test and training set (prediction).
* Look at summaries of the data  
* Check for missing data  
* Create exploratory plots  
* Perform exploratory analyses (i.e. clustering)

```r
library(kernlab)
data(spam)

# Perform the subsampling
set.seed(3435) 
trainIndicator <- rbinom(4601, size = 1, prob = 0.5)
table(trainIndicator)

trainSpam <- spam[trainIndicator == 1, ]
testSpam  <- spam[trainIndicator == 0, ]

names(trainSpam)
head(trainSpam)   # frequency counts
table(trainSpam)

plot(trainSpam$capitalAve ~ trainSpam$type)
plot(log10(trainSpam$capitalAve + 1) ~ trainSpam$type)
plot(log10(trainSpam[, 1:4] + 1))

hCluster <- hclust(dist(t(trainSpam[m 1:57])))
plot(hCluster)

hClusterUpdated <- hclust(dist(t(log10(trainSpam[, 1:55] +1))))
plot(hClusterUpdated)
```

Statistical Prediction and Modeling
-----------------------------------
* Should be informed by the results of the exploratory analysis  
* Exact methods depend on question of interest  
* Transformations and processing should be accounted for when necessary  
* Measures of uncertainty should be reported

```r
trainSpam$numType <- as.numeric(trainSpam$Type) - 1
costFunction <- function(x, y) sum(x != (y > 0.5))
cvError <- rep(NA, 55)

library(boot)
for (i in 1:55) {
    lmFormula <- reformulate(names(trainSpam)[i], response = "numType"
    glmFit    <- glm(lmFormula, family = "binomial", data = trainSpam)
    cvError[i]<- cv.glm(trainSpam, glmFit, costFunction, 2)$delta[2]
}

# Which predictor has minimum cross-validated error?
names(trainSpam)[which.min(cvError)
``` 

Get a measure of uncertainty:
```r
# Use the best model from the group
predictionModel <- glm(numType ~ charDollar, family = "binomial", data = trainSpam)

# Get predictions on the test set
predictionTest <- predict(predictionModel, testSpam)
predictedSpam  <- rep("nonspam", dim(testSpam)[1])

# Classify as 'spam' for those with prob > 0.5
predictedSpam[predictionModel$fitted > 0.5] = "spam"

# Classification table
table(predictedSpam, testSpam$type)
```

Interpret Results
-----------------
Use the appropriate language.
* describes
* correlates with/associated with
* leads to/causes
* predicts

Give an explanation. Also, interpret coefficients and measures of uncertainty.

Challenge Results
-----------------
Challenge all steps:
* question
* data source
* processing
* analysis
* conclusions

Challenge the measures of uncertainty. Challenge choices of terms to include in models. Think of potential alternative analyses.

Synthesize (Write Up) Results
-----------------------------
* Lead with the question
* Summarize the analyses into the story
* Don't include every analysis unless needed for the story or for addressing a challenge
* Order analyses according to the story, rather than chronologically
* Include "pretty" figures that contribute to the story

For example:  
Lead with the question
 * "Can I use quantitative characteristics of the emails to classify them as SPAM (or HAM)?"  

Describe the approach
 * Collected data from UCI, subsetting into training and test sets
 * Explored relationships
 * Chose logistic model on training set by cross validation
 * Applied to test with 78% test set accuracy  

Interpret results
 * Number of dollar signs seems reasonable, i.e. "Make money with ___ $$$!" 

Challenge results
 * 78% is not very high
 * More variables could be used
 * Why use logistic regression?
 
Create Reproducible Code
------------------------
We must make sure to document the analysis as we go, to preserve the code and any summaries. Use packages such as **{knitr}** and **{rmarkdown}**.

### Further Resources
[{kernlab}] (http://search.r-project.org/library/kernlab/html/spam.html)
