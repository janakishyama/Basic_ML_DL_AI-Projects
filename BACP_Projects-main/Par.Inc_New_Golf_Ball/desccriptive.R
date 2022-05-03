getwd()
install.packages("readxl") 
library("readxl")
mydata <- read_excel("Golf.xls")
mydata
attach(mydata)

View(mydata)

head(mydata)
tail(mydata)


dim(mydata)
summary(mydata)
names(mydata)
str(mydata)

mean(New)
mean(Current)
sd(New)
sd(Current)
var(New)
var(Current)
median(New)
median(Current)

IQR(New)
max(New)-min(New)

IQR(Current)
max(Current)-min(Current)
max(New)-min(New)
range(New)
range(Current)

## visualisation

# t test
t.test(Current,New)
t.test(Current,New,var.equal = TRUE)


library(lattice)
hist(Current,main = 'Current Model',xlab = 'Distance',ylab = 'Frequency',col = 'orange')
hist(New,main = 'New Model',xlab = 'Distance',ylab = 'Frequency',col = 'green')

barplot(table(Current),main="Education",xlab = 'education',ylab = 'Frequency',col = 'brown')
barplot(table(New),main="Education",xlab = 'education',ylab = 'Frequency',col = 'brown')

boxplot(Current,main='INCOME',xlab='user Income',ylab='frequency',col='orange')
boxplot(New,main='INCOME',xlab='user Income',ylab='frequency',col='orange')

plot(density(Current),col='brown')
plot(density(New),col='green')

boxplot(Current,New,names=c('current','New'),main='Distence Vs Ball models',xlab='Ball model',ylab='Driven distence',col=c('orange','green'))


