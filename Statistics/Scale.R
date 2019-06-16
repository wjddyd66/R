#기술통계보고서 작성예시
data<-read.csv("C:/git/R/Datadescriptive.csv",header=T)
head(data,3) #지정한 수만큼 데이터 출력가능
table(data$resident)
table(data["resident"]) #상동

#척도별 기술통계량
dim(data)
str(data)
summary(data)

#명목척도: 평균,요약 통계량은 별 의미 없다! 카테고리 분류따위에 효과적.
unique(data$gender)
summary(data$gender)
table(data$gender)

data<-subset(data,data$gender==1 | data$gender==2) #결과값이 1,2인 데이터만 추출
unique(data$gender)
x<-table(data$gender)
barplot(x)
y<-round(prop.table(x),2)
y

#서열척도: 계급을 수치로 표현
summary(data$level)
x1<-table(data$level)
x1
barplot(x1)
round(prop.table(x1),2)

#등간척도
survey<-data$survey
summary(survey)
x2<-table(survey)
x2
hist(survey)

#비율척도
summary(data$cost)
mean(data$cost,na.rm=TRUE)
plot(data$cost)
hist(data$cost)

#아웃라이어(주변값) 제거작업
data<-subset(data,data$cost>=2&data$cost<=10)
head(data)
x3<-data$cost
x3
summary(x3)
table(x3)
hist(x3)
plot(x3)

#데이터 범주화
data$cost2[data$cost>=1&data$cost<=3]<-1
data$cost2[data$cost>=4&data$cost<=6]<-2
data$cost2[data$cost>=7]<-3
table(data$cost2)
hist(data$cost2)

install.packages("moments")
library(moments)

co<-data$cost #생활비 비율척도
co

#왜도: 평균 중심으로 기울어진 척도
skewness(co) #-0.297234(음수): 오른쪽으로 치우쳐져있다.
hist(co,density = co)

#첨도: 그래프의 뾰족한 정도 (자료가 중앙에 얼마나 몰려있는지)
kurtosis(co)
hist(co)

#보고서 작성
data$resident2[data$resident==1]<-"특별시"
data$resident2[data$resident>=2&data$resident<=2]<-"광역시"
data$resident2[data$resident==5]<-"시/구/군"
table(data$resident2)

#가공작업
summary(data$cost)
sum(data$cost)
write.csv(data,"./desc_report1.csv") #가공된 데이터로 저장하기로