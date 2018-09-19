# Download the data, called the data "data1", and subset the data by the condition of only subset the data with the Date of 2007-02-01 and 2007-02-02.
data1 <- read.table("household_power_consumption.txt",quote = "", sep=';', fill=TRUE, header=TRUE, na.strings = '')
mydata <- subset(data1, data1$Date == "1/2/2007"|data1$Date=="2/2/2007")
#plot 1, save the file
png(filename = "plot 1.png", width = 480, height = 480)
hist(as.numeric(as.character(mydata$Global_active_power)), main = "Global Active Power", xlab = "Global Active Power(kilowatts)", ylab = "Frequency", col = "red")
dev.off()
