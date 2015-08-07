# Read the power comsumption text file and load it to a dataframe
plotdata <- read.table("./data/household_power_consumption.txt", sep =";", header=TRUE)

# Extract only data for Feb 1st and 2nd
febplotdata <- subset(plotdata, grepl("^(1/2/2007|2/2/2007)", plotdata$Date))

# Convert the Date column to a date field
febplotdata$Date <- as.Date(febplotdata$Date, "%d/%m/%Y")

# Combine the Date and Time columns
febplotdata$CDate <- paste(febplotdata$Date,febplotdata$Time)
febplotdata$CDate <- strptime(febplotdata$CDate,"%Y-%m-%d %H:%M:%S")

# Generate the graph and save it as plot2.png, label the axes as desired
png(file="plot2.png", width = 480, height = 480)
plot(febplotdata$CDate,as.character(febplotdata$Global_active_power),xlab="",ylab="Global Active Power (kilowatts)", type = "l")
dev.off()
