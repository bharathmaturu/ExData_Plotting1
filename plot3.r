library(dplyr)
library(data.table)

setwd("C:/Bharath/Bharath's/Data Science using R John HPKNS/Exploratory Data Analysis - Course4/")
dataFile <- "./exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=';', stringsAsFactors = FALSE, dec = ".")
SubsetofData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
datetime <- strptime(paste(SubsetofData$Date, SubsetofData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(SubsetofData$Global_active_power)

subMetering1 <- as.numeric(SubsetofData$Sub_metering_1)
subMetering2 <- as.numeric(SubsetofData$Sub_metering_2)
subMetering3 <- as.numeric(SubsetofData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()
