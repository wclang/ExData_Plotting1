# fourth of four plotting scripts for Course Project 1
# (coursera Data Science specialization course 4)
# William Christopher Lang 2016-05-14

input.file <- "household_power_consumption.txt"
DF <- read.table(input.file, header=TRUE, sep=";", na.strings="?")
dates <- as.character(DF$Date)
times <- as.character(DF$Time)
x <- paste(dates,times)
datetime <- strptime(x,format="%d/%m/%Y %H:%M:%S")
DF$datetime <- datetime
DF2 <- subset(DF, "2007-01-31 23:59:59 EST" < datetime 
              & datetime < "2007-02-03 00:00:01 EST")

# fourth plot
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
# upper left
with(DF2, plot(datetime,Global_active_power,
               ylab="Global Active Power", xlab="", type="l"))
# upper right
with(DF2, plot(datetime, Voltage, type="l"))
# lower left
with(DF2, plot(datetime, Sub_metering_1, ylab="Energy sub metering", xlab=" ", type="l"))
with(DF2, points(datetime, Sub_metering_2, type="l", col="red"))
with(DF2, points(datetime, Sub_metering_3, type="l", col="blue"))
with(DF2, legend("topright", lty=c(1,1,1), col=c("black","red","blue"), bty="n",
                 legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")))
# lower right
with(DF2, plot(datetime, Global_reactive_power, type="l"))
dev.off()