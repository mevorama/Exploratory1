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



# Plot 2
png(file = "plot2.png")
par(mar = c(2,5,2,2))
plot(table.df$Time, table.df$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()