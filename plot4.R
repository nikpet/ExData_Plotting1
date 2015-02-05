#Read data
data <- read.table("household_power_consumption.txt", h=1, sep=";", colClasses=c("character", "character", rep("numeric", 7)), na.strings="?")
#Subset only the needed Data
subData <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007") 
#Delete data variable to free up some memory
rm(data)
#Convert Date and Time columns into single POSIXlt vector
datetime  <- as.POSIXlt(paste(as.Date(subData$Date,format="%d/%m/%Y"), subData$Time, sep=" "))
#Set the Locale to english (so day names appear in english)
Sys.setlocale("LC_TIME", "English")


#Set graphics device to pgn with the needed params
png(filename="plot4.png",width = 480, height = 480)
#Set the background color to transparent
par(bg=NA)
#Set number of diagrams
par(mfrow = c(2,2))

#Plot diagram (1,1)
plot(datetime, subData$Global_active_power, type="l", xlab="", ylab="Global Active Power")

#Plot diagram (1,2)
plot(datetime, subData$Voltage, type="l", ylab="Voltage")

#Plot diagram (2,1)
plot(datetime, subData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
#Add the second diagram
lines(datetime, subData$Sub_metering_2, col="red")
#Add the third diagram
lines(datetime, subData$Sub_metering_3, col="blue")
#Add the legend
legend("topright", bty="n",legend=c(names(subData)[7:9]), col=c("black","red","blue"), lty=1)

#Plot diagram (2,2)
plot(datetime, subData$Global_reactive_power, type="l", ylab="Global_reactive_power")

#Close the graphics device
dev.off()