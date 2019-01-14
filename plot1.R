##if (!file.exists(householdFile)) {
##download.file(downloadURL, downloadFile, method = "curl")
##unzip(downloadFile, overwrite = T, exdir = "./Data")

fileUrl="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,"power_consumption.zip")
unzip("power_consumption.zip")

rd <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

## Filter data                
fb <- subset(rd, Date %in% c("1/2/2007","2/2/2007"))

## Convert Dates

fb$Date <- as.Date(fb$Date, format="%d/%m/%Y")

## plot1 (hist)

hist(fb$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy (png,file="plot1.png", width=480, height=480)
dev.off()
