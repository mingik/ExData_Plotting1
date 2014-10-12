% Loading the Data

alldata <- read.csv( "household_power_consumption.txt", sep=";" );

data <- alldata[ (alldata$Date=="2/1/2007") | (alldata$Date=="2/2/2007") , ];

data$Date = as.Date( data$Date, format="%m/%d/%Y" );

timedate <- strptime( paste(data$Date,data$Time), "%Y-%m-%d %H:%M:%S");

data$Time <- timedate;

colnames(data)[2] <- "DateTime";

% Making Plots

data$Global_active_power = as.integer( data$Global_active_power )

%% Plot1






