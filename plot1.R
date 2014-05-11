# Read the data
whole_power_dataset <- read.csv("household_power_consumption.txt", sep=";")
# Subset based on date 
whole_power_dataset$Date <-as.Date(whole_power_dataset$Date, format='%d/%m/%Y')
febpowerset <- whole_power_dataset[whole_power_dataset$Date %in%  as.Date(c('2007-02-01','2007-02-02')), ]
# Setup Graphic device
png(file = "plot1.png")
# Make the plot
hist(as.numeric(febpowerset$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
# Close the device
dev.off()

