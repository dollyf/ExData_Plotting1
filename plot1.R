# Read the power comsumption text file and load it to a dataframe
plotdata <- read.table("./data/household_power_consumption.txt", sep =";", header=TRUE)

# Extract only data for Feb 1st and 2nd of Feb 2007
febplotdata <- subset(plotdata, grepl("^(1/2/2007|2/2/2007)", plotdata$Date))

# Generate a histogram for the Global active power and save it as plot1.png
png(file="plot1.png", width = 480, height = 480)
hist(as.numeric(febplotdata$Global_active_power), xlab="Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()
