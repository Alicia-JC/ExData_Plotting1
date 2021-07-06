library(dplyr)
library(datasets)

data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
data$Date <- strptime(data$Date, "%d/%m/%Y")

data2 <- subset(data, Date == strptime("2007-02-01","%Y-%m-%d") | Date == strptime("2007-02-02","%Y-%m-%d"))

data2$Global_active_power <- as.numeric(data2$Global_active_power)

plot1 <- hist(data2$Global_active_power,main = "Global Active Power",
              xlab = "Global Active Power (kilowatts)",
              ylab = "Frequency",
              col = "red",
              breaks = 12,
              xlim=c(0,6),
              xaxt="n",
              yaxt="n"
              )
axis(side=1,at=c(0,2,4,6))
axis(side=2, at=c(0,200,400,600,800,1000,1200))

png(filename="plot1.png", width = 480, height = 480, units = "px")
