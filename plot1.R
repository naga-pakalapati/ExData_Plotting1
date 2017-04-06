# Script for constructing plot 1

# Load the following packages
suppressWarnings(library(sqldf))

# Text file is assigned to a variable "file"
file <- "household_power_consumption.txt"

# read.csv.sql from sqldf package is used to extract a subset of data from file and
# resulting dataset is assigned to a variable "hpc"
hpc <- read.csv.sql(file, "select * from file where Date in ('1/2/2007', '2/2/2007')", header = TRUE, sep = ";")

# png graphics device is set as current device
png(filename = "plot1.png")

# hist from base package is used to capture the "Global Active Power" on x-axis against
# its frequency on y-axis. Other parameters are defined as per the requirement.
with(hpc, hist(Global_active_power, xlab = "Global Active Power (kilowatts)", col = "Red", main = "Global Active Power"))

# closed the current device
dev.off()