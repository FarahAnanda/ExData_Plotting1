# Read the data from the subset_data.txt file
subset_data <- read.table("subset_data.txt", sep = ";", header = TRUE, na.strings = "?")

# Convert DateTime column to POSIXct format
subset_data$DateTime <- as.POSIXct(subset_data$DateTime)

# Create the plot using the base plotting system
plot(subset_data$DateTime, subset_data$Sub_metering_1, type = "l", col = "black", xlab = "DateTime",
     ylab = "Energy Sub-metering 1", main = "Energy Sub-metering Over Time")
lines(subset_data$DateTime, subset_data$Sub_metering_2, type = "l", col = "red")
lines(subset_data$DateTime, subset_data$Sub_metering_3, type = "l", col = "blue")

# Add legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)

# Save the plot as a PNG file
png("plot3.png", width = 480, height = 480, units = "px")
plot(subset_data$DateTime, subset_data$Sub_metering_1, type = "l", col = "black", xlab = "DateTime",
     ylab = "Energy Sub-metering 1", main = "Energy Sub-metering Over Time")
lines(subset_data$DateTime, subset_data$Sub_metering_2, type = "l", col = "red")
lines(subset_data$DateTime, subset_data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)
dev.off()
