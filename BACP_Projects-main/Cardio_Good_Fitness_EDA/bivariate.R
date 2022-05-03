getwd()
cardiodta<-read.csv('CardioGoodFitness.csv',header = TRUE)
summary(cardiodta)
table(cardiodta$Product,cardiodta$Gender)
table(cardiodta$Product,cardiodta$MaritalStatus)
table(cardiodta$Product,cardiodta$Usage)
table(cardiodta$Product,cardiodta$Fitness)

####################################
agegroup <- cut(cardiodta$Age, 
                breaks = c(17,25,35, 51), 
                labels = c("18 to25", "25 to 35", "more than 35"))

unique(agegroup)

table(agegroup,cardiodta$Product)

########################################
incomegroup <- cut(cardiodta$Income, 
                breaks = c(20000,40000,60000,80000,100000,150000), 
                labels = c("<40k", "40k to 60k", "60k to 80k","80k to 100k",">100K"))

unique(incomegroup)

table(incomegroup,cardiodta$Product)


#####################################
summary(cardiodta$Education)
edugroup <- cut(cardiodta$Education, 
                   breaks = c(11,13,16,18,22), 
                   labels = c("<13", "13 to 16", "16 to 18",">18"))

unique(edugroup)

table(edugroup,cardiodta$Product)
table(edugroup)
###########################################



####################################################
incomegroup <- cut(cardiodta$Income, 
                   breaks = c(20000,40000,60000,80000,100000,150000), 
                   labels = c("<40k", "40k to 60k", "60k to 80k","80k to 100k",">100K"))

unique(incomegroup)

table(incomegroup,cardiodta$MaritalStatus,cardiodta$Product)
######################################################

work_data <- cardiodta[ ,c("Product", "Age", "Education", "MaritalStatus", "Income")]
unique(work_data$Product)

attributes(work_data$MaritalStatus)

str(work_data)
summary(work_data)

work_data$agegroup <- cut(cardiodta$Age, 
                breaks = c(17,25,35, 51), 
                labels = c("18 to25", "25 to 35", "more than 35"))

unique(work_data$agegroup)

work_data$incomegroup <- cut(cardiodta$Income, 
                   breaks = c(20000,40000,60000,80000,100000,150000), 
                   labels = c("<40k", "40k to 60k", "60k to 80k","80k to 100k",">100K"))

unique(work_data$incomegroup)
str(work_data)

adgeclass<-table(work_data$agegroup, work_data$Product)
inclass<-table(work_data$incomegroup, work_data$Product)




plot(cardiodta$Product,cardiodta$Income,main='INCOME Vs Product Model',xlab='Model',ylab='user Income',col='orange')
plot(cardiodta$Product,cardiodta$Age,main='Age Vs Product Model',xlab='Model',ylab='user Age',col='violet')
plot(cardiodta$Product,cardiodta$Gender,main='Gender Vs Product Model',xlab='Model',ylab='Gender')
plot(cardiodta$Product,cardiodta$Education,main='Education Vs Product Model',xlab='Model',ylab='user Education',col='green')
plot(cardiodta$Product,cardiodta$Usage,main='Usage Vs Product Model',xlab='Model',ylab='Usage per week',col='orange')
plot(cardiodta$Product,cardiodta$Fitness,main='Fitness Vs Product Model',xlab='Model',ylab='Fitness index',col='brown')
plot(cardiodta$Product,cardiodta$Income,main='Income Vs Product Model',xlab='Model',ylab='Income',col='Green2')


plot(incomegroup,cardiodta$Product,main='Income Vs Product Model',xlab='income',ylab='model')
plot(edugroup,cardiodta$Product,main='Education Vs Product Model',xlab='Education',ylab='model')
