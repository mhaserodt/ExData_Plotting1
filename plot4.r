##set working directory
setwd("c:/Users/marc.haserodt/ExData_Plotting1")
##get data and unzip
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="./household_power_consumption.zip")
unzip("household_power_consumption.zip", overwrite = T)
##name .txt file to variable for easier use
power <-"./household_power_consumption.txt"

##manipulate the dataset
firstPlot <- read.table(power, header=T, sep=";", na.strings="?")

##get just the dates requested
getDate <- firstPlot[firstPlot$Date %in% c("1/2/2007","2/2/2007"),]
##set time parameters
getTime <-strptime(paste(getDate$Date, getDate$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
##merge it all back together
endData <- cbind(getTime, getDate)



##Generate plot 4 PNG
png(file="plot4.png", height = 480, width = 480, units = "px")
par(mfrow=c(2,2))
plot(endData$getTime, endData$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(endData$getTime, endData$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(endData$getTime, endData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(endData$getTime, endData$Sub_metering_2, type="l", col="red")
lines(endData$getTime, endData$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","red","blue"))
plot(endData$getTime, endData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()