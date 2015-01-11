# This script will create plot4.png
# It is assumed that household_power_consumption.txt is in the working directory,
# and that you have sufficient memory to load it.

# Read in Data
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
data <- data[as.character(data$Date) == "1/2/2007" | as.character(data$Date) == "2/2/2007",]
data$datetime <- strptime(paste(as.character(data$Date),as.character(data$Time), sep = " ", collapse = NULL), format="%d/%m/%Y %H:%M:%S")


# Create plot
png(filename="plot4.png", height=480, width=480, bg = "transparent")
par(mfrow=c(2,2))
plot(data$datetime, data$Global_active_power, ylab="Global Active Power", xlab="", type="l")
plot(data$datetime, data$Voltage, ylab="Voltage", xlab="datetime", type="l")
plot(data$datetime, data$Sub_metering_1, ylab="Energy sub metering", xlab="", type="l")
lines(data$datetime, data$Sub_metering_2, col="red")
lines(data$datetime, data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=1, col=c("black","red", "blue"), bty = "n")
plot(data$datetime, data$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l")
dev.off()

# cleanup
rm(data)