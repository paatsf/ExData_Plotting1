setwd("C:/R Est/Coursera/ExData_Plotting1")
data<- read.table("household_power_consumption.txt", h=T, sep = ";",
                  na.strings = "?")
data$Date<-as.Date(data$Date, format = "%d/%m/%Y")
newdata <- data[which(data$Date == "2007-02-01" 
                      | data$Date == "2007-02-02" ),]
rm(data)
newdata$DateTime <- strptime(paste(newdata$Date, newdata$Time, sep = " "), 
                            format =  "%Y-%m-%d %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480, units = "px")


plot(newdata$DateTime,newdata$Global_active_power, 
     type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")

dev.off()
