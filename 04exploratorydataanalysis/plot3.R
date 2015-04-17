# ==============================
# MARIA CELESTINA MORALES
# EXDATA-013
# COURSE PROJECT #1
# plot3.R
# ==============================

file <- "./household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE,
                   dec = ".")
subs <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
dates <- strptime(paste(subs$Date, subs$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

subm1 <- as.numeric(subs$Sub_metering_1)
subm2 <- as.numeric(subs$Sub_metering_2)
subm3 <- as.numeric(subs$Sub_metering_3)

png("plot3.png", width = 480, height = 480)
plot(dates, subm1, type = "l", xlab = " ", ylab = "Energy sub metering")
lines(dates, subm2, type = "l", col = "red")
lines(dates, subm3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, lwd = 1)
dev.off()