## Download the data, called the data "data1", and subset the data by the condition of only subset the data with the Date of 2007-02-01 and 2007-02-02.
data1 <- read.table("household_power_consumption.txt",quote = "", sep=';', fill=TRUE, header=TRUE, na.strings = '')
mydata <- subset(data1, data1$Date == "1/2/2007"|data1$Date=="2/2/2007")
Newtimedata <- strptime(paste(mydata$Date, mydata$Time,sep = " "), "%d/%m/%Y %H:%M:%S")
Mydata <- cbind(mydata, Newtimedata)
Mydata$Date <- as.Date(Mydata$Date, format = "%d/%m/%Y")
Mydata$Time <- format(Mydata$Time, "%H:%M:%S")
#plot 4
#convert the class of the variables to numerical variabls.
Mydata$Global_active_power <- as.numeric(as.character(Mydata$Global_active_power))
Mydata$Global_reactive_power <- as.numeric(as.character(Mydata$Global_reactive_power))
Mydata$Sub_metering_1 <- as.numeric(as.character(Mydata$Sub_metering_1))
Mydata$Sub_metering_2 <- as.numeric(as.character(Mydata$Sub_metering_2))
Mydata$Sub_metering_3 <- as.numeric(as.character(Mydata$Sub_metering_3))
Mydata$Voltage <- as.numeric(as.character(Mydata$Voltage))
#save the files.
png(filename = "plot 4.png", width = 480, height = 480)
par(mfrow = c(2,2))
with(Mydata,plot(Newtimedata,Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

with(Mydata,plot(Newtimedata,Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

with(Mydata, plot(Newtimedata,Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub metering"))
lines(Mydata$Newtimedata, Mydata$Sub_metering_2, type = "l", col = "red")
lines(Mydata$Newtimedata, Mydata$Sub_metering_3, type = "l", col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1, col = c("black","red","blue"))

with(Mydata,plot(Newtimedata,Global_reactive_power, type = "l", xlab = "", ylab = "Global_reactive_power"))
     
dev.off()