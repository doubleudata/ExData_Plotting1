#plot2
#upload data
file <- "./household_power_consumption.txt"
values <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE)
#coerce date
values$Date <- as.Date(values$Date, format = "%d/%m/%Y")
#subset for February 1st and 2nd, 2007 
sub.values <- subset(values, Date >= "2007-02-01" & Date <= "2007-02-02")
#cover global active power to numeric
sub.values$Global_active_power <- as.numeric(sub.values$Global_active_power)
#date and time combination
wkday <- strptime(paste(sub.values$Date, sub.values$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")
#open png file
png("plot2.png", width = 480, height = 480)
#plot 
plot(wkday, sub.values$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = " ", type = "l")
#close png
dev.off()


