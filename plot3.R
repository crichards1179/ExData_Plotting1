# Process raw data
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#read in data, change ? to NA
d <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?", stringsAsFactors = F)

# change date column to date format in original dataframe
d$Date <- as.Date(d$Date, format="%d/%m/%Y")

# filter out applicable dates in to new data frame
d2 <- subset(d, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Change date column to date format, combine date and time columns in it's own dataframe
dt <- paste(as.Date(d2$Date), d2$Time)

# add new date/time dataframe as a column to subsetted dataframe.
d2$DateTime <- as.POSIXct(dt)

# Create Plot 3
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
png("plot3.png", 480, 480) ; par(mar=c(6, 4, 3, 2) + 0.1)
plot(d2$Sub_metering_1~d2$DateTime, 
     ylab="Energy Sub metering", 
     xlab="",
     type="l"
    )
lines(d2$Sub_metering_2~d2$DateTime, col = "red")
lines(d2$Sub_metering_3~d2$DateTime, col = "blue")

#add legend
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red","blue"),
       lty = 1,
       lwd = 3)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Save plot to file
#png("plot3.png") ; par(mar=c(6, 3, 3, 2) + 0.1)
#dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()