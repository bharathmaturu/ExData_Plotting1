library(dplyr)
library(data.table)

setwd("C:/Bharath/Bharath's/Data Science using R John HPKNS/Exploratory Data Analysis - Course4/")
dataFile <- "./exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=';', stringsAsFactors = FALSE, dec = ".")
SubsetofData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
globalActivePower <- as.numeric(SubsetofData$Global_active_power)

png("plot1.png", width=480, height=480)
hist(globalActivePower, col = "red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
