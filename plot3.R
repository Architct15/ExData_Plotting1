# Project Name: Explorative Data Analysis Project 1
# Part        : Plot 3 - Engergy sub-metering plot for sub-meters 1 - 3
# Input Data  : downloaded and unzipped "household_power_consumption.txt 
# Output Data : Engergy sub-metering plot for sub-meters 1 - 3 in png format - "plot2.png"
# Processing logic:
# 1. Read raw data and assign data types
# 2. Subset the data for selected 2 days
# 3. Cleanse the data to get the right date-time for each row
# 4. Open windows device and plot multiple line chart
# 5. Open png device and plot to working directory

library(plyr)

# set working directory 
# setwd("course04")

# read the downloaded data file and assign proper class types (character or numberic)
rawdata<-read.table("household_power_consumption.txt", stringsAsFactors=FALSE, header=TRUE,sep=";", na.strings = "?", 
                    colClasses=c(rep("character",2),rep("numeric",7)))

# subset only the data for 2 days specified in the project 
plotdata<-subset(rawdata, rawdata$Date == "1/2/2007" | rawdata$Date == "2/2/2007")

# cleanse data by adding the right date-time for each row
plotdata <- mutate(plotdata, datetime = as.POSIXlt(paste(as.Date(plotdata$Date, "%d/%m/%Y"), plotdata$Time)))

# open windows device and plot
windows(width=480, height=480, bg="white")
with(plotdata, { plot(datetime, Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering");
                 lines(datetime, Sub_metering_1, col="black");
                 lines(datetime, Sub_metering_2, col="red");
                 lines(datetime, Sub_metering_3, col="blue");
                 legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                        lty=c(1,1,1), lwd=c(1, 1, 1), col=c("black", "red", "blue"))})

# open png device and plot to file for better formatting
png("plot3.png", width=480, height=480, bg="white")
with(plotdata, { plot(datetime, Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering");
                 lines(datetime, Sub_metering_1, col="black");
                 lines(datetime, Sub_metering_2, col="red");
                 lines(datetime, Sub_metering_3, col="blue");
                 legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                        lty=c(1,1,1), lwd=c(1, 1, 1), col=c("black", "red", "blue"))})

# close png plot device
dev.off()
