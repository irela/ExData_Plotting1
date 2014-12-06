#plot3.R

power_data = read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
power_data  <- power_data[power_data$Date %in% c("1/2/2007", "2/2/2007"),]
power_data$Sub_metering_1 <- as.numeric(power_data$Sub_metering_1)
power_data$Sub_metering_2 <- as.numeric(power_data$Sub_metering_2)
power_data$Sub_metering_3 <- as.numeric(power_data$Sub_metering_3)

power_data$Date <- as.Date(power_data$Date, format="%d/%m/%Y" )
#add datetime column
power_data$datetime <- paste(power_data$Date, power_data$Time)
power_data$datetime <- strptime(power_data$datetime, "%Y-%m-%d %H:%M:%S")

#set locale to english  (in linux)
Sys.setlocale("LC_TIME", "en_US.UTF-8")
png("plot3.png")
plot(power_data$datetime, power_data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(power_data$datetime, power_data$Sub_metering_2, col="red")
lines(power_data$datetime, power_data$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()