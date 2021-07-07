library(dplyr)
library(datasets)
library(lubridate)

data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
data$Date <- strptime(data$Date, "%d/%m/%Y")

data2 <- subset(data, Date == strptime("2007-02-01","%Y-%m-%d") | Date == strptime("2007-02-02","%Y-%m-%d"))
data2$datetime <- as.POSIXct(paste(data2$Date,data2$Time), format = "%Y-%m-%d %H:%M:%S")
data2$Global_active_power <- as.numeric(data2$Global_active_power)

png(filename="plot4.png", width = 480, height = 480, units = "px")

par(mfrow=c(2,2), mar=c(4,4,2,2), oma=c(2,2,2,2))
with(data2,{
  plot(datetime,Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab="")
  plot(datetime,Voltage, type="l")
  plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  lines(datetime, Sub_metering_3, type = "l",col="blue")
  lines(datetime, Sub_metering_2, type = "l",col="red")
  legend("topright", legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col=c("black", "red", "blue"), lty=1,bty="n", cex = 0.6)
  plot(datetime, Global_reactive_power, type="l")
})
dev.off()