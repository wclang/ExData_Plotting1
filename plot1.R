# first of four plotting scripts for Course Project 1
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

# first plot
png(filename = "plot1.png", width = 480, height = 480)
with(DF2, hist(Global_active_power,
               col="red",
               main="Global Active Power",
               xlab="Global Active Power (kilowatts)"))
dev.off()
