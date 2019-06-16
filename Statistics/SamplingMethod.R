#표본추출 방법 3가지
#단순임의추출:복원,비복원
base::sample(1:10,5) #(모집단,표본집단), 비복원추출(default)
sample(1:10,5,replace = TRUE) #복원추출:중복자료 추출가능
sample(1:10,5,replace = TRUE,prob = 1:10) #prob:가중치부여(가중치 부여한 수의 출현빈도高)

#층화임의추출
install.packages("sampling")
library(sampling)

aa<-sampling::strata(c('Species'),size=c(3,3,3),method = 'srswor',data=iris) 
#'srswr'외에도 possion,systematic등이 있다. 검색을 통해 알아보기.
aa
sampling::getdata(iris,aa)

#계통추출:단계를 주면서 작업할때
install.packages("doBy")
library(doBy)
(x<-data.frame(x=1:10))
doBy::sampleBy(~1,frac = .3,data=x,systematic = TRUE) #

sampleBy(~Species,frac = 0.1,data=iris)
sampleBy(~Species,frac = 0.1,data=iris,replace = FALSE,systematic = T)