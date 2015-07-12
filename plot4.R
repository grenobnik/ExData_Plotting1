# download the file if necessary
if (!file.exists("household_power_consumption.txt")) {
  if (!file.exists("exdata-data-household_power_consumption.zip")) {
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="exdata-data-household_power_consumption.zip", method="curl")
  }
  unzip("exdata-data-household_power_consumption.zip")
}

# load data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# extract selected dates
data <- rbind(data[data$Date=="1/2/2007",], data[data$Date=="2/2/2007",])


# fgure 4 - 2x2 plot
png(filename="plot4.png")
par(mfcol=c(2,2))

plot(data$Global_active_power, typ='l', xaxt = "n", xlab=NA, ylab="Global Active Power")
par(tcl= -0.5)
axis(1, at=c(1,nrow(data)/2,nrow(data)), labels=c("Thu","Fri","Sat"), lwd=0, lwd.ticks=2)

plot(data$Sub_metering_1, typ='l', xaxt = "n", xlab=NA, ylab="Energy sub mettering")
par(tcl= -0.5)
axis(1, at=c(1,nrow(data)/2,nrow(data)), labels=c("Thu","Fri","Sat"), lwd=0, lwd.ticks=2)
lines(data$Sub_metering_2, col="red")
lines(data$Sub_metering_3, col="blue")
legend("topright", names(data)[7:9], bty="n", lty=c(1,1,1), lwd=c(2.5,2.5, 2.5), col=c("black", "red", "blue"))

plot(data$Voltage, typ='l', xaxt = "n", xlab="datetime", ylab="Voltage")
par(tcl= -0.5)
axis(1, at=c(1,nrow(data)/2,nrow(data)), labels=c("Thu","Fri","Sat"), lwd=0, lwd.ticks=2)

plot(data$Global_reactive_power, typ='l', xaxt = "n", xlab="datetime", ylab="Global_reactive_power")
par(tcl= -0.5)
axis(1, at=c(1,nrow(data)/2,nrow(data)), labels=c("Thu","Fri","Sat"), lwd=0, lwd.ticks=2)

dev.off()

