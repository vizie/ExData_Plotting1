t<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
t$dt <- paste(t$Date, t$Time, sep=" ")
t$NewDate <- strptime(t$dt, "%d/%m/%Y %H:%M:%S")
sub<- subset(t, t$NewDate >= as.POSIXct('2007-02-01 00:00:00') & t$NewDate < as.POSIXct('2007-02-03 00:00:00'))
final<-na.omit(sub)


png("plot3.png")
plot(final$NewDate, final$Sub_metering_1, type="n", xlab="",ylab="Energy sub metering")
lines(final$NewDate, final$Sub_metering_1)
lines(final$NewDate, final$Sub_metering_2, col="red")
lines(final$NewDate, final$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue"), lty=c(1,1,1))
dev.off()
