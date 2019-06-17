#�����躸���� �ۼ�����
data<-read.csv("C:/git/R/Datadescriptive.csv",header=T)
head(data,3) #������ ����ŭ ������ ��°���
table(data$resident)
table(data["resident"]) #��

#ô���� �����跮
dim(data)
str(data)
summary(data)

#����ô��: ���,��� ��跮�� �� �ǹ� ����! ī�װ��� �з������� ȿ����.
unique(data$gender)
summary(data$gender)
table(data$gender)

data<-subset(data,data$gender==1 | data$gender==2) #������� 1,2�� �����͸� ����
unique(data$gender)
x<-table(data$gender)
barplot(x)
y<-round(prop.table(x),2)
y

#����ô��: ����� ��ġ�� ǥ��
summary(data$level)
x1<-table(data$level)
x1
barplot(x1)
round(prop.table(x1),2)

#�ô��
survey<-data$survey
summary(survey)
x2<-table(survey)
x2
hist(survey)

#����ô��
summary(data$cost)
mean(data$cost,na.rm=TRUE)
plot(data$cost)
hist(data$cost)

#�ƿ����̾�(�ֺ���) �����۾�
data<-subset(data,data$cost>=2&data$cost<=10)
head(data)
x3<-data$cost
x3
summary(x3)
table(x3)
hist(x3)
plot(x3)

#������ ����ȭ
data$cost2[data$cost>=1&data$cost<=3]<-1
data$cost2[data$cost>=4&data$cost<=6]<-2
data$cost2[data$cost>=7]<-3
table(data$cost2)
hist(data$cost2)

install.packages("moments")
library(moments)

co<-data$cost #��Ȱ�� ����ô��
co

#�ֵ�: ��� �߽����� ������ ô��
skewness(co) #-0.297234(����): ���������� ġ�������ִ�.
hist(co,density = co)

#÷��: �׷����� ������ ���� (�ڷᰡ �߾ӿ� �󸶳� �����ִ���)
kurtosis(co)
hist(co)

#������ �ۼ�
data$resident2[data$resident==1]<-"Ư����"
data$resident2[data$resident>=2&data$resident<=2]<-"������"
data$resident2[data$resident==5]<-"��/��/��"
table(data$resident2)

#�����۾�
summary(data$cost)
sum(data$cost)
write.csv(data,"./desc_report1.csv") #������ �����ͷ� �����ϱ��