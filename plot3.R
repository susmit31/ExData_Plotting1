pow_df<-read.csv('household_power_consumption.txt',sep=';',header=TRUE)
pow_df$Date<-as.Date(pow_df$Date,'%d/%m/%Y')

pow_df<-pow_df%>%filter(Date=='2007-02-01'|Date=='2007-02-02')
pow_df$datetime<-paste(pow_df$Date,pow_df$Time)

library(lubridate)
pow_df$datetime<-ymd_hms(pow_df$datetime)

png('plot3.png')
with(pow_df,plot(datetime,Sub_metering_1,type='n',ylab='Energy sub metering'))
with(pow_df,lines(datetime,Sub_metering_1,col='red'))
with(pow_df,lines(datetime,Sub_metering_2,col='green'))
with(pow_df,lines(datetime,Sub_metering_3,col='blue'))
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),cex=.85,pch='-',col=c('red','green','blue'))
dev.off()