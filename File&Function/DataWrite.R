#출력
print('출력')
cat('출력')

#sink() - 콘솔의 출력을 그 파일로 디라이렉션됨
sink('output/savetest.txt') #앞으로의 작업을 파일로 저장하겠다는 선언
kbs<-9
kbs
mbc<-11
mbc
student1<-read.table('C:/git/R/Data/student1.txt',header = T,fileEncoding = "UTF-8")
student1
sink() #sink 해제

name<-c('관우','장비','유비')
age<-c(35,33,31)
gender<-c('m','m','f')
myframe<-data.frame(name,age,gender)
myframe

write.table(myframe,'C:/git/R/R_DataRead/my1.txt')
write.table(myframe,'C:/git/R/R_DataRead/my1.txt',fileEncoding = 'UTF-8')
write.table(myframe,'C:/git/R/R_DataRead/my2.txt',row.names = T)
write.table(myframe,'C:/git/R/R_DataRead/my3.txt',row.names = T)
write.table(myframe,'C:/git/R/R_DataRead/my4.txt',row.names = F,quote = F)
cat(dir('output'),sep = "\n")

write.csv(myframe,'C:/git/R/R_DataRead/my5.csv')
read.csv('C:/git/R/R_DataRead/my5.csv')

write.xlsx(myframe,'C:/git/R/R_DataRead/my6.xlsx')
read.xlsx('C:/git/R/R_DataRead/my6.xlsx',sheetIndex = 1,encoding = 'UTF-8')

#R에서 사용한 변수를 저장한 뒤 가져오기
x<-1:5
y<-6:10
save(x,y,file='C:/git/R/R_DataRead/xy.RData')
rm(list=ls())
ls()
load('C:/git/R/R_DataRead/xy.RData')
x
y