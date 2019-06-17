#ǥ������ ��� 3����
#�ܼ���������:����,�񺹿�
base::sample(1:10,5) #(������,ǥ������), �񺹿�����(default)
sample(1:10,5,replace = TRUE) #��������:�ߺ��ڷ� ���Ⱑ��
sample(1:10,5,replace = TRUE,prob = 1:10) #prob:����ġ�ο�(����ġ �ο��� ���� ��������)

#��ȭ��������
install.packages("sampling")
library(sampling)

aa<-sampling::strata(c('Species'),size=c(3,3,3),method = 'srswor',data=iris) 
#'srswr'�ܿ��� possion,systematic���� �ִ�. �˻��� ���� �˾ƺ���.
aa
sampling::getdata(iris,aa)

#��������:�ܰ踦 �ָ鼭 �۾��Ҷ�
install.packages("doBy")
library(doBy)
(x<-data.frame(x=1:10))
doBy::sampleBy(~1,frac = .3,data=x,systematic = TRUE) #

sampleBy(~Species,frac = 0.1,data=iris)
sampleBy(~Species,frac = 0.1,data=iris,replace = FALSE,systematic = T)