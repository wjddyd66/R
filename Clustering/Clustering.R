#Clustering
#데이터 생성
x<-c(1,2,2,4,5)
y<-c(1,1,4,3,4)
xy<-data.frame(cbind(x,y))

#단일 연결법
hc_sl<-hclust(dist(xy)^2,method = 'single')
plot(hc_sl)

#완전 연결법
hc_cl<-hclust(dist(xy)^2,method = 'complete')
plot(hc_cl)

par(oma=c(3,1,1,0))
par(mfrow=c(1,2))
plot(hc_cl)
plot(hc_cl,hang = -1)

#평균 연결법
hc_avg<-hclust(dist(xy)^2,method = 'average')
plot(hc_avg)

par(oma=c(3,1,1,0))
par(mfrow=c(1,2))
plot(hc_avg)
plot(hc_avg,hang = -1)
