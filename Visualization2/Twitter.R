install.packages("twitteR")
library(twitteR)

ConsumerAPIkey="m2PXgAaSzuzqUPyQ4CquzkxHV"
ConsumerAPIsecretkey="wMTUWgTe2cWyQL7CZ5oFQDzZhKvDL6ZNbakH5MCzp2DYBqbuWS"
Accesstoken="129432628-LOU1w4ge22Jy3uCtDk40nYn5T5f8pElr3va29Tam"
Accesstokensecret="WMBnj0rXiUXhgP1KejMRUp1EVxdkSzNXL3Rnejh4qVitl"

setup_twitter_oauth(ConsumerAPIkey,ConsumerAPIsecretkey,Accesstoken,Accesstokensecret)

keyword <- enc2utf8("막걸리") #검색어 넣기
keyword
bigdata <- searchTwitter(keyword, n=100, lang="ko")
head(bigdata) #메시지 내용 그대로 읽어들이기
bigdata_df<-twListToDF(bigdata)
head(bigdata_df,3)
str(bigdata_df)

bigdata_txt<-bigdata_df$text
head(bigdata_txt,3)

library(KoNLP)

bigdata_noun<-sapply(bigdata_txt, extractNoun, USE.NAMES = F)
bigdata_noun<-unlist(bigdata_noun)
head(bigdata_noun)

#제거할 문자열 
bigdata_noun<-gsub('[~!@#$%^&*()_+=-<>?]','',bigdata_noun)
bigdata_noun<-gsub('\\d+','',bigdata_noun)
bigdata_noun<-gsub('(ㅠ|ㅜ|ㅋ|ㅎ)+','',bigdata_noun)
bigdata_noun<-gsub('-','',bigdata_noun)
bigdata_noun<-gsub(' ','',bigdata_noun)

bigdata_noun<-base::Filter(function(x){nchar(x)>=2},bigdata_noun)
head(bigdata_noun) #단어 추출

word_table<-table(bigdata_noun)
word_table #단어 추출하여 wordtable로 출력하기

install.packages("wordcloud2")
library(wordcloud2)
wordcloud2(word_table,size=5,color="random-light",backgroundColor = 'black')