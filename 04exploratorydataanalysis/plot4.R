# ==============================
# MARIA CELESTINA MORALES
# EXDATA-013
# COURSE PROJECT #1
# plot4.R
# ==============================

file <- "./household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE,
                   dec = ".")
subs <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
dates <- strptime(paste(subs$Date, subs$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

subm1 <- as.numeric(subs$Sub_metering_1)
subm2 <- as.numeric(subs$Sub_metering_2)
subm3 <- as.numeric(subs$Sub_metering_3)

gap <- as.numeric(subs$Global_active_power)
grp <- as.numeric(subs$Global_reactive_power)
vol <- as.numeric(subs$Voltage)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(dates, gap, type = "l", xlab = " ", ylab = "Global Active Power")
plot(dates, vol, type = "l", xlab = " ", ylab = "Voltage")
plot(dates, subm1, type = "l", xlab = " ", ylab = "Energy Sub Metering")
        lines(dates, subm2, type = "l", col = "red")
        lines(dates, subm3, type = "l", col = "blue")
        legend("topright",
               c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               col = c("black", "red", "blue"), lty = 1, lwd = 1, bty = "n")
plot(dates, grp, type = "l", xlab = " ", ylab = "Global Reactive Power")
dev.off()