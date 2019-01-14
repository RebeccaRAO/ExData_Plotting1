rd <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

## Filter data                
fb <- subset(rd, Date %in% c("1/2/2007","2/2/2007"))

## Convert Dates

fb$Date <- as.Date(fb$Date, format="%d/%m/%Y")


## plot2 (plot)

### Convert Times
datetime <- paste(as.Date(fb$Date), fb$Time)
fb$Datetime <- as.POSIXct(datetime)

### plot

with(fb, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()


