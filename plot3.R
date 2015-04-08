## read in raw data, taking care of the ? missing value
classes <- c(rep("character",2), rep("numeric",7))
rawData <- read.table(file = "E:/R/4.Exploratory/Project/household_power_consumption.txt", header = T, sep = ";",
                      colClasses = classes, nrows = 2075259, comment.char = "", stringsAsFactors = F, na.strings="?")

## subsetting to the 2 days, and drop the big table to release memory
data <- rawData[rawData$Date == "1/2/2007" | rawData$Date == "2/2/2007",]
remove(rawData)

# 1.Date: Date in format dd/mm/yyyy 
# 2.Time: time in format hh:mm:ss 
# 3.Global_active_power: household global minute-averaged active power (in kilowatt) 
# 4.Global_reactive_power: household global minute-averaged reactive power (in kilowatt) 
# 5.Voltage: minute-averaged voltage (in volt) 
# 6.Global_intensity: household global minute-averaged current intensity (in ampere) 
# 7.Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy).
# 8.Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy).
# 9.Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy).

## get time variable
tempTime <- paste(data$Date, data$Time)
y <- strptime(tempTime, "%d/%m/%Y %H:%M:%S")


### Plot 3
## save it to a PNG file with a width of 480 pixels and a height of 480 pixels
png("E:/R/4.Exploratory/Project/ExData_Plotting1/plot3.png", width=480, height=480)
plot(y, data$Sub_metering_1, type = "l", xlab="", ylab = "Energy sub metering")
lines(y, data$Sub_metering_2, type = "l", col = "red")
lines(y, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1))
dev.off()
