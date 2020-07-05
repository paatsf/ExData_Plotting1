setwd("C:/R Est/Coursera/ExData_Plotting1")
data<- read.table("household_power_consumption.txt", h=T, sep = ";",
                  na.strings = "?")
data$Date<-as.Date(data$Date, format = "%d/%m/%Y")
str(data)
newdata <- data[which(data$Date == "2007-02-01" 
                       | data$Date == "2007-02-02" ),]

png(filename = "plot1.png", width = 480, height = 480, units = "px")

hist(newdata$Global_active_power, main = "Global Active Power", xlab = 
             "Global Active Power (kilowatts)", col = "red")
dev.off()
