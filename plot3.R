rd <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

## Filter data                
fb <- subset(rd, Date %in% c("1/2/2007","2/2/2007"))

## Convert Dates

fb$Date <- as.Date(fb$Date, format="%d/%m/%Y")

## Convert Times
datetime <- paste(as.Date(fb$Date), fb$Time)
fb$Datetime <- as.POSIXct(datetime)


## plot 3

with(fb, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

