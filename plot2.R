# Read file & extract dataset required
data        <- read.table("household_power_consumption.txt", header = TRUE, quote = "", sep = ";")
data        <- data[data$Date == "1/2/2007"|data$Date == "2/2/2007",]

# Conversions
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

# Plot graph & write it into a png file
png("plot2.png")
plot(data$DateTime, data$Global_active_power, pch = 20, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()