#K-NN
#필요한 패키지 설치
install.packages("ggvis")
library(ggvis)

#데이터 분포 시각화
iris%>%ggvis(~Petal.Length,~Petal.Width,fill=~factor(Species))

#정규화 과정: 정규화란 전체 구간을 0~100으로 설정하여 데이터를 관찰하는 방법
(요소값-최소값)/(최대값-최소값)
func_normal<-function(x){
  num<-x-min(x)
  m_n<-max(x)-min(x)
  return (num/m_n)
}

test_df<-data.frame(x=c(1:5))
test_df
func_normal(test_df)

#데이터 전처리 과정(정규화및 DataFrame으로 만들기)
lapply(iris[1:4], func_normal)
normal_d<-as.data.frame(lapply(iris[1:4], func_normal))
head(normal_d)
summary(normal_d)
df<-data.frame(normal_d,Species=iris$Species)
head(df)

#Train, Test Data로 나누기
set.seed(123)
idx<-sample(1:nrow(df),0.7*nrow(df))
ir_train<-df[idx,]
ir_test<-df[-idx,]
nrow(ir_train):nrow(ir_test)

#Model 만들기
library(class)
model<-knn(train=ir_train[,-5],test=ir_test[,-5]
           ,cl=ir_train$Species,k=3)
summary(model)

#Model 정확도 측정
t<-table(model,ir_test$Species)
t
(t[1,1]+t[2,2]+t[3,3])/nrow(ir_test)
