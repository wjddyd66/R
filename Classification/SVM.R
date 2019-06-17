#SVM
#������ �ҷ�����
attach(iris)
#�������� ���Ӻ��� ����
x<-subset(iris,select = Species)
y<-Species

#SVM Model �����
svm_model<-svm(Species~.,data = iris)
summary(svm_model)

#SVM �ð�ȭ �ϱ�
par(mar = rep(2, 4))
plot(cmdscale(dist(iris[,-5])),col=as.integer(iris[,5])
     ,pch=c("o","+")[1:150%in%svm_model$index+1])