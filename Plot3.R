# Downloading & extracting data
fileurl <- "http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
download.file(fileurl,destfile = "data.zip")
unzip("data.zip")

# Reading & inspecting data into R
dt <- read.table("household_power_consumption.txt",header = TRUE, sep= ";", na.strings = "?")
str(dt)
summary(dt)
head(dt)
names(dt)

# Formatting date fields into the required format & extracting date range
dt$DateTime <- paste(dt$Date, dt$Time)
dt$DateTime <- strptime(dt$DateTime, "%d/%m/%Y %H:%M:%S")
head(dt$DateTime)

dtextract <- subset(dt,DateTime >= strptime("2007-02-01 00:00:00", "%Y-%m-%d %H:%M:%S") & DateTime <= strptime("2007-02-02 23:59:59","%Y-%m-%d %H:%M:%S"))
head(dtextract$DateTime)
tail(dtextract$DateTime)

#Plot 3
plot(dtextract$DateTime, dtextract$Sub_metering_1,type='l', ylab ="Energy sub metering", xlab="")
lines(dtextract$DateTime, dtextract$Sub_metering_2, type='l', col='red')
lines(dtextract$DateTime, dtextract$Sub_metering_3, type='l', col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col=c("black","red","blue"))
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()