## download zip file
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
dateDownloaded <- date()

## unzip data
unzip(temp)
table.df <- read.table("household_power_consumption.txt", sep=";", na.strings="?", skip=66637, nrows=2880)
headers <- read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows=1)
colnames(table.df) <- colnames(headers)
x <- paste(table.df$Date,table.df$Time)
table.df$Time <- strptime(x, format="%d/%m/%Y %H:%M:%S")


# Plot 4
png(file = "plot4.png")
par(mar = c(4,4,4,2))
par(mfcol = c(2,2))

plot(table.df$Time, table.df$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

plot(table.df$Time, table.df$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
points(table.df$Time, table.df$Sub_metering_1, type="l", col="black")
points(table.df$Time, table.df$Sub_metering_2, type="l", col="red")
points(table.df$Time, table.df$Sub_metering_3, type="l", col="blue")
legend("topright", lwd=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(table.df$Time, table.df$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(table.df$Time, table.df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()