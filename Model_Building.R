rm(list = ls())
#Importing the data in R
setwd("C:/Users/18132/Desktop/My Docs/SDM/Project/Health Quality Data/Final")
df<-read.csv("Health_Data_Final_updated.csv")

#To check the structure of data
str(df)

#Converting the variables in factors
df$Country<-as.factor(df$Country)
df$Year<-as.factor(df$Year)

#Remove some unwanted variables
df$key<-NULL
df$...1<-NULL

#Create histogram of target variables(Life expectancy & Health expense) for 2015
df1<-df[df$Year==2015,]
hist(df1$Life_Expectancy_at_Birth,main='Histogram of Life Expectancy 2015')
hist(log(df1$Life_Expectancy_at_Birth),main='Histogram of Life Expectancy 2015')
hist(df1$ExpenditurePerCapita,main = 'Histogram of Expenditure per capita 2015')
hist(log(df1$ExpenditurePerCapita),main = 'Histogram of log of Expenditure per capita 2015')

#Corrplot for both models
cor_df1<-subset(df,select=c(ExpenditurePerCapita,Diagnostic_Exams,Hospitals,PercPopulationabove65,Private_Insurance,Public_Insurance,hospital_employment,tot_equipment))
#install.packages('pheatmap') # if not installed already
library(pheatmap)
#corrplot for variables in health expense
m<-cor(cor_df1)
pheatmap(m, display_numbers = T, color = colorRampPalette(c('white','red'))(100), cluster_rows = F, cluster_cols = F, fontsize_number = 15,main='Correlation for Healthcare Expenditure')
#corrplot for variables in life expectancy
cor_df2<-subset(df,select=c(Life_Expectancy_at_Birth,Hospitals,ExpenditurePerCapita	,Mean_Schooling_Years,	hospital_employment,tot_equipment,medical_grads,nurse_grads,death_by_cancer,death_by_circular,death_by_accident,death_by_respirat))
m1<-cor(cor_df2)
pheatmap(m1, display_numbers = T, color = colorRampPalette(c('white','red'))(100), cluster_rows = F, cluster_cols = F, fontsize_number = 15,main='Correlation for Life Expectancy')

#MOdels for Health Expenses
#dataframe of health expense
hex<-subset(df,select=c(Country,Year,Diagnostic_Exams,ExpenditurePerCapita	,Hospitals,	Life_Expectancy_at_Birth,	PercPopulationabove65,Physicians,	Private_Insurance,	Public_Insurance	,	Mean_Schooling_Years,	NationalIncome,	hospital_employment,tot_equipment,medical_grads	,nurse_grads))
#OLS model for HE
library(plm)
d<-plm.data(hex,index=c("Country","Year"))
pool_HE<-plm(log(ExpenditurePerCapita)~Diagnostic_Exams+Hospitals+	PercPopulationabove65+	Private_Insurance+	Public_Insurance	+	hospital_employment+tot_equipment	,data=d,model = "pooling")
summary(pool_HE)

#Residuals plot for HE
plot(d$Country,pool_HE$residuals,las = 2,main='Pool model residual plot by country')
plot(d$Year,pool_HE$residuals,las = 2,main='Pool model residual plot by year')

#to check if panel model
plmtest(pool_HE)

#plm fixed model for HE
pool_HEf<-plm(log(ExpenditurePerCapita)~Diagnostic_Exams+Hospitals+	PercPopulationabove65+	Private_Insurance+	Public_Insurance	+	hospital_employment+tot_equipment,data=d,model = "within")
summary(pool_HEf)

#Residual plot
plot(d$Country,pool_HEf$residuals,las = 2,main='Fixed model residual plot by country')
plot(d$Year,pool_HEf$residuals,las = 2,main='Fixed model residual plot by year')


#plm random model for HE
pool_HEr<-plm(log(ExpenditurePerCapita)~Diagnostic_Exams+Hospitals+	PercPopulationabove65+	Private_Insurance+	Public_Insurance	+	hospital_employment+tot_equipment,data=d,model = "random")
summary(pool_HEr)

#Residual plot
plot(d$Country,pool_HEr$residuals,las = 2,main='Random model residual plot by country')
plot(d$Year,pool_HEr$residuals,las = 2,main='Random model residual plot by year')


#Stargazer to compare all the models
library(stargazer)
stargazer(pool_HE,pool_HEf,pool_HEr,type="text")

#to compare fixed and random models
phtest(pool_HEf,pool_HEr)

#Life Expectancy Models
#dataset of life expectancy
Lex<-subset(df,select=c(Country,Year,ExpenditurePerCapita,ExpenditurePerCapita	,Hospitals,	Life_Expectancy_at_Birth,Physicians	,	Mean_Schooling_Years,	NationalIncome,	hospital_employment,tot_equipment,medical_grads	,nurse_grads,death_by_cancer,	death_by_circular,death_by_accident,death_by_respirat))
dle<-plm.data(Lex,index=c("Country","Year"))
#OLS model for LE
pool_LE<-plm(Life_Expectancy_at_Birth~Hospitals+ExpenditurePerCapita	+	Mean_Schooling_Years+	hospital_employment+tot_equipment+medical_grads	+nurse_grads+death_by_cancer+death_by_circular+death_by_accident+death_by_respirat,data=dle,model = "pooling")
summary(pool_LE)

#Residual plot
plot(dle$Country,pool_LE$residuals,las = 2,main='Pooling model residual plot by country')
plot(dle$Year,pool_LE$residuals,las = 2,main='Pooling model residual plot by year')


#to check if panel model
plmtest(pool_LE)

#fixed effect model for LE
pool_LEf<-plm(Life_Expectancy_at_Birth~Hospitals+ExpenditurePerCapita	+	Mean_Schooling_Years+	hospital_employment+tot_equipment+medical_grads	+nurse_grads+death_by_cancer+death_by_circular+death_by_accident+death_by_respirat,data=dle,model = "within")
summary(pool_LEf)
fixef(pool_LEf)

#Residual plot
plot(dle$Country,pool_LEf$residuals,las = 2,main='Fixed model residual plot by country')
plot(dle$Year,pool_LEf$residuals,las = 2,main='Fixed model residual plot by year')


#Random effect model for LE
pool_LEr<-plm(Life_Expectancy_at_Birth~Hospitals+ExpenditurePerCapita	+	Mean_Schooling_Years+	hospital_employment+tot_equipment+medical_grads	+nurse_grads+death_by_cancer+death_by_circular+death_by_accident+death_by_respirat,data=dle,model = "random")
summary(pool_LEr)

#Residual plot
plot(dle$Country,pool_LEr$residuals,las = 2,main='Random model residual plot by country')
plot(dle$Year,pool_LEr$residuals,las = 2,main='Random model residual plot by year')


#stargazer to compare life expectancy models
stargazer(pool_LE,pool_LEb,pool_LEf,pool_LEr,type ='text')

#To compare fixed and random model of life expectancy
phtest(pool_LEf,pool_LEr)






