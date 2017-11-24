setwd("C:\\Users\\alexandru.toth\\datasciencecoursera\\DataPlotting-Week1")
household <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE)

#this works fine on Windows 8.1, 8 GB memory

# We will only be using data from the dates 2007-02-01 and 2007-02-02
feb <- subset(household, Date=="1/2/2007"|Date=="2/2/2007")

#format dates
feb$Date2 <- as.Date(feb$Date, "%d/%m/%Y")
feb$DateTime <- strptime(paste(feb$Date2, feb$Time), "%Y-%m-%d %H:%M:%S")

#numbers
feb$Global_active_power <- as.numeric(feb$Global_active_power)

#plot
hist(feb$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

#save to file
dev.copy(png, "plot1.png", width=480, height=480, units="px")
dev.off()
