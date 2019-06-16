#함수-내장함수,사용자정의함수

#내장함수 - 기존에 정의되어있는 함수 사용
seq(0,5,by=1,5)
rnorm(10,mean=0,sd=1)
hist(rnorm(10000,mean=0,sd=1))

#runif-난수발생
runif(10) #0~1 사이
runif(10000,min=0,max=100)
hist(runif(10,min=0,max=100))

sample(0:100,10)

vec<-1:10
min(vec)
max(vec)
range(vec)
median(vec)
var(vec)
sqrt(var(vec))
sd(vec)
quantile(vec)
prod(vec)
table(vec)
factorial(vec)
abs(-5)

#사용자정의함수 - 직접 정의하여 사용할 수 있는 함수
func1<-function(arg){
  print(arg)
  print('사용자정의함수')
}
func1('인자')

gugu_func<-function(dan){
  for(d in dan){
    for(i in 1:9){
      cat(d,'*',i,'=',d*i,'\n')
    }
    cat('\n')
  }
}
gugu_func(c(3:6))
gugu_func(c(2,7))