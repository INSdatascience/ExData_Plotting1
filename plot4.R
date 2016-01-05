library(dplyr)
power <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", nrows = 2075259, header = TRUE)
powerdf <- tbl_df(power)
powerdf <- mutate(powerdf, newDate = as.Date(Date,'%d/%m/%Y'))
powerdf <- filter(powerdf, newDate == "2007-02-01" | newDate == "2007-02-02")
powerdf <- mutate(powerdf, datetime = as.POSIXct(paste(newDate, Time), format="%Y-%m-%d %H:%M:%S"))
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
##1
plot(powerdf$datetime, powerdf$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
##2
plot(powerdf$datetime, powerdf$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
##3
plot(powerdf$datetime, powerdf$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(powerdf$datetime, powerdf$Sub_metering_2, col = "red")
lines(powerdf$datetime, powerdf$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
##4
plot(powerdf$datetime, powerdf$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()