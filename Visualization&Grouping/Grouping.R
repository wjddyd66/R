#그룹화
install.packages("plyr")
library(plyr)
install.packages("dplyr")
library(dplyr)
head(iris)
unique(iris$Species)
t<-tapply(iris$Sepal.Length, iris$Species, sd) #연산대상,그룹,작업
t
class(t)

a<-plyr::ddply(iris, .(Species), summarise, avg=mean(Sepal.Length)) #데이터프레임, 집단변수
a<-plyr::ddply(iris, .(Species), summarise, avg=mean(Sepal.Length),tot=sum(Sepal.Length))
a<-plyr::ddply(iris, .(Species), summarise, avg=round(mean(Sepal.Length),1),
               tot=sum(Sepal.Length))

a
class(a)

ddply(iris,.(Species),
      function(sub){
        data.frame(Sepal_l_m=mean(sub$Sepal.Length))
      })
ddply(iris,.(Species,Sepal.Width>=3.0),
      function(sub){
        data.frame(Sepal_l_m=mean(sub$Sepal.Length))
      })

stu<-read.csv("C:/git/R/Data/ex_studentlist.csv")
stu
names(stu)

#filter
filter(stu,gender=='남',grade==2) #and
filter(stu,gender=='남'|grade==2) #or

#arrange()
arrange(stu,age)
arrange(stu,desc(age))
arrange(stu,grade,age)

#select
select(stu,name,age)
select(stu,name:age)
select(stu,-(name:age))

#summarise()
is.na(stu)
table(is.na(stu))
table(is.na(stu$age))
stdf<-na.omit(stu)
stdf
summarise(stu,avgAge=mean(age,na.rm=T))
summarise(stu,sdAge=sd(age,na.rm=T))

#%>%연산자
stu%>%filter(grade==1)
stu%>%filter(grade!=1)
stu%>%filter(height>=180.0)
stu%>%filter(height>=170.0&grade==2)
stu%>%filter(height>=170.0|grade==2)

stu%>%filter(grade%in%c(1,2))

v<-stu%>%filter(grade==1)
v
mean(v$weight)
