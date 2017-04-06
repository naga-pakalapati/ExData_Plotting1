# Script for constructing plot 2

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
png(filename = "plot2.png")

# plot from base package is used to capture the "Global Active Power" on y-axis and
# its variance over time per day on x-axis. Other parameters are defined as per the requirement.
plot(Date_Time, hpc$Global_active_power, type = "s", xlab = "", ylab = "Global Active Power (kilowatts)")

# closed the current device
dev.off()