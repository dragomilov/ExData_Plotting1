# Read file & extract dataset required
data        <- read.table("household_power_consumption.txt", header = TRUE, quote = "", sep = ";")
data        <- data[data$Date == "1/2/2007"|data$Date == "2/2/2007",]

# Conversions
data$DateTime               <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Global_active_power    <- as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power  <- as.numeric(as.character(data$Global_reactive_power))
data$Voltage                <- as.numeric(as.character(data$Voltage))
data$Sub_metering_1         <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2         <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3         <- as.numeric(as.character(data$Sub_metering_3))

# Plot graph & write it into a png file
png("plot4.png")
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
    plot(DateTime, Global_active_power, pch = 20, type="l", ylab="Global Active Power", xlab="")
    plot(DateTime, Voltage, pch = 20, type="l", ylab="Voltage", xlab="datetime")
    plot(DateTime , Sub_metering_1, pch = 20, type="l", ylab="Energy Sub Metering", xlab="")
    lines(DateTime , Sub_metering_2, type="l", col = "red")
    lines(DateTime , Sub_metering_3, type="l", col = "blue")
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(DateTime, Global_reactive_power, pch = 20, type="l", xlab="datetime")
})   
dev.off()
