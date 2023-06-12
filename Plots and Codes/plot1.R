# Read the data from the subset_data.txt file
subset_data <- read.table("subset_data.txt", sep = ";", header = TRUE, na.strings = "?")

# Convert DateTime column to POSIXct format
subset_data$DateTime <- as.POSIXct(subset_data$DateTime)

# Create the plot using the base plotting system
hist(subset_data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", main = "Global Active Power Distribution")

# Save the plot as a PNG file
png("plot1.png", width = 480, height = 480, units = "px")
hist(subset_data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", main = "Global Active Power Distribution")
dev.off()
