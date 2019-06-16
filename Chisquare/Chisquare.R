#카이제곱분석(교차분석) 기본이해

#카이제곱을 위한 패키지 설치
install.packages("gmodels")
library(gmodels)
#데이터 불러오기
study<-read.csv("C:/git/R/Data/pass_cross.csv")
head(study)
#데이터 가공 및 카이제곱 결과 확인
table(study$공부함,study$합격)
table(study$공부안함,study$불합격)
CrossTable(study$공부함,study$합격,chisq=T)

#주사이 카지에곱 검정
#내가 생각하는 주사위는 나올확률이 동일하다.
chisq.test(c(4,6,17,16,8,9))

#독립성(관련성): 두 속성 간의 관계검정
data<-read.csv("C:/git/R/Data/cleanDescriptive.csv",header = T,fileEncoding = "UTF-8")
head(data)

#부모의 학력수준과 자녀의 대학여부 간 관련성 검정
x<-data$level2 #부모의 학력수준(독립변수:영향줌)
y<-data$pass2 #자녀의 대학진학여부(종속변수:영향받음)

result<-data.frame(level=x,pass=y)
dim(result)
table(result)

chisq.test(x,y,correct = F) #correct = F : 연속성 보정 미적용(기본값:T-연속성보정 적용)


#동질성 검정 : 집단 간 분포 동일여부 검정
rm(list=ls())
gc()
data<-read.csv("C:/git/R/Data/homogenity.csv",header = T)
head(data)

#교육방법에 따른 교육생들의 만족도 차이가 있는지 검정
#귀무가설: 교육방법에 따른 교육생들의 만족도 차이가 없다.
#대립가설: 교육방법에 따른 교육생들의 만족도 차이가 있다.
str(data)

data<-subset(data,!is.na(survey),c(method,survey))
data
table(data$method)
table(data$survey)

data$method2[data$method==1]<-"방법1"
data$method2[data$method==2]<-"방법2"
data$method2[data$method==3]<-"방법3"
head(data)

data$survey2[data$survey==1]<-"매우만족"
data$survey2[data$survey==2]<-"만족"
data$survey2[data$survey==3]<-"보통족"
data$survey2[data$survey==4]<-"불만족"
data$survey2[data$survey==5]<-"매우불만족"
head(data)

table(data$method2,data$survey2) #각 집단별 길이가 같아야 한다.
chisq.test(data$method2,data$survey2) 
#X-squared = 6.5447, df = 8, p-value = 0.5865
#해석: p-value(0.5865)>0.05 -> 귀무가설 채택
#결론: 교육방법에 따른 교육생들의 만족도 차이가 없다.

CrossTable(data$method2,data$survey2,chisq = T)
