pow_df<-read.csv('household_power_consumption.txt',sep=';',header=TRUE)
pow_df$Date<-as.Date(pow_df$Date,'%d/%m/%Y')

pow_df<-pow_df%>%filter(Date=='2007-02-01'|Date=='2007-02-02')

png(filename='plot1.png')
hist(pow_df$Global_active_power,col='red',main='Global Active Power',xlab='Global Active Power (kilowatts)')
dev.off()
