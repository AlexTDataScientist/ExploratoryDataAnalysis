setwd("C:\\Users\\alexandru.toth\\datasciencecoursera\\DataPlotting-Week1")
household <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE)

# We will only be using data from the dates 2007-02-01 and 2007-02-02
feb <- subset(household, Date=="1/2/2007"|Date=="2/2/2007")

#format dates
feb$Date2 <- as.Date(feb$Date, "%d/%m/%Y")
feb$DateTime <- strptime(paste(feb$Date2, feb$Time), "%Y-%m-%d %H:%M:%S")

#numbers
feb$Global_active_power <- as.numeric(feb$Global_active_power)

#drawing matrix
par(mfrow =c(2,2))

#plot 1
plot(feb$DateTime, feb$Global_active_power, type="l", xlab=NA, ylab="Global Active Power (kilowatts)")

#plot2
plot(feb$DateTime, feb$Voltage, type="l", xlab="date time", ylab="Voltage (V)")

#plot 3
plot(feb$DateTime, feb$Sub_metering_1, type="n", xlab=NA, ylab="Energy sub metering (kilowatts)")
lines(feb$DateTime, feb$Sub_metering_1, type="l",  col="black")
lines(feb$DateTime, feb$Sub_metering_2, type="l",  col="red")
lines(feb$DateTime, feb$Sub_metering_3, type="l",  col="blue")
legend("topright",lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#plot 4
plot(feb$DateTime, feb$Global_reactive_power, type="l", xlab="date time", ylab="Global reactive power (kW)")

dev.copy(png,"plot4.png", width=480, height=480,units="px")
dev.off()
