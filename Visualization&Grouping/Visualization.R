# 이산변수:막대,점,원형차트를 주로 사용
# 연속변수:상자박스,히스토그램,산점도차트를 주로 사용

stu<-read.csv("C:/git/R/Data/ex_studentlist.csv",fileEncoding = "UTF-8")
head(stu)
names(stu)

barplot(stu$grade,ylim=c(0,5),main="제목",col=rainbow(3))
plot(stu$grade,ylim=c(0,5),main="제목",col=rainbow(3)) #산점도
barplot(stu$grade,ylim=c(0,5),main="제목",col=c(1,2,3))
?barplot

par(mfrow=c(1,2)) #한 화면에 여러개의 결과를 출력할 때 사용
barplot(stu$grade,ylim=c(0,5),col=rainbow(3))
title(main="1열")

barplot(stu[,4],ylim=c(0,5),col=rainbow(3),space=2)
title(main="2열")

par(mfrow=c(1,1))
dotchart(stu$grade)
dotchart(stu$grade,color=2:5,lcolor="black",pch=1:2,cex=1.2)

df<-na.omit(stu)
str(df)
pie(df$age,labels=df$age,lty=2)
title("파이차트")

#연속변수에 적합한 차트
mean(stu$height)
median(stu$height)
quantile(stu$height)

boxplot(stu$height,range=2) #아웃라이어를 체크할 때 주로 사용한다.
boxplot(stu$height,range=2,notch = T)
abline(h=178,lty=5,col="orange")

hist(stu$height)
hist(stu$height,breaks = 10)
hist(stu$height,breaks = 10,prob=T)
lines(density(stu$height))

hist(stu$height,xlab='키',main='히스토그램',xlim=c(150,200),col='yellow')
price<-runif(10,min=1,max=100)
price
plot(price)

par(mfrow=c(2,2))
plot(price,type='l',pch=5)
plot(price,type='o',pch=10)
plot(price,type='h',pch=15,col='blue')
plot(price,type='s',pch=20,col='orange',cex=1.5)

sales<-read.csv("C:/git/R/Data/sales.csv")
par(mfrow=c(1,1))
head(sales)
attach(sales)
search()
plot(Quarter,A,type="o",col="blue",ylim=c(0,2500),axes=T,ann=T)
plot(Quarter,A,type="o",col="blue",ylim=c(0,2500),axes=F,ann=F)
plot(Quarter,B,type="o",col="blue",ylim=c(0,2500),axes=T,ann=F)
detach(sales)
search()

head(iris,2)    
attributes(iris)
pairs(iris[,1:4])
pairs(iris[iris$Species=='setosa',1:4])
pairs(~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width,
      data=iris,pch=c(1,2,3)[iris$Species])

#Multiple plot
par(mar=c(1,1,1,1))
layout(matrix(c(3,0,2,1),2,2,byrow=T),c(2,1),c(1,2)) 
#3,0,2,1 ->그래프의 배치가 3,0,2,1순. 0은 빈자리.
#byrow=T -> 행 우선순위 
plot(iris$Sepal.Length)
hist(iris$Sepal.Width)
boxplot(iris$Petal.Length)

par(mar=c(1,1,1,1))
install.packages("scatterplot3d")
library(scatterplot3d)
class(iris$Species)
dim(iris)
levels(iris$Species)
ir.setosa=iris[iris$Species=='setosa',]
ir.versicolor=iris[iris$Species=='versicolor',]
ir.virginica=iris[iris$Species=='virginica',]
ir.setosa
irdata<-scatterplot3d(iris$Sepal.Length,iris$Petal.Length,iris$Sepal.Width,type='n')
irdata$points3d(ir.setosa$Sepal.Length,ir.setosa$Petal.Length,ir.setosa$Sepal.Width,
                bg='red',pch=21)
irdata$points3d(ir.virginica$Sepal.Length,ir.virginica$Petal.Length,ir.virginica$Sepal.Width,
                bg='blue',pch=21)
irdata$points3d(ir.versicolor$Sepal.Length,ir.versicolor$Petal.Length,ir.versicolor$Sepal.Width,
                bg='yellow',pch=21)