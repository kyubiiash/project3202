---
title: "Stats Project 1"
author: "Anant Joshi, Mitch, Nishant, Michael"
date: "2/11/2019"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

``` {r}
library(readr)
library(dplyr)
#Import data table
NCAA_data = read.table("~/Desktop/Stats Project 1/basketball_use.dat")

#change column names of data table
names(NCAA_data) = c("year", "school_win", "score_win", "school_loose", "score_loose")

#create 2 new columns of the total score and difference of scores
NCAA_data$total_score = NCAA_data$score_win + NCAA_data$score_loose
NCAA_data$difference_score = NCAA_data$score_win - NCAA_data$score_loose
```

``` {r}

#make histogram of total amount score 
hist(NCAA_data$total_score, breaks = 100)

mean(NCAA_data$total_score)
sd(NCAA_data$total_score)

#make histogram of the difference in scores 
hist(NCAA_data$difference_score, breaks = 100)

mean(NCAA_data$difference_score)
sd(NCAA_data$difference_score)
median(NCAA_data$difference_score)
```

``` {r}
#fit normal curve onto histogram onto toal score
hist(NCAA_data$total_score, breaks = 100, probability = TRUE)
box()
grid()
curve(dnorm(x, mean = mean(NCAA_data$total_score), sd = sd(NCAA_data$total_score)),
      add=TRUE, col = 'dark orange', lwd =2)

#determine normal qqplot
qqplot(x = qnorm(ppoints(NCAA_data$total_score), 
                 mean = mean(NCAA_data$total_score), sd = sd(NCAA_data$total_score)),
       y = NCAA_data$total_score,
       xlim = c(50,250), ylim = c(50,250),
       main = "QQ-Plot: Percent of Deep Sleep, Beta Distribution",
       xlab = "Theoretical Quantiles, Beta Distribution",
       ylab = "Sample Quantiles, Percent of Deep Sleep")
abline(a = 0, b = 1, col = "dodgerblue", lwd = 2)
grid()
```

```{r}
#obtain histogram of difference in scores and fit an exponential distribution
hist(NCAA_data$difference_score, breaks = 100, probability = TRUE)
box()
grid()
curve(dexp(x, rate = (1/mean(NCAA_data$difference_score))),
      add=TRUE, col = 'dark orange', lwd =2)

#obtain qqplot of difference in scores
qqplot(x = qnorm(ppoints(NCAA_data$difference_score), 
                 mean = mean(NCAA_data$difference_score), sd = sd(NCAA_data$difference_score)),
       y = NCAA_data$difference_score,
       xlim = c(0,50), ylim = c(0,50),
       main = "QQ-Plot: Percent of Deep Sleep, Beta Distribution",
       xlab = "Theoretical Quantiles, Beta Distribution",
       ylab = "Sample Quantiles, Percent of Deep Sleep")
abline(a = 0, b = 1, col = "dodgerblue", lwd = 2)
grid()
```

```{r}
xbar = mean(NCAA_data$difference_score)
sampleVar = var(NCAA_data$difference_score)
#Obtain alpha estimate from method of moments estimation
alphaMOM = xbar * ((xbar * (1 - xbar) / sampleVar) -1)
alphaMOM

#Obtain beta estimate from method of moments estimation
betaMOM = (1 - xbar) * ((xbar*(1 - xbar) / sampleVar) -1)
betaMOM


#obtain histogram of difference in scores and fit an exponential distribution
hist(NCAA_data$difference_score, breaks = 100, probability = TRUE)
box()
grid()
curve(dbeta(x, shape1 = alphaMOM, shape2 = betaMOM,ncp = 0),
      add=TRUE, col = 'dark orange', lwd =2)

#obtain qqplot of difference in scores
qqplot(x = qnorm(ppoints(NCAA_data$difference_score), 
                 mean = mean(NCAA_data$difference_score), sd = sd(NCAA_data$difference_score)),
       y = NCAA_data$difference_score,
       xlim = c(0,50), ylim = c(0,50),
       main = "QQ-Plot: Percent of Deep Sleep, Beta Distribution",
       xlab = "Theoretical Quantiles, Beta Distribution",
       ylab = "Sample Quantiles, Percent of Deep Sleep")
abline(a = 0, b = 1, col = "dodgerblue", lwd = 2)
grid()
```
