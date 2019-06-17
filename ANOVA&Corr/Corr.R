#상관관계 분석
result <- read.csv("C:/git/R/Data/drinking_water.csv",header = T,fileEncoding ="UTF-8")
head(result)
summary(result)
cor(result)
cor(result,method="pearson")

#상관관계분석 시각화
install.packages("corrgram")
library(corrgram)
corrgram(result)