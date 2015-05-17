Probability
===========
Given a random experiment (i.e. rolling a die) a probability measure is a population quantity that summarizes the randomness. 

Rules
-----
* The probability that nothing occurs is 0.
* The probability that something accurs is 1.
* The probability of something is 1 minus the probability that the opposite occurs
* The probability of at least one of two (or more) things that cannot simultaneously occur (mutually exclusive) is the sum of their respective probabilities.
* If event *A* implies the occurrence of event *B*, then the probability of *A* occuring is less than the probability that *B* occurs. That is, *A* is a subset of *B*.
* For any two events the probability that at least one occurs is the sum of their probabilities minus their intersection. That is, *P*(*A*∪*B*) = *P*(*A*) + *P*(*B*) - *P*(*A*∩*B*)

Probability Mass Functions
--------------------------
Probability calculus is useful for understanding the rules that probabilities must follow. Densities and mass functions for random variables are the best starting point for this.

A **random variable** (*discrete* or *continuous*) is a numerical outcome of an experiment. Examples include the (0-1) outcome of the flip of a coin, or the outcome from the roll of a die. More complex random variables would be web site traffic on a given day, the BMI of a subject four years after a baseline measurement, the hypertension status of a subject randomly drawn from a population, or intelligence quotients for a sample of children.

A **probability mass function** (PMF) evaluated at a value corresponds to the probability that a random variable takes that value. The PMF assigns probabilities to specific values for **discrete** random variables. To be a valid PMF, a function *p* must satisfy the following

1. *p* is greater than or equal to 0.  
2. The sum of the possible values that the random variable can take has to add up to 1.

Probability Density Functions
-----------------------------
A **probability density function** (PDF) assigns probabilities to specific values for **continuous** random variables. Areas under PDFs correspond to probabilities for that random variable.
To be a valid PDF, a function *p* must satisfy the following:

1. It must be larger than or equal to 0 everywhere.  
2. The total area under it must be 1.  

The PDF is a statement about the population, not the data itself. We use the data to evaluate that assumption and statements about the population probability. 

Cumulative Distribution Functions
---------------------------------
The **cumulative distribution function** (CDF) of a random variable *X* returns the probability that the random variable is less than or equal to the value *x*, whether *x* is discrete or continuous.

Quantiles
---------
Suppose we were the 95th percentile on an exam. Then 95% of those who took the exam performed worse than us, and 5% of those who took the exam performed better than us. These are sample quantiles.

A **percentile** is simply a quantile expressed as a percent; the **median** is the 50th percentile.

Conditional Probability
-----------------------
Let *B* be an event so that *P*(*B*) > 0. Then the probability of event *A*, given that *B* has occurred, is:

<img src = "http://upload.wikimedia.org/math/8/6/9/8694e4193ba45b55403595096b7d23c5.png">

**Bayes' rule** is perhaps the most well-known use of conditional probaility. Bayes' rule allows us to reverse the role of the conditioning set and the set of which we want the proability. This is useful in diagnostic tests.

<img src = "http://upload.wikimedia.org/math/d/3/c/d3c7c452b3d01f5415dd9bf15d2ab822.png">

Or:

<img src = "http://upload.wikimedia.org/math/b/d/7/bd72cf0e5abae5ef0885ace7c1f29be5.png">

Independence
------------
Event *A* is independent of event *B* if *P*(*A*|*B*) = *P*(*A*) where *P*(*B*) > 0. Similarly, *A* is independent of *B* if *P*(*A*∩*B*) = *P*(*A*)*P*(*B*). 

IID Random Variables
--------------------
Random variables are said to be **IID** if they are **independent** and **identically distributed**.
* independent: statistically unrelated from one another
* identically distributed: all having been drawn from the same population distribution

IID random variables are the default model for random samples.
