#간단한 T 검정
n<-30
mu<-0

set.seed(0)
(x=rnorm(n,mean=mu))
shapiro.test(x) #정규성 확인(p>0.05일시, 정규분포를 따른다.)
stats::t.test(x) #T-검정
wilcox.test(x) #정규성 가정을 충족하지 못하는 경우 or 분포형태를 모르는 경우 wilcox 사용

# one sample T-test
# 여아 신생아의 몸무게 평균(2800g) 검정
data<-read.csv("C:/git/R/Data/babyboom.csv",header = T)
head(data)

# 귀무가설: 여아 신생아의 평균 몸무게는 2800g이다.
# 대립가설: 여아 신생아의 평균 몸무게는 2800g을 초과한다.
str(data)
(tmp<-subset(data,gender==1)) #여아 데이터 추출
tmp
(weight<-tmp[[3]])
typeof(weight)
nrow(tmp)

#수식을 사용
avg<-mean(weight)
avg
s_dev<-sd(weight)
s_dev
n<-length(weight)
n
h0<-2800
(t_value<-(avg-h0)/(s_dev/sqrt(n))) #t=2.233188

alpha<-0.05 #단측 검정
(c.u<-qt(1-alpha,df=n-1)) #qt(신뢰계수,자유도), 임계값=1.739607
(p.value<-1-pt(t_value,df=n-1)) #p-value<-1-pt(tvalue,df)
# p값:0.01963422<0.05 귀무가설 기각

#방법2: t.test()로 판정
t.test(weight,mu=2800,alternative = "greater")
#t = 2.2332, df = 17, p-value = 0.01963, 귀무가설 기각
#해설: 귀무가설 기각하고 대립가설을 채택한다.
#대립가설: 여아 신생아의 평균 몸무게는 2800g을 초과한다.

# one sample t-test 시각화
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

#동일성 검정
data<-read.csv("C:/git/R/Data/one_sample.csv",header=T)
head(data,3)
x<-data$time #노트북 평균사용시간
summary(x)
mean(x)
x1<-na.omit(x) #NA값은 제외
mean(x1) #NA값(결측치)은 제외한 채로 평균 도출=5.556881

shapiro.test(x1) #p-value = 0.7242 > 0.05 -> 정규분포를 따른다
t.test(x1,mu=5.2) #p-value = 0.0001417 < 0.05


#서로 독립인 두 집단의 평균차이 검정(Independent Sample T-test)
#남여 신생아의 몸무게 평균차이 검정수행
babydata<-read.csv("C:/git/R/Data/babyboom.csv",header = T)
head(babydata,3)
(data<-babydata[,c("gender","weight")])

var.test(data$weight~data$gender) #등분산성 확인, p-value=0.07526>0.05
t.test(data$weight~data$gender,mu=0,alternative = "less",var.equal = T)
# p-value = 0.06764 > 0.05 귀무가설 채택
qt(0.05,df=42) #임계치 -1.681952

length(data$weight[data$gender==1]) #18
mean(data$weight[data$gender==1]) #3132.444
length(data$weight[data$gender==2]) #26
mean(data$weight[data$gender==2]) #3375.308

#해석: p-value = 0.06764 > 0.05 귀무가설 채택
#남여 신생아의 몸무게 평균은 차이가 없다.라는 결론을 얻는다.

#Paired Sample Test
bf<-c(11,14,18,21,26,28,37,45,48,60)
af<-c(13,15,17,18,19,23,25,28,29,36)

t.test(bf,af,paired = T) 
