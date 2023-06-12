# Read the data from the subset_data.txt file
subset_data <- read.table("subset_data.txt", sep = ";", header = TRUE, na.strings = "?")

# Convert DateTime column to POSIXct format
subset_data$DateTime <- as.POSIXct(subset_data$DateTime)

# Create the plot using the base plotting system
plot(subset_data$DateTime, subset_data$Global_active_power, type = "l",
     xlab = "Date", ylab = "Global Active Power", main = "Global Active Power Over Time")

# Save the plot as a PNG file
png("plot2.png", width = 480, height = 480, units = "px")
plot(subset_data$DateTime, subset_data$Global_active_power, type = "l",
     xlab = "Date", ylab = "Global Active Power", main = "Global Active Power Over Time")
dev.off()
