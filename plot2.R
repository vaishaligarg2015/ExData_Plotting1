classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
df <- read.table("household_power_consumption.txt", colClasses = classes, sep = ";", header = TRUE, nrow = 2075259, na.strings=c("?","NA"))
df$day <- paste(df[,1], df[,2], sep=" ")
df$day <- strptime(df$day, "%d/%m/%Y %H:%M:%S")
df <- subset(df, day >= "2007-02-01 00:00:00" & day <= "2007-02-02 23:59:00")

png("plot2.png", height = 480, width = 480)
plot(df$day, df$Global_active_power, xlab = "", ylab = "Global Active Power(kilowatts)", type = "l")
dev.off()
