#reshape2 package: melt(),dcast()
install.packages("reshape2")
library(reshape2)

exdf<-data.frame(id=c('a','b','c','a','b','c'),type=c(1,2,3,1,1,1),age=c(20,25,25,20,25,NA))
exdf
dcast(exdf,id~type,sum,na.tm=T) #id:��, type:���� ����

no<-c(1,1,2,2)
day<-c(1,2,1,2)
a1<-c(40,30,50,25)
a2<-c(70,55,80,55)
df<-data.frame(no,day,a1,a2)
df

m_data<-melt(df,id=c('no','day'))
m_data

dcast(m_data,no+day~variable) #����(�ຯ��~������)
#melt�� Ǯ����� �����͸� �����·� ���ͽ�Ų��.

dcast(m_data,no+variable~day)
dcast(m_data,no~variable+day)
dcast(m_data,no~variable,mean)
dcast(m_data,day~variable,mean)
dcast(m_data,no~day,sum)

#���Ϸ� ����
pay_data<-read.csv("C:/git/R/Data/pay_data.csv",fileEncoding = "UTF-8")
head(pay_data)
nrow(pay_data)
table(pay_data$product_type)      

#������ ��ǰ������ ���� ���űݾ� ���
product_price<-dcast(pay_data,user_id~product_type,sum,na.rm=T)
head(product_price)

#������ ���������� ���� ���
product_price<-dcast(pay_data,user_id~pay_method,length)
head(product_price)