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

# Create Plot 2
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
plot(d2$Global_active_power~d2$DateTime, 
     ylab="Global Active Power (kilowatts)", 
     xlab="",
     type="l"
    )

# Save plot to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()