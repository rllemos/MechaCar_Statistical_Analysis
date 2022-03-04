
################## Deliverable 1 #####################
library(dbplyr)

# import csv file
MechaCar_table <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

# Linear Regression Model using lm() function.
MechaCar_lm<-lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data= MechaCar_table)

#generate multiple linear regression model
MechaCar_lm

# view using summary
summary(MechaCar_lm)

# view R-squared
summary(MechaCar_lm)$r.squared

############### Deliverable 2 ######################

#import csv file
SuspensionCoil_table <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

# Create a summary for suspension coils
total_summary<- SuspensionCoil_table%>%
  summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),Std_Dev=sd(PSI))
total_summary

# view by lots using group_by
lot_summary<-SuspensionCoil_table %>% group_by(Manufacturing_Lot) %>% 
  summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),Std_Dev=sd(PSI),.groups = 'keep') #create summary table with multiple columns
lot_summary

##################### Deliverable 3 ##################
# note: level of significance is 0.05

# H0: mu =1500
# Ha: mu <> 1500

t.test(SuspensionCoil_table$PSI, mu=1500)

# analysis - p-value greater than 0.05 therefore we fail to reject the null hypothesis.
# t.test by lots
#Lot 1
t.test(subset(SuspensionCoil_table,Manufacturing_Lot=="Lot1")$PSI, mu=1500)
#Lot 2
t.test(subset(SuspensionCoil_table,Manufacturing_Lot=="Lot2")$PSI, mu=1500)
# Lot 3
t.test(subset(SuspensionCoil_table,Manufacturing_Lot=="Lot3")$PSI, mu=1500)