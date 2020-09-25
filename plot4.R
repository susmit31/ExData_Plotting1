pow_df<-read.csv('household_power_consumption.txt',sep=';',header=TRUE)
pow_df$Date<-as.Date(pow_df$Date,'%d/%m/%Y')

pow_df<-pow_df%>%filter(Date=='2007-02-01'|Date=='2007-02-02')
pow_df$datetime<-paste(pow_df$Date,pow_df$Time)

library(lubridate)
pow_df$datetime<-ymd_hms(pow_df$datetime)

png('plot4.png')
par(mfrow=c(2,2),mar=c(6,6,4,2))

with(pow_df,plot(datetime,Global_active_power,xlab='',ylab='Global active power',type='n'))
with(pow_df,lines(datetime,Global_active_power))

with(pow_df,plot(datetime,Voltage,type='n'))
with(pow_df,lines(datetime,Voltage))

with(pow_df,plot(datetime,Sub_metering_1,type='n',xlab='',ylab='Energy sub metering'))
with(pow_df,lines(datetime,Sub_metering_1,col='red'))
with(pow_df,lines(datetime,Sub_metering_2,col='green'))
with(pow_df,lines(datetime,Sub_metering_3,col='blue'))
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),cex=.6,pch='-',col=c('red','green','blue'))

with(pow_df,plot(datetime,Global_reactive_power,type='n'))
with(pow_df,lines(datetime,Global_reactive_power))
dev.off()