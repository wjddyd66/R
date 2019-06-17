#DecisionTree

#������ �з� - Train, Test
idx<-sample(1:nrow(iris),nrow(iris)*0.7)
train<-iris[idx,]
test<-iris[-idx,]

#Model ����
formula<-Species~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width
iris_ctree<-ctree(formula = formula,data=train)
iris_ctree

#Model Ȯ��
plot(iris_ctree)

#Test Data ����
pred<-predict(iris_ctree,test)

#��Ȯ�� ���� - 1
table(pred,test$Species)
(15+15+13)/nrow(test) #��Ȯ��: 0.955...

#��Ȯ�� ���� - 2
install.packages("caret")
install.packages("e1071")
library(caret)
confusionMatrix(pred,test$Species)