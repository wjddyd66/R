#K-NN
#�ʿ��� ��Ű�� ��ġ
install.packages("ggvis")
library(ggvis)

#������ ���� �ð�ȭ
iris%>%ggvis(~Petal.Length,~Petal.Width,fill=~factor(Species))

#����ȭ ����: ����ȭ�� ��ü ������ 0~100���� �����Ͽ� �����͸� �����ϴ� ���
#(��Ұ�-�ּҰ�)/(�ִ밪-�ּҰ�)
func_normal<-function(x){
  num<-x-min(x)
  m_n<-max(x)-min(x)
  return (num/m_n)
}

test_df<-data.frame(x=c(1:5))
test_df
func_normal(test_df)

#������ ��ó�� ����(����ȭ�� DataFrame���� �����)
lapply(iris[1:4], func_normal)
normal_d<-as.data.frame(lapply(iris[1:4], func_normal))
head(normal_d)
summary(normal_d)
df<-data.frame(normal_d,Species=iris$Species)
head(df)

#Train, Test Data�� ������
set.seed(123)
idx<-sample(1:nrow(df),0.7*nrow(df))
ir_train<-df[idx,]
ir_test<-df[-idx,]
nrow(ir_train):nrow(ir_test)

#Model �����
library(class)
model<-knn(train=ir_train[,-5],test=ir_test[,-5]
           ,cl=ir_train$Species,k=3)
summary(model)

#Model ��Ȯ�� ����
t<-table(model,ir_test$Species)
t
(t[1,1]+t[2,2]+t[3,3])/nrow(ir_test)