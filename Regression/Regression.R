#단순 회귀분석 기초
df<-data.frame(workhour=1:7,totalpay=seq(10000,70000,by=10000))
df
plot(totalpay~workhour,data=df)
grid()
model<-lm(totalpay~workhour,data=df)
model
abline(model,col="red",lwd=2)
#y = 1.0e+04*x -5.5e-12

#단순회귀 분석
head(women)
plot(weight~weight,data=women)
#상관관계 분석
cor.test(women$weight,women$height)
#회귀 모델 만들기
model<-lm(weight~height,data=women)
model
abline(model,col='blue')
summary(model)
par(mfrow=c(2,2))
plot(model)

#다항 회귀 분석
model2<-lm(weight~height+I(height^2),data=women)
summary(model2)
plot(model2)
par(mfrow=c(2,2))

#다중 회귀 분석
#Data 불러오기
install.packages("car")
library(car)

head(iris)
dim(iris)
cor(iris[,-5])
#Data Train Data와 Test Data 분류
sam_tt<-sample(1:nrow(iris),nrow(iris)*0.7,replace = F)
train<-iris[sam_tt,]
test<-iris[sam_tt,]
dim(train)
dim(test)
#다중공선성 확인
#10 이상의 값은 제거한다.
model<-lm(Sepal.Length~Sepal.Width+Petal.Width+Petal.Length,data=train)
vif(model)
#Model 만들기
model<-lm(Sepal.Length~Sepal.Width+Petal.Width,data=train)
vif(model)
#Model 확인 및 시각화
res<-residuals(model)
shapiro.test(res)
par(mfrow=c(2,2))
plot(model)
#잔차의 독립성 확인
install.packages("lmtest")
library(lmtest)
dwtest(model)
summary(model)

#로지스틱 회귀 분석
#데이터 읽어오고 확인하기
weather<-read.csv("C:/git/R/Data/weather.csv",stringsAsFactors = F)
head(weather)
names(weather)

#이항 로지스틱 회귀에서 Sigmoid를 사용하기 위하여 1,0으로 변환
weather_df<-weather[,c(-1,-6,-8,-14)]
weather_df$RainTomorrow[weather_df$RainTomorrow=='Yes']<-1 #더미변수화 시켰다.
weather_df$RainTomorrow[weather_df$RainTomorrow=='No']<-0
weather_df$RainTomorrow<-as.numeric(weather_df$RainTomorrow)
head(weather_df)

#TrainData와 TestData 분리
idx<-sample(1:nrow(weather_df),nrow(weather_df)*0.7)
train<-weather_df[idx,]
test<-weather_df[-idx,]
dim(train)
dim(test)

#Model 만들기
weather_model<-glm(RainTomorrow~.,data=train,family = "binomial")
summary(weather_model)

#예측치 얻기
pred<-predict(weather_model,newdata = test,type="response")
head(pred)

#정확도 측정
result_pred<-ifelse(pred>=0.5,1,0)
table(result_pred)
table(result_pred,test$RainTomorrow)
(89+6)/nrow(test)#정확도  0.8636...

#정확도 측정 - ROC
install.packages("ROCR")
library(ROCR)
pr<-ROCR::prediction(pred,test$RainTomorrow)
prf<-ROCR::performance(pr,measure="tpr",x.measure = "fpr")
plot(prf)

#ROC 면적 - AUC 구하기
auc<-performance(pr,measure="auc")
auc<-auc@y.values[[1]]
auc
