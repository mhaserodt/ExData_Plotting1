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



##Generate plot 2 PNG
png(file="plot2.png", height = 480, width = 480, units = "px")
plot(endData$getTime, endData$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()