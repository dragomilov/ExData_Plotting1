# Read file & extract dataset required
data        <- read.table("household_power_consumption.txt", header = TRUE, quote = "", sep = ";")
data        <- data[data$Date == "1/2/2007"|data$Date == "2/2/2007",]

# Conversion
GAP <- as.numeric(as.character(data$Global_active_power))

# Build histogram & write it into a png file
png("plot1.png")
hist(GAP, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()