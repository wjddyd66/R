#키보드 입력
n<-scan()
sum(1:n)
n

#R에서 파일 읽기
getwd()
list.dirs()
list.files()

student<-read.table('C:/git/R/Data/student.txt')
student

student1<-read.table('C:/git/R/Data/student1.txt',header = T,fileEncoding = "UTF-8")
student1

student2<-read.table('C:/git/R/Data/student2.txt',header = T,sep=';',skip=2,fileEncoding = "UTF-8")
student2

student4<-read.csv(file = 'C:/git/R/Data/student4.txt',sep = ',',header = T,fileEncoding = "UTF-8",na.strings = '-')
student4

#R에서 excel 읽기-read.xlsx
install.packages('xlsx')
library(xlsx)

studex<-read.xlsx('C:/git/R/Data/studentx.xlsx',sheetIndex = 1,encoding = "UTF-8")
studex

#R에서 csv읽기-read.csv
webdata<-read.csv('http://www.kma.go.kr/XML/weather/sfc_web_map.xml',header = T,encoding = 'UTF-8')
head(webdata)

#웹 스크래핑핑
#XML Data
install.packages('XML')
install.packages('httr')
library(XML)
library(httr)

url<-'https://www.melon.com/song/popup/lyricPrint.htm?songId=31754579'
source<-htmlParse(rawToChar(GET(url)$content))
source

lyrics<-xpathSApply(source,"//div[@class='box_lyric_text']",xmlValue)
lyrics

lyrics<-gsub("[\r\n\t]","",lyrics)
lyrics

#Json Data
install.packages("jsonlite")
library(jsonlite)
install.packages("httr")
library(httr)

df_repos <- fromJSON("https://api.github.com/users/hadley/repos")
str(df_repos)
doc[[1]]$owner$login

#rvest: Html File 가져오기
install.packages("rvest")
library(rvest)

?rvest

url<-"https://media.daum.net/series/"
h_daum<-read_html(url)
h_daum

h_daum%>%html_node(".item_series a")
h_daum%>%html_nodes(".item_series a")
daum<-h_daum%>%html_nodes(".item_series a")%>%html_text()
is(daum)

li<-strsplit(daum,",")
li
li[1]
li[2]