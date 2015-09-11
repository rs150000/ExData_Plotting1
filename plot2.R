## plot2
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
png(filename = "plot2.png")
plot(hhpower2$Time, hhpower2$Global_active_power
     ,type = "l"
     ,xlab = ""
     ,ylab = "Global Active Power (kilowatts)"
)
dev.off()