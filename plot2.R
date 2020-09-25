pow_df<-read.csv('household_power_consumption.txt',sep=';',header=TRUE)
pow_df$Date<-as.Date(pow_df$Date,'%d/%m/%Y')

pow_df<-pow_df%>%filter(Date=='2007-02-01'|Date=='2007-02-02')
pow_df$datetime<-paste(pow_df$Date,pow_df$Time)

library(lubridate)
pow_df$datetime<-ymd_hms(pow_df$datetime)

png(filename='plot2.png')
with(pow_df,plot(datetime,Global_active_power,type='n',xlab='',ylab='Global Active Power (kilowatts)'))
with(pow_df,lines(datetime,Global_active_power))
dev.off()