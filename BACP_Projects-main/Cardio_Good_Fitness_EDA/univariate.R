getwd()
cardiodta<-read.csv('CardioGoodFitness.csv',header = TRUE)
View(cardiodta)
class(cardiodta)
summary(cardiodta)

summary(cardiodta$Product)
table(cardiodta$Product)
View(table(cardiodta$Product))

summary(cardiodta$Age)
table(cardiodta$Age)
############# multivariate analysis #################
agegroup <- cut(cardiodta$Age, 
                          breaks = c(17,25,35, 51), 
                          labels = c("less than 25", "25 to 45", "more than 35"))

unique(agegroup)

table(agegroup,cardiodta$Product)
############# multivariate analysis #################

summary(cardiodta$Gender)
table(cardiodta$Gender)

summary(cardiodta$Education)
table(cardiodta$Education)

summary(cardiodta$Usage)
table(cardiodta$Usage)


summary(cardiodta$Fitness)
table(cardiodta$Fitness)

summary(cardiodta$Income)
table(cardiodta$Income)

summary(cardiodta$Miles)
table(cardiodta$Miles)

############################ graphical exploration #####################
x <- c(80,60,40) 
labels <- c("TM195", "TM498", "TM798")
pie(x,labels,main = 'Product frequency',col = c("purple", "orange", "green"))


############## multi variate
plot(cardiodta$Product,cardiodta$Income)
plot(cardiodta$Product,cardiodta$Age)
############## multi variate


plot(cardiodta$Product,main = 'PRODUCT',xlab = 'product model',ylab = 'Frequency',col = 'green')
hist(cardiodta$Age,main = 'AGE',xlab = 'Customer Age',ylab = 'Frequency',col = 'orange')
barplot(table(cardiodta$Education),main="Education",xlab = 'education',ylab = 'Frequency',col = 'brown')
gcount<-table(cardiodta$Gender)
barplot(gcount,main = 'GENDER',xlab = 'gender',ylab = 'frequency',col = 'yellow')
barplot(table(cardiodta$MaritalStatus),main="MaritalStatus",xlab = 'MaritalStatus',ylab = 'Frequency',col = 'purple')
barplot(table(cardiodta$Usage),main = 'Usage',xlab = 'Usage per week',ylab = 'Frequency',col = 'green')
barplot(table(cardiodta$Fitness),main = 'Fitness',xlab = 'Fitness scale',ylab = 'Frequency',col = 'green')

boxplot(cardiodta$Income,main='INCOME',xlab='user Income',ylab='frequency',col='orange')
hist(cardiodta$Income,main='INCOME',xlab='user Income',ylab='frequency',col='orange')

boxplot(cardiodta$Miles,main='Miles',xlab='Miles',ylab='frequency',col='orange')
hist(cardiodta$Miles,main='Miles',xlab='Miles',ylab='frequency',col='orange')

boxplot(cardiodta$Age,main='Age',xlab='Age',ylab='frequency',col='orange')
boxplot(cardiodta$Education,main='Education',xlab='Education',ylab='frequency',col='orange')
boxplot(cardiodta$Usage,main='Usage',xlab='Usage per week',ylab='frequency',col='orange')

barplot(table(cardiodta$Miles))

