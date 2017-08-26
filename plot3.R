
#plot3
#upload data
file <- "./household_power_consumption.txt"
values <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE)
#coerce date
values$Date <- as.Date(values$Date, format = "%d/%m/%Y")
#subset for February 1st and 2nd, 2007 
sub.values <- subset(values, Date >= "2007-02-01" & Date <= "2007-02-02")
#combine date and time 
wkday <- strptime(paste(sub.tf$Date, sub.tf$Time, sep = " ") format = "%Y-%m-%d %H:%M:%S")
#covert sub_meters to numeric 
sub.tf$Sub_metering_1<- as.numeric(sub.tf$Sub_metering_1)
sub.tf$Sub_metering_2<- as.numeric(sub.tf$Sub_metering_2)
sub.tf$Sub_metering_3<- as.numeric(sub.tf$Sub_metering_3)
#open png
png("plot3.png", width = 480, height = 480)
#make plot
plot(wkday, sub.tf$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
lines(wkday, sub.tf$Sub_metering_2, col = "red", type = "l")
lines(wkday, sub.tf$Sub_metering_3, col = "blue", type = "l")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue")
       , lty = 1, lwd =2.5)
#close png
dev.off()

