---
title: "Essential Statistics Homework"
author: "Marieke K Jones, PhD"
date: '2019-01-04'
output:
  html_document:
    keep_md: yes
---



(_Refer back to the Essential Statistics lesson if needed)._

## Key Concepts

> 
- Descriptive statistics
- Hypothesis testing
- Choosing the correct test
- Assumptions
- Cross tabulation
- Interpreting ANOVA and LM output


The dataset we'll be using for this assignment is both curated and hosted by the [Vanderbilt Department of Biostatistics](http://biostat.mc.vanderbilt.edu/wiki/Main/DataSets). Download and read in the **stressEcho.csv** dataset.

## Stress Tests

Dobutamine is a drug that is used during echocardiograms (aka "stress tests"), which are clinical tests used to estimate heart function. The treatment causes heart rate to increase, and its effects at different dosages were measured in a [study published in 1999](https://www.ncbi.nlm.nih.gov/pubmed/10080472). We'll be using the data behind this paper to answer the questions that follow. 


```
## # A tibble: 558 x 32
##       X1   bhr basebp basedp  pkhr   sbp    dp  dose maxhr pctMphr   mbp
##    <int> <int>  <int>  <int> <int> <int> <int> <int> <int>   <int> <int>
##  1     1    92    103   9476   114    86  9804    40   100      74   121
##  2     2    62    139   8618   120   158 18960    40   120      82   158
##  3     3    62    139   8618   120   157 18840    40   120      82   157
##  4     4    93    118  10974   118   105 12390    30   118      72   105
##  5     5    89    103   9167   129   173 22317    40   129      69   176
##  6     6    58    100   5800   123   140 17220    40   123      83   140
##  7     7    63    120   7560    98   130 12740    40    98      71   130
##  8     8    86    161  13846   144   157 22608    40   144     111   157
##  9     9    69    143   9867   115   118 13570    40   113      81   151
## 10    10    76    105   7980   126   125 15750    40   126      94   125
## # ... with 548 more rows, and 21 more variables: dpmaxdo <int>,
## #   dobdose <int>, age <int>, gender <chr>, baseEF <int>, dobEF <int>,
## #   chestpain <int>, restwma <int>, posSE <int>, newMI <int>,
## #   newPTCA <int>, newCABG <int>, death <int>, hxofHT <int>, hxofDM <int>,
## #   hxofCig <chr>, hxofMI <int>, hxofPTCA <int>, hxofCABG <int>,
## #   any.event <int>, ecg <chr>
```


Note that in addition to measuring dobutamine dosages during each stress test, the authors collected information on other variables including: resting heart rate, max heart rate, blood pressure, age, and (most importantly) whether or not the patient experienced any cardiac event in the 12 months that followed the test.

*Before answering the questions, make sure to review the data dictionary*: 

http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/stressEcho.html

*Note that the data were originally coded by the authors of the study but were then partially recoded when curated. Pay particular attention to the `any.event` variable (did the subject experience any cardiac event over 12 months following the stress test), which should be interpeted as 0=NO, 1=YES. The top of the data dicionary makes it clear that all event variables are now coded such that 0=NO and 1=YES, which is more conventional.*

## 1. How many people had a cariac event over 12 months following the stress test? What percentage is that?


```
## 
##   0   1 
## 469  89
```

```
## [1] 0.1594982
```

## 2. What is the highest double product on the maximum dose of Dobutamine (`dpmaxdo`)?


```
## [1] 45114
```

## 3. What is the cutoff for the 99th percentile for the highest double product on the maximum dose of Dobutamine (`dpmaxdo`)? 

**HINT**: The `quantile()` function defaults to 0, 0.25, .5, .75 and 1 but can accept arbitrary threshholds. See `?quantile` and look for the `probs` argument.


```
##      99% 
## 31948.56
```

## 4. Use **ggplot2** to create density plots showing the distribution of the `dpmaxdo` values filled in by whether the person experienced any cardiac event in the past 12 months (`any.event`).

![](EssentialStats_HW_files/figure-html/unnamed-chunk-5-1.png)<!-- -->

## 5. The plot above indicates that the distributions are approximately normal, with the except of a few outliers in the right tail. With the normality assumption satisfied, perform a two sample t-test to compare the mean double product max values between those who did or did not experience any cardiac event (`any.event`). Assume equal variances between these groups.


```
## 
## 	Two Sample t-test
## 
## data:  dpmaxdo by any.event
## t = 2.0707, df = 556, p-value = 0.03885
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##    60.12983 2279.88469
## sample estimates:
## mean in group 0 mean in group 1 
##        18736.49        17566.48
```

## 6. Interpret the output from the test above taking into account what the authors concluded. What questions do you have about their results compared to yours?

## 7. The smoking history column (`hxofCig`) is represented categorically as "heavy", "moderate" and "non-smoker". Create a table showing the frequency of individuals in each smoking history category, for all individuals who either did or did not have any cardiac event. Next, show proportions over the row margin (what percentage of each category had any cardiac event?).


```
##             any.event
## hxofCig        0   1
##   heavy       98  24
##   moderate   115  23
##   non-smoker 256  42
```

```
##             any.event
## hxofCig          0     1
##   heavy      0.803 0.197
##   moderate   0.833 0.167
##   non-smoker 0.859 0.141
```

## 8. Create a mosaic plot to explore the tabulated counts visually.

![](EssentialStats_HW_files/figure-html/unnamed-chunk-8-1.png)<!-- -->

## 9. Now use a chi-squared test of independence to assess the relationship between smoking history and a cardiac event.


```
## 
## 	Pearson's Chi-squared test
## 
## data:  xt
## X-squared = 2.0794, df = 2, p-value = 0.3536
```

## 10. Interpret the output above.
