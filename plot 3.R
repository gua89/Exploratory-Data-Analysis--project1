## Download the data, called the data "data1", and subset the data by the condition of only subset the data with the Date of 2007-02-01 and 2007-02-02.
data1 <- read.table("household_power_consumption.txt",quote = "", sep=';', fill=TRUE, header=TRUE, na.strings = '')
mydata <- subset(data1, data1$Date == "1/2/2007"|data1$Date=="2/2/2007")
#convert the date and time variables
Newtimedata <- strptime(paste(mydata$Date, mydata$Time,sep = " "), "%d/%m/%Y %H:%M:%S")
Mydata <- cbind(mydata, Newtimedata)
Mydata$Date <- as.Date(Mydata$Date, format = "%d/%m/%Y")
Mydata$Time <- format(Mydata$Time, "%H:%M:%S")
#plot 3
# convert the class of the 3 variables to numerical varibals
Mydata$Sub_metering_1 <- as.numeric(as.character(Mydata$Sub_metering_1))
Mydata$Sub_metering_2 <- as.numeric(as.character(Mydata$Sub_metering_2))
Mydata$Sub_metering_3 <- as.numeric(as.character(Mydata$Sub_metering_3))
#save the file
png(filename = "plot 3.png", width = 480, height = 480)
with(Mydata, plot(Newtimedata,Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub metering"))
lines(Mydata$Newtimedata, Mydata$Sub_metering_2, type = "l", col = "red")
lines(Mydata$Newtimedata, Mydata$Sub_metering_3, type = "l", col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1, col = c("black","red","blue"))
dev.off()