#wordcloud
Sys.setenv(JAVA_HOME="C:/Program Files/Java/jre1.8.0_181")
library(rJava)
library(KoNLP)
library(tm)
install.packages("wordcloud")

data<-readLines("C:/git/R/Data/wordclo.txt")
data

data2<-sapply(data,extractNoun,USE.NAMES = F)
data2
typeof(data2) #"list"
data3<-unlist(data2)
data3
typeof(data3) #"character"
head(data3)

data3<-gsub('[~!@#$%^&*()_+=-<>?]','',data3)
data3<-gsub('\\d+','',data3)
data3<-gsub('-','',data3)
data3<-gsub(' ','',data3)
data3<-base::Filter(function(x){nchar(x)>=2},data3)
data3
typeof(data3) #"character"
write(data3,"testdata/wordclo_my.txt")

data4<-read.table("testdata/wordclo_my.txt")
head(data4)
word<-table(data4)
head(sort(word,decreasing = T))
data4<-gsub('¼­¿ï½Ã','',data4)

library(wordcloud)
display.brewer.all()

pal<-brewer.pal(9,"Set3")
windowsFonts(font=windowsFont("µ¸¿ò"))

wordcloud(names(word),freq = word
          ,min.freq=1,max.words = 50,
          random.order = F,random.color = T,colors = pal)