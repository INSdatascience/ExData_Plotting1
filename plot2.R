library(dplyr)
power <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", nrows = 2075259, header = TRUE)
powerdf <- tbl_df(power)
powerdf <- mutate(powerdf, newDate = as.Date(Date,'%d/%m/%Y'))
powerdf <- filter(powerdf, newDate == "2007-02-01" | newDate == "2007-02-02")
powerdf <- mutate(powerdf, datetime = as.POSIXct(paste(newDate, Time), format="%Y-%m-%d %H:%M:%S"))
png(filename = "plot2.png", width = 480, height = 480)

plot(powerdf$datetime, powerdf$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")##graph

dev.off()