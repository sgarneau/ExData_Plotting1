# Read the data
whole_power_dataset <- read.csv("household_power_consumption.txt", sep=";")
# Subset based on date 
whole_power_dataset$Date <-as.Date(whole_power_dataset$Date, format='%d/%m/%Y')
febpowerset <- whole_power_dataset[whole_power_dataset$Date %in%  as.Date(c('2007-02-01','2007-02-02')), ]
# Setup Graphic device
png(file = "plot3.png")
# Make the plot
with(febpowerset, plot(strptime(paste(Date,Time), "%Y-%m-%d %H:%M:%S"),Sub_metering_1, type="l", ylab="Energy sub metering", xlab="",col="black"))
with(febpowerset, points(strptime(paste(Date,Time), "%Y-%m-%d %H:%M:%S"),Sub_metering_2, col="red"))
with(febpowerset, points(strptime(paste(Date,Time), "%Y-%m-%d %H:%M:%S"),Sub_metering_3, col="blue"))
legend("topright", pch="-", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering3"))
# Close the device
dev.off()

