# This script will create plot1.png
# It is assumed that household_power_consumption.txt is in the working directory,
# and that you have sufficient memory to load it.

# Read in Data
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
data <- data[as.character(data$Date) == "1/2/2007" | as.character(data$Date) == "2/2/2007",]
data$datetime <- strptime(paste(as.character(data$Date),as.character(data$Time), sep = " ", collapse = NULL), format="%d/%m/%Y %H:%M:%S")


# Create plot1.png
png(filename="plot1.png", height=480, width=480, bg = "transparent")
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()

# cleanup
rm(data)