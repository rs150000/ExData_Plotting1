## plot3
## assumes that the source has been unzipped and located in windows directory c:\\explore
## all plot files contain the data create and prep steps so each file stands alone
## however if all plot were to be run in a single session, only one instance of data prep would be needed

## data prep
hhpower <- read.table("c:\\explore\\household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
hhpower$Time <- paste(hhpower$Date,hhpower$Time)
hhpower$Time <- strptime(hhpower$Time, format = "%d/%m/%Y %H:%M:%S")
hhpower$Date <- as.Date(hhpower$Date, format = "%d/%m/%Y")
hhpower2 <- hhpower[hhpower$Date == "2007-02-01" | hhpower$Date == "2007-02-02" , ]

## plot creation
png(filename = "plot3.png")
plot(hhpower2$Time, hhpower2$Sub_metering_1, type = "l", col = "black",xlab = "" ,ylab = "Energy sub metering" )
lines(hhpower2$Time, hhpower2$Sub_metering_2, type = "l", col = "red" )
lines(hhpower2$Time, hhpower2$Sub_metering_3, type = "l", col = "blue" )
legend("topright"
       ,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,lty = c(1, 1, 1)
       ,col = c("black","red","blue") )
dev.off()