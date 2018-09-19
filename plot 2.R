# Download the data, called the data "data1", and subset the data by the condition of only subset the data with the Date of 2007-02-01 and 2007-02-02.
data1 <- read.table("household_power_consumption.txt",quote = "", sep=';', fill=TRUE, header=TRUE, na.strings = '')
mydata <- subset(data1, data1$Date == "1/2/2007"|data1$Date=="2/2/2007")
#convert the data and time variables.
Newtimedata <- strptime(paste(mydata$Date, mydata$Time,sep = " "), "%d/%m/%Y %H:%M:%S")
Mydata <- cbind(mydata, Newtimedata)
Mydata$Date <- as.Date(Mydata$Date, format = "%d/%m/%Y")
Mydata$Time <- format(Mydata$Time, "%H:%M:%S")
#plot 2, save the file
png(filename = "plot 2.png", width = 480, height = 480)
Mydata$Global_active_power <- as.numeric(as.character(Mydata$Global_active_power))
with(Mydata,plot(Newtimedata,Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
