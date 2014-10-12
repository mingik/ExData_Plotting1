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

# Convert date and time into new variable
timedate <- strptime( paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S");

# Plot the plots and save 'em
png(filename="plot3.png", height=480, width=480)

plot( timedate, data$Sub_metering_1, type="l", col='black', ylab="Energy sub metering", xlab="" )
points( timedate, data$Sub_metering_2, type="l", col='red', ylab="Energy sub metering", xlab="" )
points( timedate, data$Sub_metering_3, type="l", col='blue', ylab="Energy sub metering", xlab="" )
legend("topright", lty=1:1, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()