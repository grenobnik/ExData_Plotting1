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


# figure 2 - Global Active Power at time/date
png(filename="plot2.png")
plot(data$Global_active_power, typ='l', xaxt = "n", xlab=NA, ylab="Global Active Power (kilowatts)")
par(tcl= -0.5)
axis(1, at=c(1,nrow(data)/2,nrow(data)), labels=c("Thu","Fri","Sat"), lwd=0, lwd.ticks=2)
dev.off()
