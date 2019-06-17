#Random Forest
install.packages("randomForest")
library(randomForest)

#Data ������ - Train,Test
set.seed(123)
n<-sample(2,nrow(iris),replace = T,prob=c(0.7,0.3))
n
train<-iris[n==1,]
test<-iris[n==2,]
dim(train)
dim(test)

#Model �����
model<-randomForest(Species~.,data=train)
model

#Model ��Ȯ�� ����
(32+28+33)/nrow(train) # Accuracy: 0.93

#Model2 ����� - ����ġ ����
model2<-randomForest(Species~.,data=train,ntree=800,mtry=3,na.action = na.omit)
model2

#Model2 ��Ȯ�� ����
(32+28+33)/nrow(train) #Accuracy: 0.93

#�߿� �������� Ȯ��
model3<-randomForest(Species~.,data=train,importance=T,na.action = na.omit)
importance(model3)
varImpPlot(model3)
#Peta.Width -> Petal.Length �������� �߿䵵�� �ִ°��� Ȯ�� �� �� �ִ�.

pred<-predict(model3,test)
t<-table(pred,test$Species)
t
#Accuracy: 0.98

#�������� Tree�� ������ ���ϱ�
ntree<-c(400,500,600)
mtry<-c(2:4)
param<-data.frame(n=ntree,m=mtry)
param

for(i in param$n){
  cat('ntree: ',i,'\n')
  for(j in param$m){
    cat('mtry: ',j,'\n')
    model_ex<-randomForest(Species~.,data=train,ntree=i,mtry=j,na.action = na.omit)
    print(model_ex)
  }
}
#ntree: 400, mtry:2 �� ���� ���� ����� �����. 
#ntree�� mtry�� ���� �غ��� ���� �� �� ���� for ������ ���� �˾ƺ��� �Ѵ�.