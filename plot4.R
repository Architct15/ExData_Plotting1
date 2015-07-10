# Project Name: Explorative Data Analysis Project 1
# Part        : Plot 4 - 2 by 2 plot of different perspective on global energy
# Input Data  : downloaded and unzipped "household_power_consumption.txt 
# Output Data : 2 by 2 plot of different perspective on global energy in png format - "plot2.png"
# Processing logic:
# 1. Read raw data and assign data types
# 2. Subset the data for selected 2 days
# 3. Cleanse the data to get the right date-time for each row
# 4. Open windows device and plot 4 charts of different perspectives on global energy
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
windows(width=480, height=480)

# set up 2 by 2 plot regions
par(mfrow=c(2,2), bg="white")

# plot top left 
with(plotdata, { plot(datetime, Global_active_power, type="n", xlab = "", ylab = "Global Active Power");
      lines(datetime, Global_active_power, col="black")})

# plot top right
with(plotdata, { plot(datetime, Voltage, type="n", xlab="datetime", ylab = "Voltage");
       lines(datetime, Voltage, col="black")})

# plot bottom left
with(plotdata, { plot(datetime, Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering");
lines(datetime, Sub_metering_1, col="black");
lines(datetime, Sub_metering_2, col="red");
lines(datetime, Sub_metering_3, col="blue");
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.75, 
       lty=c(1,1,1), lwd=c(2.5, 2.5, 2.5), col=c("black", "red", "blue"), bty="n")})

# plot bottom right
with(plotdata, { plot(datetime, Global_reactive_power, type="n", xlab = "datetime", ylab = "Global_reactive_power");
     lines(datetime, Global_reactive_power, col="black")})



# open png device and plot for better formatting
png("plot4.png", width=480, height=480, bg="white")

# set up 2 by 2 plot regions
par(mfrow=c(2,2))

# plot top left 
with(plotdata, { plot(datetime, Global_active_power, type="n", xlab = "", ylab = "Global Active Power");
                 lines(datetime, Global_active_power, col="black")})

# plot top right
with(plotdata, { plot(datetime, Voltage, type="n", xlab="datetime", ylab = "Voltage");
                 lines(datetime, Voltage, col="black")})

# plot bottom left
with(plotdata, { plot(datetime, Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering");
                 lines(datetime, Sub_metering_1, col="black");
                 lines(datetime, Sub_metering_2, col="red");
                 lines(datetime, Sub_metering_3, col="blue");
                 legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.75, 
                        lty=c(1,1,1), lwd=c(2.5, 2.5, 2.5), col=c("black", "red", "blue"), bty="n")})

# plot bottom right
with(plotdata, { plot(datetime, Global_reactive_power, type="n", xlab = "datetime", ylab = "Global_reactive_power");
                 lines(datetime, Global_reactive_power, col="black")})

# close png device
dev.off()
