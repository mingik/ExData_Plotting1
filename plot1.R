# Download Data & Read it into table

temp <- tempfile()
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, temp, method="curl")
alldata <- read.table( unz(temp, "household_power_consumption.txt"), sep=";", header=TRUE, na.strings="?", stringsAsFactor=FALSE );
unlink(temp)

# Filter out the dates

startDate <- as.Date("01/02/2007",format="%d/%m/%Y");
endDate <- as.Date("02/02/2007",format="%d/%m/%Y");
data <- alldata[ as.Date(alldata$Date, format="%d/%m/%Y") >=startDate & as.Date(alldata$Date, format="%d/%m/%Y") <= endDate, ]

# Plot the plot and save it

png(filename="plot1.png", height=480, width=480)

hist( data$Global_active_power, xlab = "Global Active Power (kilowatts)", main="Global Active Power", col="red")

dev.off()

