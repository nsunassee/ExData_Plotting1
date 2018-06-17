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

## Plotting Charts
# Plot 1
hist(dtextract$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)", col="red")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()