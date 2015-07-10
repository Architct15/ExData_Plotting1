# Project Name: Explorative Data Analysis Project 1
# Part        : Plot 1 - Histogram for Global Active Power
# Input Data  : downloaded and unzipped "household_power_consumption.txt 
# Output Data : Global Active Power histogram in png format - "plot1.png"
# Processing logic:
# 1. Read raw data and assign data types
# 2. Subset the data for selected 2 days
# 3. Cleanse the data to get the right date-time for each row
# 4. Open windows device and plot histogram
# 5. Save plot to working directory

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
hist(plotdata$Global_active_power, col="red", 
     main="Global Active Power", xlab = "Global Active Power (kilowatts)")

# Save plot to working directory
dev.copy(png, file = "plot1.png")
dev.off()

