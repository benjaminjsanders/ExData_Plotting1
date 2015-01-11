# This script will create plot2.png
# It is assumed that household_power_consumption.txt is in the working directory,
# and that you have sufficient memory to load it.

# Read in Data
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
data <- data[as.character(data$Date) == "1/2/2007" | as.character(data$Date) == "2/2/2007",]
data$datetime <- strptime(paste(as.character(data$Date),as.character(data$Time), sep = " ", collapse = NULL), format="%d/%m/%Y %H:%M:%S")


# Create plot2.png
png(filename="plot2.png", height=480, width=480, bg = "transparent")
plot(data$datetime, data$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")
dev.off()

# cleanup
rm(data)