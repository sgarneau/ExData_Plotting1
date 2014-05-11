# Read the data
whole_power_dataset <- read.csv("household_power_consumption.txt", sep=";")
# Subset based on date 
whole_power_dataset$Date <-as.Date(whole_power_dataset$Date, format='%d/%m/%Y')
febpowerset <- whole_power_dataset[whole_power_dataset$Date %in%  as.Date(c('2007-02-01','2007-02-02')), ]
# Setup Graphic device
png(file = "plot2.png")
# Make the plot
plot(strptime(paste(febpowerset$Date,febpowerset$Time), "%Y-%m-%d %H:%M:%S"), febpowerset$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
# Close the device
dev.off()

