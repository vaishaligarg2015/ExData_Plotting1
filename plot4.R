classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
df <- read.table("household_power_consumption.txt", colClasses = classes, sep = ";", header = TRUE, nrow = 2075259, na.strings=c("?","NA"))
df$day <- paste(df[,1], df[,2], sep=" ")
df$day <- strptime(df$day, "%d/%m/%Y %H:%M:%S")
df <- subset(df, day >= "2007-02-01 00:00:00" & day <= "2007-02-02 23:59:00")

png("plot4.png", height = 480, width = 480)
par(mfrow = c(2,2))
with(df, {
    plot(df$day, df$Global_active_power, xlab = "", ylab = "Global Active Power(kilowatts)", type = "l")
    
    plot(df$day, df$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
    
    plot(df$day, df$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
    lines(df$day, df$Sub_metering_2,col="red",type="l")
    lines(df$ day, df$Sub_metering_3,col="blue",type="l")
    legend("topright", lty = c(1, 1, 1), bty = "n", xjust = 1, yjust = 1, col = c("black", "red", "blue"), legend =  c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    plot(df$day, df$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
})
dev.off()
