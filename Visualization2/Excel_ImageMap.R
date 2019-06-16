#엑셀자료 가공 후 동별 호프통닭집 건수로 이미지맵 출력
install.packages("readxl")
library(readxl)

ck<-read_excel("C:/git/R/Data/Restaurant.xlsx")
ck
typeof(ck) #"list"
ck<-as.data.frame(ck)
ck
class(ck) #"data.frame"
head(ck) #1~6행까지만 출력
addr<-substr(ck$주소3,1,3)
head(addr) #"창신동" "동숭동" "관수동" "관철동" "관철동" "명륜2"
addr<-gsub("[0-9]","",addr) #숫자제거
addr<-gsub(" ","",addr) #공백제거
head(addr)
str(addr)

library(dplyr)
addr_count<-addr%>%table()%>%data.frame() #table(): 빈도수 표현
addr_count
class(addr_count)
colnames(addr_count)<-c("동이름","점포수")
head(addr_count)

install.packages("treemap")
library(treemap)
treemap(addr_count, index="동이름", vSize="점포수")
arrange(addr_count, desc(점포수))%>%head(10)