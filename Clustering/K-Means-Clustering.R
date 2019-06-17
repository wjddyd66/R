#K-Means-Clustering
#데이터 만들기
install.packages("NbClust")
library(NbClust)
iris_s<-scale(iris[-5])

#Model 만들기
iris_k<-kmeans(iris_s,centers=3,iter.max = 100)
iris_k

#Model 시각화 하기
library(cluster)
iris_p<-pam(iris_s,3)
names(iris_p)
table(iris_p$clustering)
clusplot(iris_p)
