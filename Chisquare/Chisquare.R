#ī�������м�(�����м�) �⺻����

#ī�������� ���� ��Ű�� ��ġ
install.packages("gmodels")
library(gmodels)
#������ �ҷ�����
study<-read.csv("C:/git/R/Data/pass_cross.csv")
head(study)
#������ ���� �� ī������ ��� Ȯ��
table(study$������,study$�հ�)
table(study$���ξ���,study$���հ�)
CrossTable(study$������,study$�հ�,chisq=T)

#�ֻ��� ī������ ����
#���� �����ϴ� �ֻ����� ����Ȯ���� �����ϴ�.
chisq.test(c(4,6,17,16,8,9))

#������(���ü�): �� �Ӽ� ���� �������
data<-read.csv("C:/git/R/Data/cleanDescriptive.csv",header = T,fileEncoding = "UTF-8")
head(data)

#�θ��� �з¼��ذ� �ڳ��� ���п��� �� ���ü� ����
x<-data$level2 #�θ��� �з¼���(��������:������)
y<-data$pass2 #�ڳ��� �������п���(���Ӻ���:�������)

result<-data.frame(level=x,pass=y)
dim(result)
table(result)

chisq.test(x,y,correct = F) #correct = F : ���Ӽ� ���� ������(�⺻��:T-���Ӽ����� ����)


#������ ���� : ���� �� ���� ���Ͽ��� ����
rm(list=ls())
gc()
data<-read.csv("C:/git/R/Data/homogenity.csv",header = T)
head(data)

#��������� ���� ���������� ������ ���̰� �ִ��� ����
#�͹�����: ��������� ���� ���������� ������ ���̰� ����.
#�븳����: ��������� ���� ���������� ������ ���̰� �ִ�.
str(data)

data<-subset(data,!is.na(survey),c(method,survey))
data
table(data$method)
table(data$survey)

data$method2[data$method==1]<-"���1"
data$method2[data$method==2]<-"���2"
data$method2[data$method==3]<-"���3"
head(data)

data$survey2[data$survey==1]<-"�ſ츸��"
data$survey2[data$survey==2]<-"����"
data$survey2[data$survey==3]<-"������"
data$survey2[data$survey==4]<-"�Ҹ���"
data$survey2[data$survey==5]<-"�ſ�Ҹ���"
head(data)

table(data$method2,data$survey2) #�� ���ܺ� ���̰� ���ƾ� �Ѵ�.
chisq.test(data$method2,data$survey2) 
#X-squared = 6.5447, df = 8, p-value = 0.5865
#�ؼ�: p-value(0.5865)>0.05 -> �͹����� ä��
#���: ��������� ���� ���������� ������ ���̰� ����.

CrossTable(data$method2,data$survey2,chisq = T)