# ==============================
# MARIA CELESTINA MORALES
# EXDATA-013
# COURSE PROJECT #1
# plot2.R
# ==============================

file <- "./household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE,
                   dec = ".")
subs  <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
dates <- strptime(paste(subs$Date, subs$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

plot2 <- as.numeric(subs$Global_active_power)
png("plot2.png", width = 480, height = 480)
plot(dates, plot2, type = "l", xlab = " ",
     ylab = "Global Active Power (kilowatts)")
dev.off()