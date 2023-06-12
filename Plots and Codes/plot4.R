# Read the data from the subset_data.txt file
subset_data <- read.table("subset_data.txt", sep = ";", header = TRUE, na.strings = "?")

# Convert DateTime column to POSIXct format
subset_data$DateTime <- as.POSIXct(subset_data$DateTime)

# Create a new plotting device for the combined plot
png("plot4.png", width = 480, height = 480, units = "px")

# Create the plot using the base plotting system
par(mfrow = c(2, 2))

# Plot 1
plot(subset_data$DateTime, subset_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power", main = "")

# Plot 2
plot(subset_data$DateTime, subset_data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", main = "")

# Plot 3
plot(subset_data$DateTime, subset_data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering", main = "")
lines(subset_data$DateTime, subset_data$Sub_metering_2, type = "l", col = "red")
lines(subset_data$DateTime, subset_data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

# Plot 4
plot(subset_data$DateTime, subset_data$Global_reactive_power, type = "l", xlab = "Datetime", ylab = "Global_reactive_power", main = "")

# Close the plotting device
dev.off()
