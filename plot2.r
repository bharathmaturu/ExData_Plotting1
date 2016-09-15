library(dplyr)
library(data.table)

setwd("C:/Bharath/Bharath's/Data Science using R John HPKNS/Exploratory Data Analysis - Course4/")
dataFile <- "./exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=';', stringsAsFactors = FALSE, dec = ".")
SubsetofData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
datetime <- strptime(paste(SubsetofData$Date, SubsetofData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(SubsetofData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
