setwd("C:\\Users\\alexandru.toth\\datasciencecoursera\\DataPlotting-Week1")
household <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE)

# We will only be using data from the dates 2007-02-01 and 2007-02-02
feb <- subset(household, Date=="1/2/2007"|Date=="2/2/2007")

#format dates
feb$Date2 <- as.Date(feb$Date, "%d/%m/%Y")
feb$DateTime <- strptime(paste(feb$Date2, feb$Time), "%Y-%m-%d %H:%M:%S")

#numbers
feb$Global_active_power <- as.numeric(feb$Global_active_power)

#plot

plot(feb$DateTime, feb$Sub_metering_1, type="n", xlab=NA, ylab="Energy sub metering (kilowatts)")
lines(feb$DateTime, feb$Sub_metering_1, type="l",  col="black")
lines(feb$DateTime, feb$Sub_metering_2, type="l",  col="red")
lines(feb$DateTime, feb$Sub_metering_3, type="l",  col="blue")
legend("topright",lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#save to file
dev.copy(png,"plot3.png", width=480, height=480,units="px")
dev.off()
