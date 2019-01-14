rd <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

## Filter data                
fb <- subset(rd, Date %in% c("1/2/2007","2/2/2007"))

## Convert Dates

fb$Date <- as.Date(fb$Date, format="%d/%m/%Y")

## Convert Times
datetime <- paste(as.Date(fb$Date), fb$Time)
fb$Datetime <- as.POSIXct(datetime)


## plot4


par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(fb, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

### Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
