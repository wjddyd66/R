#������� �м�
result <- read.csv("C:/git/R/Data/drinking_water.csv",header = T,fileEncoding ="UTF-8")
head(result)
summary(result)
cor(result)
cor(result,method="pearson")

#�������м� �ð�ȭ
install.packages("corrgram")
library(corrgram)
corrgram(result)