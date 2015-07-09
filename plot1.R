library(plyr)
# setwd("course04")
rawdata<-read.table("household_power_consumption.txt", stringsAsFactors=FALSE, header=TRUE,sep=";", na.strings = "?", 
  colClasses=c(rep("character",2),rep("numeric",7)))
plotdata<-subset(rawdata, rawdata$Date == "1/2/2007" | rawdata$Date == "2/2/2007")
plotdata <- mutate(plotdata, datetime = as.POSIXlt(paste(as.Date(plotdata$Date, "%d/%m/%Y"), plotdata$Time)))
View(plotdata)
# 1. Histogram
windows(width=480, height=480)
hist(plotdata$Global_active_power, col="red")

# 2. Line chart
# windows(width=480, height=480)
# plot(plotdata$datetime, plotdata$Global_active_power, type="n")
# lines(plotdata$datetime, plotdata$Global_active_power, col="black")

# 3. Multiple line chart
# windows(width=480, height=480)
# with(plotdata, { plot(datetime, Sub_metering_1, type="n");
# lines(datetime, Sub_metering_1, col="black");
# lines(datetime, Sub_metering_2, col="red");
# lines(datetime, Sub_metering_3, col="blue");
# legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
#        lty=c(1,1,1), lwd=c(2.5, 2.5, 2.5), col=c("black", "red", "blue"))})


# 4. 2x2 plots
# par(mfrow=c(2,2))
# with(plotdata, { plot(datetime, Global_active_power, type="n");
#       lines(datetime, Global_active_power, col="black")})
# with(plotdata, { plot(datetime, Voltage, type="n");
#        lines(datetime, Voltage, col="black")})
# with(plotdata, { plot(datetime, Sub_metering_1, type="n");
# lines(datetime, Sub_metering_1, col="black");
# lines(datetime, Sub_metering_2, col="red");
# lines(datetime, Sub_metering_3, col="blue");
# legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
#        lty=c(1,1,1), lwd=c(2.5, 2.5, 2.5), col=c("black", "red", "blue"), bty="n")})
# with(plotdata, { plot(datetime, Global_reactive_power, type="n");
#      lines(datetime, Global_active_power, col="black")})


# with(plotdata, plot(x,y))
# title(main = "main")
# dev.copy(png, file = "xxx.png")
# dev.off()
