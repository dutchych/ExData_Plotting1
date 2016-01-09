cns <- colnames(read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows=1))
data1 <- read.table("household_power_consumption.txt", col.names = cns,
                    sep = ";", na.strings=c("?"), skip=66637, nrows=69517-66638+1,
                    colClasses=c(rep("character",2),rep("numeric",7)))
data1$Date_time <- strptime(paste(data1$Date, data1$Time), format ="%d/%m/%Y %H:%M:%S")
data1 <- data1[c(10,3:9)]
plot.new()
png(file="plot2.png")
with(data1, plot(Date_time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()