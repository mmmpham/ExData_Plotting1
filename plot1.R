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


## draw histogram
png("plot1.png",width=480,height=480)
hist(data$Global_active_power,
             xlab="Global Active Power (kilowatts)",
             col="red",
             main="Global Active Power")
dev.off()
