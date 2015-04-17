# ==============================
# MARIA CELESTINA MORALES
# EXDATA-013
# COURSE PROJECT #1
# plot1.R
# ==============================

file <- "./household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE,
                   dec = ".")
subs <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

plot1 <- as.numeric(subs$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(plot1, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()