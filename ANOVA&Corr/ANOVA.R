#ANOVA검정
#3가지 교육방법을 적용하여 1개월동안 교육받은 교육생을 대상으로 실기시험을 실시하였다.
#실기시험의 평균에 차이가 있는지 검정

#귀무: 3가지 교육방법을 통한 실기시험 평균의 차이가 없다.
#대립: 3가지 교육방법을 통한 실기시험 평균의 차이가 있다.
data<-read.csv("C:/git/R/Data/three_sample.csv",header = T)
head(data)

#na행 제거
data2<-subset(data,!is.na(score),c("method","score"))
head(data2)

#이상치 제거
plot(data$score)
boxplot(data$score)
length(data$score)
data2<-subset(data,score<=15)
length(data2$score)
boxplot(data2$score)

table(data2$method)
data2$method2[data2$method==1]<-"방법1"
data2$method2[data2$method==2]<-"방법2"
data2$method2[data2$method==3]<-"방법3"
table(data2$method2)

x<-table(data2$method2)
x
y<-tapply(data2$score,data2$method2,mean)
y

df<-data.frame(교육방법=x,성적=y)
df

#정규성 검정
shapiro.test(data2$score) #p-value = 0.1897 > 0.05 -> 정규분포를 따른다.

#등분산성 - 세 집단 간의 동질성 확인
bartlett.test(score~method2,data=data2) #p-value = 0.1905 > 0.05 -> 등분산성OK
#두 집단일때는 var.test 사용
#세 집단 이상일 때는 bartlett.test 사용

install.packages("lattice")
library(lattice)
densityplot(score~(method),data = data2) #1,2,3에 대해서 분산의 차이를 보여준다.

#ANOVA검정
#방법1: aov()
result<-aov(score~method2,data = data2)
result
summary(result) #p-val=0.701

#방법2: anova()
lmodel<-lm(score~method2,data = data2)
anova(lmodel) #p-val=0.7012

#방법3: oneway.test()
oneway.test(score~method2,data = data2) #p-value = 0.4777
oneway.test(score~method2,data = data2,var.equal = T) #p-value = 0.7012
