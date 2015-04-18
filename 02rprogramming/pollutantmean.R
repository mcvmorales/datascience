fileurl <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
download.file(fileurl, destfile = "./specdata.zip")
unzip("./specdata.zip")

# Acceptable values
# -----------------
# directory: "specdata"
# pollutant: "sulfate", "nitrate"
# id:        an integer or integer range in 1:332

pollutantmean <- function(directory, pollutant, id = 1:332) {
        all <- list.files(directory, full.names = TRUE)
        dat <- data.frame()
        for (i in id) {
               dat <- rbind(dat, read.csv(all[i]))
        }
        sub <- dat[, pollutant]
        mean(sub, na.rm = TRUE)
}
