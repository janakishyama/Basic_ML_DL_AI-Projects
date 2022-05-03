setwd("F:/BACP/w4-Mini project")
getwd()


cardiodta<-read.csv('CardioGoodFitness.csv',header = TRUE)
View(cardiodta)

head(cardiodta)
tail(cardiodta)


dim(cardiodta)
summary(cardiodta)
rownames(cardiodta)
colnames(cardiodta)
names(cardiodta)

table(cardiodta$Product)
table(cardiodta$Age)
table(cardiodta$Gender)
table(cardiodta$Education)
table(cardiodta$MaritalStatus)
table(cardiodta$Usage)
table(cardiodta$Fitness)
table(cardiodta$Income)
table(cardiodta$Miles)


str(cardiodta)

table(cardiodta$Product,cardiodta$Gender)
table(cardiodta$Fitness,cardiodta$Gender)
table(cardiodta$Product,cardiodta$Income)

cardiodta$Usage
cardiodta[cardiodta$Product=="TM195",]

cardiodta$Education[]
cardiodta$Education

################## mtcar data set test and reference #######################
View(mtcars)
str(mtcars)
mtcars$model<-rownames(mtcars)
str(mtcars)
mtcars$model<-as.factor(mtcars$model)
str(mtcars)
unique(mtcars$model)
table(mtcars$model)
attach(mtcars)
mtcars
head(mtcars$cyl)
################## mtcar data set test and reference #######################

dimensions<-dim(cardiodta)
View(dimensions)
names(cardiodta)
str(cardiodta)
class(cardiodta$Product)
summary(cardiodta)
table(summary(cardiodta$Age))
