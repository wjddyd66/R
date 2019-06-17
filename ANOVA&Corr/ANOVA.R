#ANOVA����
#3���� ��������� �����Ͽ� 1�������� �������� �������� ������� �Ǳ������ �ǽ��Ͽ���.
#�Ǳ������ ��տ� ���̰� �ִ��� ����

#�͹�: 3���� ��������� ���� �Ǳ���� ����� ���̰� ����.
#�븳: 3���� ��������� ���� �Ǳ���� ����� ���̰� �ִ�.
data<-read.csv("C:/git/R/Data/three_sample.csv",header = T)
head(data)

#na�� ����
data2<-subset(data,!is.na(score),c("method","score"))
head(data2)

#�̻�ġ ����
plot(data$score)
boxplot(data$score)
length(data$score)
data2<-subset(data,score<=15)
length(data2$score)
boxplot(data2$score)

table(data2$method)
data2$method2[data2$method==1]<-"���1"
data2$method2[data2$method==2]<-"���2"
data2$method2[data2$method==3]<-"���3"
table(data2$method2)

x<-table(data2$method2)
x
y<-tapply(data2$score,data2$method2,mean)
y

df<-data.frame(�������=x,����=y)
df

#���Լ� ����
shapiro.test(data2$score) #p-value = 0.1897 > 0.05 -> ���Ժ����� ������.

#��л꼺 - �� ���� ���� ������ Ȯ��
bartlett.test(score~method2,data=data2) #p-value = 0.1905 > 0.05 -> ��л꼺OK
#�� �����϶��� var.test ���
#�� ���� �̻��� ���� bartlett.test ���

install.packages("lattice")
library(lattice)
densityplot(score~(method),data = data2) #1,2,3�� ���ؼ� �л��� ���̸� �����ش�.

#ANOVA����
#���1: aov()
result<-aov(score~method2,data = data2)
result
summary(result) #p-val=0.701

#���2: anova()
lmodel<-lm(score~method2,data = data2)
anova(lmodel) #p-val=0.7012

#���3: oneway.test()
oneway.test(score~method2,data = data2) #p-value = 0.4777
oneway.test(score~method2,data = data2,var.equal = T) #p-value = 0.7012