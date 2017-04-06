# Script for constructing plot 3

# Load the following packages
suppressWarnings(library(sqldf))
suppressWarnings(library(lubridate))

# Text file is assigned to a variable "file"
file <- "household_power_consumption.txt"

# read.csv.sql from sqldf package is used to extract a subset of data from file and
# resulting dataset is assigned to a variable "hpc"
hpc <- read.csv.sql(file, "select * from file where Date in ('1/2/2007', '2/2/2007')", header = TRUE, sep = ";")

# Convert character class Date column to Date class
hpc[ ,"Date"] <- dmy(hpc$Date)

# "Date_Time" variable takes combined values of Date and Time colums
Date_Time <- paste(hpc$Date, hpc$Time)

# Convert Date_Time from character to "POSIXlt"
Date_Time <- strptime(Date_Time, format = "%Y-%m-%d %H:%M:%S")

# png graphics device is set as current device
png(filename = "plot3.png")

# plot from base package is used to capture the "Energy Sub metering" on y-axis and
# its variance over time per day on x-axis without any values. Other parameters are defined as per the requirement.
plot(Date_Time, hpc$Sub_metering_1, type = "n", xlab = "", ylab = "Energy Sub metering")

# now seperate values of "Energy Sub metering" are captured with specific color for each variable
points(Date_Time, hpc$Sub_metering_1, type = "l")
points(Date_Time, hpc$Sub_metering_2, type = "l", col = "Red")
points(Date_Time, hpc$Sub_metering_3, type = "l", col = "Blue")

# legend is provided with lables of variables and corresponding colors used for plotting
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# closed the current device
dev.off()