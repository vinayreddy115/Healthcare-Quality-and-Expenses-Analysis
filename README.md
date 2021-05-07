# Healthcare-Quality-and-Expenses-Analysis - Overview

## Problem Statement
* To determine the factors that impact the healthcare quality and expenses
* Understand how to minimize the health expenses while improving or maintaining the same health quality. 
* Providing insights to policymakers, Healthcare officials, Government for effective decision making.

## Data Collection:
* Collected the data from OCED and WHO websites of 39 countries over 2010-16 years
#### Data Source: 
OECD - https://stats.oecd.org/Index.aspx

WHO  - https://www.who.int/gho/database/en/


## Code and Resources Used:
R packages : 
* stargazer
* plm
* pheatmap


## Data Cleaning:
* imputed the null values based on the characteristic of the respective country and yeear over year change.

## Exploratory Data Analysis :
Distribution of the Health_Expenditure and Life Expectancy

![EDA](https://github.com/vinayreddy115/Healthcare-Quality-and-Expenses-Analysis/blob/main/Images/Distribution%20of%20Expenditure%20data.png)

![EDA](https://github.com/vinayreddy115/Healthcare-Quality-and-Expenses-Analysis/blob/main/Images/Distribution%20of%20Life%20Expectancy%20data.png)

Correlation Plot

![EDA](https://github.com/vinayreddy115/Healthcare-Quality-and-Expenses-Analysis/blob/main/Images/Correlation%20plot.png)

Health Expenditure vs LifeExpectancy

![EDA](https://github.com/vinayreddy115/Healthcare-Quality-and-Expenses-Analysis/blob/main/Images/LifeExpectancy%20vs%20Healthcare%20Expenditure.png)


## Model Building
As this is a multi-level data with lower level as time(years), we built the below mentioned Panel regression models using the plm packages 
* Fixed
* Random 
* pooling model as a baseline model 

## Insights and recommendation 
* A quantitative measure for making this strategical decision is to build 10 hospitals per 1
million population, to increase Life expectancy by 6.7 years.
* To manage the health expenses effectively, the government should strive to increases the
% of total population under public insurance.
* Quantitative measure for making this strategical decision would be to look at decrease in
expenses by 1% per person with increasing 1% population into public insurance.
* Also, we observed that the peculiar case of USA with High health expenses is mostly due
to less percentage of people under Public Insurance i.e., 30% if increased will decrease the
health expenses and the recent presidential election 2020 campaign is all around “Medicare
for All”. Hope this model explains the argument of Campaigners. 



