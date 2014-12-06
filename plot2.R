#plot2.R

power_data = read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
power_data  <- power_data[power_data$Date %in% c("1/2/2007", "2/2/2007"),]
power_data$Global_active_power <- as.numeric(power_data$Global_active_power)
power_data$Date <- as.Date(power_data$Date, format="%d/%m/%Y" )
#add datetime column
power_data$datetime <- paste(power_data$Date, power_data$Time)
power_data$datetime <- strptime(power_data$datetime, "%Y-%m-%d %H:%M:%S")

#set locale to english  (in linux)
Sys.setlocale("LC_TIME", "en_US.UTF-8")
png("plot2.png")
plot(power_data$datetime, power_data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()