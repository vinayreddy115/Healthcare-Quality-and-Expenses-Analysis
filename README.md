# Healthcare-Quality-and-Expenses-Analysis 

## Problem Statement
* To Unserstand the Healthcare System of the country and determine various factors that impact the Healthcare Quality and Expenses
* Understand how to minimize the health Expenses while improving or maintaining the same Healthcare Quality. 
* Providing insights to policymakers, Healthcare officials, Government for effective decision making.

## Data Collection:
* Collected the data from OCED and WHO websites of 39 countries over 2010-16 years
#### Data Sources: 
* OECD - https://stats.oecd.org/Index.aspx
* WHO  - https://www.who.int/gho/database/en/

## Data Cleaning:
* Imputed the null values based on the characteristic of the respective country and yeear over year change.

## Exploratory Data Analysis :
#### Distribution of the Health_Expenditure and Life Expectancy

![EDA](https://github.com/vinayreddy115/Healthcare-Quality-and-Expenses-Analysis/blob/main/Images/Distribution%20of%20Expenditure%20data.png)

![EDA](https://github.com/vinayreddy115/Healthcare-Quality-and-Expenses-Analysis/blob/main/Images/Distribution%20of%20Life%20Expectancy%20data.png)

#### Correlation Plot

![EDA](https://github.com/vinayreddy115/Healthcare-Quality-and-Expenses-Analysis/blob/main/Images/Correlation%20plot.png)

#### Health Expenditure vs LifeExpectancy

![EDA](https://github.com/vinayreddy115/Healthcare-Quality-and-Expenses-Analysis/blob/main/Images/LifeExpectancy%20vs%20Healthcare%20Expenditure.png)


## Model Building
As this is a multi-level data with lower level as time(years), we built the below mentioned Panel regression models using the plm packages 
* pooling model as a baseline model 
* Fixed effects
* Random effects

## Insights and recommendation 
* constructing 10 hospitals per 1 million population results in increase of Life expectancy by 6.7 years.
* To manage the health expenses effectively, the government should strive to increases the
% of total population under public insurance.
    * Decrease in expenses by 1% per person with increasing 1% population into public insurance.

   VARIABLES	                                                            IMPACT ON HEALTH EXPENSES
Private_Insurance             	with increase in 10% percentage of population under private insurance coverage. The expenses increases by 1%.         
Public_Insurance              	with increase in 1% percentage of population under public insurance coverage. The expenditure decreases by 1%.        
Hospitals                      	increasing hospitals by 1 per 1000 person, The healthcare expenses decrease by 6%.        
Diagnostic_Exams                	with increase in 1 diagnostic exams per 1000 population, the healthcare expenses increases by 1%.   
PercPopulationabove65        	   with increase in 1% percentage of population above 65 years of age. The cost increases by 4.7%.     
hospital_employment           	with increase in 1 employee in health sector per 1000 population. The healthcare expenses increases by 4.4%.     
tot_equipment                 	with increase in 10 equipment’s per 1000 population. The healthcare expenses increases by 0.9%.        


## Code and Resources Used:
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
of Disease Study 2015 
10) https://www.who.int/health_financing/documents/report_en_11_deter-he.pd
