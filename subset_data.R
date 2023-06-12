# Set the working directory to the folder containing the data files
setwd("/path/to/data/folder")

# Estimate memory required
rows <- 2075259
cols <- 9
numeric_size <- 8
character_size <- 20

memory_required <- rows * (cols * numeric_size + (cols - 1) * character_size)
memory_required

# Read the data from the file
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

# Convert Date and Time to appropriate classes
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- as.POSIXct(data$Time, format = "%H:%M:%S")

# Subset the data based on dates
start_date <- as.Date("2007-02-01", format = "%Y-%m-%d")
end_date <- as.Date("2007-02-02", format = "%Y-%m-%d")

subset_data <- data[data$Date >= start_date & data$Date <= end_date, ]