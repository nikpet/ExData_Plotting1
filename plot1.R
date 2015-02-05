#Read data
data <- read.table("household_power_consumption.txt", h=1, sep=";", colClasses=c("character", "character", rep("numeric", 7)), na.strings="?")
#Subset only the needed Data
subData <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007") 
#Delete data variable to free up some memory
rm(data)


#Set graphics device to pgn with the needed params
png(filename="plot1.png",width = 480, height = 480)
#Set the background color to transparent
par(bg=NA)
#Plot the diagram
hist(subData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
#Close the graphics device
dev.off()