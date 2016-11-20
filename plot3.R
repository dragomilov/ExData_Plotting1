# Read file & extract dataset required
data        <- read.table("household_power_consumption.txt", header = TRUE, quote = "", sep = ";")
data        <- data[data$Date == "1/2/2007"|data$Date == "2/2/2007",]

# Conversions
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

# Plot graph & write it into a png file
png("plot3.png")
with(data, {
    plot(DateTime , Sub_metering_1, pch = 20, type="l", ylab="Global Active Power (kilowatts)", xlab="")
    lines(DateTime , Sub_metering_2, type="l", col = "red")
    lines(DateTime , Sub_metering_3, type="l", col = "blue")
})   
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
