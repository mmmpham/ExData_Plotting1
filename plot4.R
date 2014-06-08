## read in data
file <- "household_power_consumption.txt"
names <- read.table(file,sep=";",colClasses="character",nrows=1)
names <- as.character(names[1,])

start_row = 66637
end_row = 69517
colClasses <- c("character","character",rep("numeric",7))
data <- read.table(file,
                   sep=";",
                   colClasses=colClasses,
                   col.names=names,
                   skip=start_row,
                   nrows=end_row - start_row,
                   na.strings="?")

## get time
times <- strptime(paste(data[,1], data[,2]),
                  format="%d/%m/%Y %H:%M:%S")

## plot
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))
{
plot(x=times,y=data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")
plot(x=times,y=data$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage")
plot(x=times,y=data$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering")
lines(x=times,y=data$Sub_metering_2,
      col="red")
lines(x=times,y=data$Sub_metering_3,
      col="blue")
legend("topright",
       lty="solid",
       col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       bty="n")
plot(x=times,y=data$Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")
}
dev.off()