#변수와 데이터 유형

# 변수: 참조형, 들어오는 값에 의해 타입을 결정한다.
va<-1
va<-2
var1=3
4->var2
a<-2
A<-3
var.first<-5 #변수명에 .찍어서 표현가능
var.second<-6
a<-5
b<-6
c<-a+b
print(c)
c
(c<-a+b)

rnorm(10)
mean(rnorm(10))

#데이터유형 - 수치형
kbs<-9
object.size(kbs)
typeof(kbs)
typeof(5)
typeof(5.5)
is(kbs) #numeric:integer, double
mbc<-as.integer(kbs) # 형변환
is(mbc)
sbs<-5L #"L"을 붙이면 integer가 된다.
typeof(sbs)

#데이터유형 - 문자형
string<-"홍길동"
string<-'홍길동'
typeof(string)
is.character(string)

#데이터유형 - 논리형
b<-TRUE #logical형 타입
b<-T
is.logical(b)
typeof(b)

#데이터유형 - 복소수형
z<-5.3-3i
z
Re(z)
Im(z)
is.complex(z)

#04.17
#NA, NULL, NaN
aa<-NA #결측치: 값이 입력되지 않은 상태
aa
is.na(aa)
sum(2,3,na.rm = T) #연산되지 않는다.
aa<-NULL #그냥 값이 없는 상태
aa
sum(2,3,NULL) #자동으로 NULL을 제외하고 연산한다.
aa<-NaN
aa
sum(2,3,NaN)

typeof(NULL) #="NULL"
typeof(NA) #="logical"
typeof(NaN) #="double"
length(NULL) #=0
length(NA) #=1
length(NaN) #=1
Inf
0/0
Inf*0
Inf+Inf#=Inf
Inf/Inf#=NaN
Inf*Inf#=Inf
Inf-Inf#=NaN

#Factor(요인형)
kbs<-c("second","first","third","second") #문자열벡터, c:combination함수
kbs
is.factor(kbs)
is.character(kbs)
mbc<-as.factor(kbs)
mbc
is.factor(mbc)
levels(mbc)#문자열의 순위 출력
summary(mbc)#빈도수 출력
plot(mbc)#빈도수를 그래프로 출력

mbc2<-factor(mbc,levels=c("third","second","first"),ordered = TRUE)
mbc2
plot(mbc2)
plot(mbc)

names<-c("공길동","홍길동","사임당")
gender<-c("2","2","1")
(names<-c(names,"손오공"))#print(...)와 같은 기능
print(gender<-c(gender,"남자"))
names
gender
str(names)#R은 index가 1부터 출발
str(gender)
gender[5]<-"여자"
gender
f.gender<-factor(gender)
f.gender
str(f.gender)
levels(f.gender)

ans<-c(2,2,3,2,3,4,4,4,3,4)
ans
f.ans<-factor(ans)
f.ans
str(f.ans)
f.ans<-factor(ans,levels=c(1,2,3,4,5))
f.ans
str(f.ans)
f.ans<-factor(ans,levels=c(1,2,3,4,5),ordered=TRUE)
f.ans
str(f.ans)
f.ans<-factor(ans,levels=c(1,2,3,4,5),ordered=TRUE,
              labels=c("매우불만","불만","보통","만족","매우만족"))
f.ans
str(f.ans)

names<-c("고길동","심길동","사임당")
gender<-c("2","2","1")
df<-data.frame(name=names,gender=gender)
df
str(df)
df2<-data.frame(name=names,gender=gender)
df2
str(df2)

#함수
f<-function(){
  return('good')
}
f()
typeof(f)#closure:함수타입이라는 의미