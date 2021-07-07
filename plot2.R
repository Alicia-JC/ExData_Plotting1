library(dplyr)
library(datasets)
library(lubridate)

data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
data$Date <- strptime(data$Date, "%d/%m/%Y")

data2 <- subset(data, Date == strptime("2007-02-01","%Y-%m-%d") | Date == strptime("2007-02-02","%Y-%m-%d"))

data2$Global_active_power <- as.numeric(data2$Global_active_power)

data2$exacttime <- as.POSIXct(paste(data2$Date,data2$Time), format = "%Y-%m-%d %H:%M:%S")

plot2 <- plot(Global_active_power~exacttime, data2, type="l", ylab = "Global Active Power (kilowatts)")

