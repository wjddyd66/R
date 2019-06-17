#DecisionTree

#데이터 분류 - Train, Test
idx<-sample(1:nrow(iris),nrow(iris)*0.7)
train<-iris[idx,]
test<-iris[-idx,]

#Model 생성
formula<-Species~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width
iris_ctree<-ctree(formula = formula,data=train)
iris_ctree

#Model 확인
plot(iris_ctree)

#Test Data 예측
pred<-predict(iris_ctree,test)

#정확도 예측 - 1
table(pred,test$Species)
(15+15+13)/nrow(test) #정확도: 0.955...

#정확도 예측 - 2
install.packages("caret")
install.packages("e1071")
library(caret)
confusionMatrix(pred,test$Species)