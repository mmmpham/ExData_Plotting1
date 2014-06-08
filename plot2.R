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

## draw plot
png("plot2.png",width=480,height=480)
plot(x=times,y=data$Global_active_power,
     xlab="",
     ylab="Global Active Power (kilowatts)",
     type="l")
dev.off()
