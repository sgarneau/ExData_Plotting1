# Read the data
whole_power_dataset <- read.csv("household_power_consumption.txt", sep=";")
# Subset based on date 
whole_power_dataset$Date <-as.Date(whole_power_dataset$Date, format='%d/%m/%Y')
febpowerset <- whole_power_dataset[whole_power_dataset$Date %in%  as.Date(c('2007-02-01','2007-02-02')), ]
# Setup Graphic device
png(file = "plot4.png")
# Make the plot
par(mfrow=c(2,2))
with(febpowerset, 
{
plot(strptime(paste(febpowerset$Date,febpowerset$Time), "%Y-%m-%d %H:%M:%S"), febpowerset$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(strptime(paste(febpowerset$Date,febpowerset$Time), "%Y-%m-%d %H:%M:%S"), as.numeric(levels(febpowerset$Voltage)[febpowerset$Voltage]), type="l", ylab="Voltage", xlab="datetime")
with(febpowerset, plot(strptime(paste(Date,Time), "%Y-%m-%d %H:%M:%S"),Sub_metering_1, type="l", ylab="Energy sub metering", xlab="",col="black"))
with(febpowerset, points(strptime(paste(Date,Time), "%Y-%m-%d %H:%M:%S"),Sub_metering_2, col="red"))
with(febpowerset, points(strptime(paste(Date,Time), "%Y-%m-%d %H:%M:%S"),Sub_metering_3, col="blue"))
legend("topright", pch="-", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering3"))
plot(strptime(paste(febpowerset$Date,febpowerset$Time), "%Y-%m-%d %H:%M:%S"), febpowerset$Global_reactive_power, type="l", ylab="Global Reactive Power (kilowatts)", xlab="datetime")
}
)
# Close the device
dev.off()

