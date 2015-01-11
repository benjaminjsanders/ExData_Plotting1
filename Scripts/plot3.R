# This script will create plot3.png
# It is assumed that household_power_consumption.txt is in the working directory,
# and that you have sufficient memory to load it.

# Read in Data
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
data <- data[as.character(data$Date) == "1/2/2007" | as.character(data$Date) == "2/2/2007",]
data$datetime <- strptime(paste(as.character(data$Date),as.character(data$Time), sep = " ", collapse = NULL), format="%d/%m/%Y %H:%M:%S")


# Create plot3.png
png(filename="plot3.png", height=480, width=480, bg = "transparent")
plot(data$datetime, data$Sub_metering_1, ylab="Energy sub metering", xlab="", type="l")
lines(data$datetime, data$Sub_metering_2, col="red")
lines(data$datetime, data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=1, col=c("black","red", "blue"))
dev.off()

# cleanup
rm(data)