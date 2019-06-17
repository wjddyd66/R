#SVM
#데이터 불러오기
attach(iris)
#독립변수 종속변수 선언
x<-subset(iris,select = Species)
y<-Species

#SVM Model 만들기
svm_model<-svm(Species~.,data = iris)
summary(svm_model)

#SVM 시각화 하기
par(mar = rep(2, 4))
plot(cmdscale(dist(iris[,-5])),col=as.integer(iris[,5])
     ,pch=c("o","+")[1:150%in%svm_model$index+1])