
#plot4
#upload data
file <- "./household_power_consumption.txt"
values <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE)
#coerce date
values$Date <- as.Date(values$Date, format = "%d/%m/%Y")
#subset for February 1st and 2nd, 2007 
sub.values <- subset(values, Date >= "2007-02-01" & Date <= "2007-02-02")
#combine date and time 
wkday <- strptime(paste(sub.tf$Date, sub.tf$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")
#covert sub_meters to numeric 
sub.tf$Sub_metering_1<- as.numeric(sub.tf$Sub_metering_1)
sub.tf$Sub_metering_2<- as.numeric(sub.tf$Sub_metering_2)
sub.tf$Sub_metering_3<- as.numeric(sub.tf$Sub_metering_3)
#open png
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
#Global Active Power plot
plot(wkday, sub.values$Global_active_power, ylab = 
       "Global Active Power (kilowatts)", xlab = " ", type = "l")
#Voltage conversion
sub.tf$Voltage <- as.numeric(sub.tf$Voltage)
#Voltage plot
plot(wkday, sub.tf$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
#Metering plot
plot(wkday, sub.tf$Sub_metering_1,
     type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
lines(wkday, sub.tf$Sub_metering_2, col = "red", type = "l")
lines(wkday, sub.tf$Sub_metering_3, col = "blue", type = "l")
legend("topright", legend = c("Sub_metering_1",
                              "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"))
#Covert Global_reactive_power to numeric
sub.tf$Global_reactive_power <- as.numeric(sub.tf$Global_reactive_power)
#plot Global_reactive_power
plot(wkday, sub.tf$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")
dev.off()



