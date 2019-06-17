#�ܼ� ȸ�ͺм� ����
df<-data.frame(workhour=1:7,totalpay=seq(10000,70000,by=10000))
df
plot(totalpay~workhour,data=df)
grid()
model<-lm(totalpay~workhour,data=df)
model
abline(model,col="red",lwd=2)
#y = 1.0e+04*x -5.5e-12

#�ܼ�ȸ�� �м�
head(women)
plot(weight~weight,data=women)
#������� �м�
cor.test(women$weight,women$height)
#ȸ�� �� �����
model<-lm(weight~height,data=women)
model
abline(model,col='blue')
summary(model)
par(mfrow=c(2,2))
plot(model)

#���� ȸ�� �м�
model2<-lm(weight~height+I(height^2),data=women)
summary(model2)
plot(model2)
par(mfrow=c(2,2))

#���� ȸ�� �м�
#Data �ҷ�����
install.packages("car")
library(car)

head(iris)
dim(iris)
cor(iris[,-5])
#Data Train Data�� Test Data �з�
sam_tt<-sample(1:nrow(iris),nrow(iris)*0.7,replace = F)
train<-iris[sam_tt,]
test<-iris[sam_tt,]
dim(train)
dim(test)
#���߰����� Ȯ��
#10 �̻��� ���� �����Ѵ�.
model<-lm(Sepal.Length~Sepal.Width+Petal.Width+Petal.Length,data=train)
vif(model)
#Model �����
model<-lm(Sepal.Length~Sepal.Width+Petal.Width,data=train)
vif(model)
#Model Ȯ�� �� �ð�ȭ
res<-residuals(model)
shapiro.test(res)
par(mfrow=c(2,2))
plot(model)
#������ ������ Ȯ��
install.packages("lmtest")
library(lmtest)
dwtest(model)
summary(model)

#������ƽ ȸ�� �м�
#������ �о���� Ȯ���ϱ�
weather<-read.csv("C:/git/R/Data/weather.csv",stringsAsFactors = F)
head(weather)
names(weather)

#���� ������ƽ ȸ�Ϳ��� Sigmoid�� ����ϱ� ���Ͽ� 1,0���� ��ȯ
weather_df<-weather[,c(-1,-6,-8,-14)]
weather_df$RainTomorrow[weather_df$RainTomorrow=='Yes']<-1 #���̺���ȭ ���״�.
weather_df$RainTomorrow[weather_df$RainTomorrow=='No']<-0
weather_df$RainTomorrow<-as.numeric(weather_df$RainTomorrow)
head(weather_df)

#TrainData�� TestData �и�
idx<-sample(1:nrow(weather_df),nrow(weather_df)*0.7)
train<-weather_df[idx,]
test<-weather_df[-idx,]
dim(train)
dim(test)

#Model �����
weather_model<-glm(RainTomorrow~.,data=train,family = "binomial")
summary(weather_model)

#����ġ ���
pred<-predict(weather_model,newdata = test,type="response")
head(pred)

#��Ȯ�� ����
result_pred<-ifelse(pred>=0.5,1,0)
table(result_pred)
table(result_pred,test$RainTomorrow)
(89+6)/nrow(test)#��Ȯ��  0.8636...

#��Ȯ�� ���� - ROC
install.packages("ROCR")
library(ROCR)
pr<-ROCR::prediction(pred,test$RainTomorrow)
prf<-ROCR::performance(pr,measure="tpr",x.measure = "fpr")
plot(prf)

#ROC ���� - AUC ���ϱ�
auc<-performance(pr,measure="auc")
auc<-auc@y.values[[1]]
auc