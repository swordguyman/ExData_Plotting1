#Download file onto workspace, then run this code
new <- read.table('./household_power_consumption.txt',sep=';',header=TRUE,nrows=70000)
new[,1] <- as.character(new[,1])
new[,2] <- as.character(new[,2])
for(i in 3:(length(new[1,])-1)){
	new[,i] <- as.numeric(as.character(new[,i]))	
}
newer <- new[new$Date == '2/2/2007'|new$Date == '1/2/2007',]
dummy <- data.frame(rep(NA,length(newer[,1])))
for(i in 1:length(newer[,1])){
	dummy[i,1] <- paste(newer[i,1],newer[i,2],sep=' ')
}
Date <- strptime(dummy[,1],format='%d/%m/%Y %H:%M:%S')
newest <- cbind(Date,newer[,3:length(newer[1,])])

#Create third plot
png('./plot3.png')
plot(x=newest[,1],y=newest[,6],xlab='',ylab='Energy sub metering',type='l',col='black')
points(x=newest[,1],y=newest[,7],col='red',type='l')
points(x=newest[,1],y=newest[,8],col='blue',type='l')
legend('topright',col=c('black','red','blue'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lwd=1)
dev.off()