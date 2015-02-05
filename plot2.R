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
png(filename="plot2.png",width = 480, height = 480)
#Set the background color to transparent
par(bg=NA)
#Plot the diagram
plot(datetime, subData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#Close the graphics device
dev.off()