# Healthcare-Quality-and-Expenses-Analysis 

## Problem Statement
* To analyse the Healthcare System of the country and determine various factors that impact the Healthcare Quality and Expenses
* Understand how to minimize the Health Expenses while improving or maintaining the same Healthcare Quality. 
* Providing insights to policymakers, healthcare officials, governments for effective decision making.

## Data Collection
* Collected the data from OCED and WHO websites of 39 countries over 2010-16 years
#### Sources
* OECD - https://stats.oecd.org/Index.aspx
* WHO  - https://www.who.int/gho/database/en/

#### Variables considered
##### 1. Health Resources 
        a. Hospitals
        b. Hospital Employment
        c. Total Equipment
        d. Medical Graduates
        e. Nurse Graduates
##### 2. Health Quality
        a. Death by respiratory disease
        b. Death by circulatory disease
        c. Death by Cancer
        d. Death by accidents
        a. Mean Schooling years
##### 3. Social Factors
        a. Mean Schooling years
        b. Population Structure (Age>65)
##### 4. Economic Factors
        a. Expenditure per capita
##### 5. Medical Procedures
        a. Diagnostic Exams
##### 6. Insurance
        a. Public Insurance
        b. private Insurance

## Data Cleaning
* Imputed the null values based on the characteristic of the respective country and yeear over year change.

## Exploratory Data Analysis 
#### Distribution of the Health_Expenditure and Life Expectancy
![EDA](https://github.com/vinayreddy115/Healthcare-Quality-and-Expenses-Analysis/blob/main/Images/Distribution%20of%20Expenditure%20data.png)

![EDA](https://github.com/vinayreddy115/Healthcare-Quality-and-Expenses-Analysis/blob/main/Images/Distribution%20of%20Life%20Expectancy%20data.png)

#### Correlation Plot
![EDA](https://github.com/vinayreddy115/Healthcare-Quality-and-Expenses-Analysis/blob/main/Images/Correlation%20plot.png)

#### Health Expenditure vs Life Expectancy
![EDA](https://github.com/vinayreddy115/Healthcare-Quality-and-Expenses-Analysis/blob/main/Images/LifeExpectancy%20vs%20Healthcare%20Expenditure.png)

## Model Building
As this is a multi-level data with lower level as time(years), we built the below mentioned Panel regression models using the plm packages 
* pooling model as a baseline model 
* Fixed effects
* Random effects

## Insights and recommendation 
#### Impact of variables on Health Quality
##### postive effect on Health Quality
* Number of hospitals
* Medical graduates, 
* Nurse graduates , 
##### Negative effect on Health Quality
* while deaths by any diseases 
#### Quantitative effects
![image](https://user-images.githubusercontent.com/54513205/117491290-01534680-af3e-11eb-8520-95b941834367.png)

#### Impact of variables on Health Expenses
##### Postive effect on Health Expenses
* Public Insurance  
* Hospitals 
##### Negative effect on Health Expenses
* private insurance  
#### Quantitative effects
![image](https://user-images.githubusercontent.com/54513205/117483678-01e6df80-af34-11eb-9dd4-2276d19f12ba.png)

## Code and Resources Used
R packages : 
* Stargazer
* Plm
* Pheatmap

## References 
1) Data Collection, OECD- https://stats.oecd.org/Index.aspx
2) Data Collection, WHO https://www.who.int/gho/database/en/
3) Panel Data Modelling - Panel Data Analysis Fixed & Random Effects - Oscar Torres-Reyna 
4) Panel Data Modelling- Practical Guides To Panel Data Modeling: A Step by Step Analysis 
Using Stata , Hun Myoung Park, Ph.D 
5) Explaining Fixed Effects: Random Effects Modeling of Time-Series Cross-Sectional and 
Panel Data- Andrew Bell, Kelvyn Jones6) Dormont, B., Grignon, M. & Huber, H., 2006. Health expenditure growth: reassessing the 
threat of ageing. Health Economics, 15(9), pp.947-963. 
7) Dreger, C. & Reimers, H.E., 2005. Health care expenditures in OECD countries: a panel 
unit root and cointegration analysis.
8) Steingrímsdóttir, Ó.A., Næss, Ø., Moe, J.O. et al. Trends in life expectancy by education 
in Norway 1961–2009. Eur J Epidemiol 27, 163–171 (2012). 
9) Global, regional, and national life expectancy, all-cause mortality, and cause-specific 
mortality for 249 causes of death, 1980–2015: a systematic analysis for the Global Burden 
of Disease Study 2015 .
10) https://www.who.int/health_financing/documents/report_en_11_deter-he.pd
