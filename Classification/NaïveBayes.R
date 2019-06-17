#나이브베이지안(NaiveBayes Classfication)
library(e1071)
set.seed(123)

#ham,spam을 분류
#Data 가져오기
sms_data<-read.csv("https://raw.githubusercontent.com/pykwon/Test-datas-for-R/master/sms_spam_tm.csv")
sms_data
names(sms_data)
dim(sms_data)
sms_data[1,c(1:10)]

head(sms_data$sms_type)

sms_data_df<-sms_data[-1]
sms_data_df
str(sms_data_df)

#Data 분류하기
set.seed(123)
idx<-sample(nrow(sms_data_df),nrow(sms_data_df)*0.7)
train<-sms_data_df[idx,]
test<-sms_data_df[-idx,]
nrow(train)
nrow(test)

#Model 만들기
model_sms<-naiveBayes(sms_type~.,data=train)

#Model로 예측하기
pred_sms<-predict(model_sms,test,type="class")
pred_sms

#정확도 측정정
t<-table(pred_sms,test$sms_type)
t
(t[1,1]+t[2,2])/sum(t)#정확도: 0.968...