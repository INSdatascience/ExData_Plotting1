power <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", nrows = 2075259, header = TRUE)## load data
png(filename = "plot1.png", width = 480, height = 480)
hist(power$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()##dev off