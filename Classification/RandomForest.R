#Random Forest
install.packages("randomForest")
library(randomForest)

#Data 나누기 - Train,Test
set.seed(123)
n<-sample(2,nrow(iris),replace = T,prob=c(0.7,0.3))
n
train<-iris[n==1,]
test<-iris[n==2,]
dim(train)
dim(test)

#Model 만들기
model<-randomForest(Species~.,data=train)
model

#Model 정확도 측정
(32+28+33)/nrow(train) # Accuracy: 0.93

#Model2 만들기 - 결측치 제거
model2<-randomForest(Species~.,data=train,ntree=800,mtry=3,na.action = na.omit)
model2

#Model2 정확도 측정
(32+28+33)/nrow(train) #Accuracy: 0.93

#중요 독립변수 확인
model3<-randomForest(Species~.,data=train,importance=T,na.action = na.omit)
importance(model3)
varImpPlot(model3)
#Peta.Width -> Petal.Length 수준으로 중요도가 있는것을 확인 할 수 있다.

pred<-predict(model3,test)
t<-table(pred,test$Species)
t
#Accuracy: 0.98

#가장좋은 Tree의 갯수값 구하기
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
#ntree: 400, mtry:2 가 가장 좋은 결과를 얻었다. 
#ntree와 mtry의 값은 해보기 전에 알 수 없어 for 구문을 돌려 알아봐야 한다.