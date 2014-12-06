#plot1.R

power_data = read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
power_data  <- power_data[power_data$Date %in% c("1/2/2007", "2/2/2007"),]
power_data$Global_active_power <- as.numeric(power_data$Global_active_power)
power_data$Date <- as.Date(power_data$Date, format="%d/%m/%Y" )
png("plot1.png")
hist(power_data$Global_active_power,  ylim=c(0,1200),  main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
dev.off()

