# Read the power comsumption text file and load it to a dataframe
plotdata <- read.table("./data/household_power_consumption.txt", sep =";", header=TRUE)

# Extract only data for Feb 1st and 2nd
febplotdata <- subset(plotdata, grepl("^(1/2/2007|2/2/2007)", plotdata$Date))

# Convert the Date column to a date field
febplotdata$Date <- as.Date(febplotdata$Date, "%d/%m/%Y")

# Combine the Date and Time columns
febplotdata$CDate <- paste(febplotdata$Date,febplotdata$Time)
febplotdata$CDate <- strptime(febplotdata$CDate,"%Y-%m-%d %H:%M:%S")

# Generate the graph and save it as plot3.png
# Used the lines function to add plot additional variables on Y-axis
# Used the legend function to create the legend

png(file="plot3.png", width = 480, height = 480)
plot(febplotdata$CDate,as.character(febplotdata$Sub_metering_1),type="l",xlab="",ylab="Energy sub metering",yaxp=c(0,40,4),ylim=c(0,38))
#lines(febplotdata$CDate,(as.character(febplotdata$Sub_metering_2)-2)/5, type="l", col="red")
lines(febplotdata$CDate,as.character(febplotdata$Sub_metering_2), type="l", col="red")
lines(febplotdata$CDate,as.character(febplotdata$Sub_metering_3), type="l", col="blue")
legend("topright", lty=c(1,1,1), col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()
