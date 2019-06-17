#������ T ����
n<-30
mu<-0

set.seed(0)
(x=rnorm(n,mean=mu))
shapiro.test(x) #���Լ� Ȯ��(p>0.05�Ͻ�, ���Ժ����� ������.)
stats::t.test(x) #T-����
wilcox.test(x) #���Լ� ������ �������� ���ϴ� ��� or �������¸� �𸣴� ��� wilcox ���

# one sample T-test
# ���� �Ż����� ������ ���(2800g) ����
data<-read.csv("C:/git/R/Data/babyboom.csv",header = T)
head(data)

# �͹�����: ���� �Ż����� ��� �����Դ� 2800g�̴�.
# �븳����: ���� �Ż����� ��� �����Դ� 2800g�� �ʰ��Ѵ�.
str(data)
(tmp<-subset(data,gender==1)) #���� ������ ����
tmp
(weight<-tmp[[3]])
typeof(weight)
nrow(tmp)

#������ ���
avg<-mean(weight)
avg
s_dev<-sd(weight)
s_dev
n<-length(weight)
n
h0<-2800
(t_value<-(avg-h0)/(s_dev/sqrt(n))) #t=2.233188

alpha<-0.05 #���� ����
(c.u<-qt(1-alpha,df=n-1)) #qt(�ŷڰ��,������), �Ӱ谪=1.739607
(p.value<-1-pt(t_value,df=n-1)) #p-value<-1-pt(tvalue,df)
# p��:0.01963422<0.05 �͹����� �Ⱒ

#���2: t.test()�� ����
t.test(weight,mu=2800,alternative = "greater")
#t = 2.2332, df = 17, p-value = 0.01963, �͹����� �Ⱒ
#�ؼ�: �͹����� �Ⱒ�ϰ� �븳������ ä���Ѵ�.
#�븳����: ���� �Ż����� ��� �����Դ� 2800g�� �ʰ��Ѵ�.

# one sample t-test �ð�ȭ
par(mar=c(0,1,1,1))
x <- seq(-3, 3, by = 0.001)
y <- dt(x, df = n - 1)
plot(x, y, type="l", axes=F, ylim=c(-0.02, 0.38))


abline(h=0)

polygon(c(c.u, x[x > c.u], 3), c(0, y[x > c.u], 0), col=2)
text(c.u, -0.02, expression(t[0.05]==1.74))
text(1.8, 0.2, expression(alpha==0.05), cex=0.8)
arrows(1.8, 0.18, 1.8, 0.09, length=0.05)

polygon(c(t_value, x[x > t.t], 3), c(0, y[x > t.t], 0), density=20, angle = 45)
text(t.t, -0.02, paste("t=", round(t.t, 3)), pos=4)
text(2.65, 0.1, expression(plain(P)(T > 2.23)==0.019), cex=0.8)
arrows(2.7, 0.08, 2.5, 0.03, length=0.05)

#���ϼ� ����
data<-read.csv("C:/git/R/Data/one_sample.csv",header=T)
head(data,3)
x<-data$time #��Ʈ�� ��ջ��ð�
summary(x)
mean(x)
x1<-na.omit(x) #NA���� ����
mean(x1) #NA��(����ġ)�� ������ ä�� ��� ����=5.556881

shapiro.test(x1) #p-value = 0.7242 > 0.05 -> ���Ժ����� ������
t.test(x1,mu=5.2) #p-value = 0.0001417 < 0.05


#���� ������ �� ������ ������� ����(Independent Sample T-test)
#���� �Ż����� ������ ������� ��������
babydata<-read.csv("C:/git/R/Data/babyboom.csv",header = T)
head(babydata,3)
(data<-babydata[,c("gender","weight")])

var.test(data$weight~data$gender) #��л꼺 Ȯ��, p-value=0.07526>0.05
t.test(data$weight~data$gender,mu=0,alternative = "less",var.equal = T)
# p-value = 0.06764 > 0.05 �͹����� ä��
qt(0.05,df=42) #�Ӱ�ġ -1.681952

length(data$weight[data$gender==1]) #18
mean(data$weight[data$gender==1]) #3132.444
length(data$weight[data$gender==2]) #26
mean(data$weight[data$gender==2]) #3375.308

#�ؼ�: p-value = 0.06764 > 0.05 �͹����� ä��
#���� �Ż����� ������ ����� ���̰� ����.��� ����� ��´�.

#Paired Sample Test
bf<-c(11,14,18,21,26,28,37,45,48,60)
af<-c(13,15,17,18,19,23,25,28,29,36)

t.test(bf,af,paired = T) 