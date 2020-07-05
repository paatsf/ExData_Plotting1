setwd("C:/R Est/Coursera/ExData_Plotting1")
data<- read.table("household_power_consumption.txt", h=T, sep = ";",
                  na.strings = "?")
data$Date<-as.Date(data$Date, format = "%d/%m/%Y")
newdata <- data[which(data$Date == "2007-02-01" 
                      | data$Date == "2007-02-02" ),]
rm(data)
newdata$DateTime <- strptime(paste(newdata$Date, newdata$Time, sep = " "), 
                             format =  "%Y-%m-%d %H:%M:%S")
png(filename = "plot3.png", width = 480, height = 480, units = "px")

plot(newdata$DateTime, newdata$Sub_metering_1, type = "l",
     xlab = " ", ylab = "Energy sub metering")
lines(newdata$DateTime, newdata$Sub_metering_2, type = "l", col = "red")
lines(newdata$DateTime, newdata$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
