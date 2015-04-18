fileurl <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
download.file(fileurl, destfile = "./specdata.zip")
unzip("./specdata.zip")

# Acceptable values:
# directory: "specdata"
# pollutant: "sulfate", "nitrate"
# id:        an integer or integer range in 1:332

# pollutantmean() calculates the mean of a pollutant (sulfate or nitrate)
# across a specified list of monitors.

pollutantmean <- function(directory, pollutant, id = 1:332) {
        all <- list.files(directory, full.names = TRUE)
        dat <- data.frame()
        for (i in id) {
               dat <- rbind(dat, read.csv(all[i]))
        }
        sub <- dat[, pollutant]
        mean(sub, na.rm = TRUE)
}

# complete() reads a directory of files and returns the number of completely
# observed cases in each data file.

complete <- function(directory, id = 1:332) {
        all  <- list.files(directory, full.names = TRUE)
        nobs <- c()
        ret  <- data.frame()
        for (i in id) {
                sub  <- data.frame()
                sub  <- rbind(sub, read.csv(files.all[i]))
                nob  <- dim(sub[complete.cases(sub), ])[1]
                nobs <- c(nobs, nob)
        }
        ret <- data.frame(id, nobs)
        print(ret)
}

# corr() calculates the correlation between pollutants for monitor locations
# where the number of complete cases is greater than the threshold.

corr <- function(directory, threshold = 0) {
        all <- list.files(directory, full.names = TRUE)
        vec <- c()
        for (i in 1:332) {
                data <- read.csv(paste(directory, "/", files[i], sep = ""))
                data <- data[complete.cases(data), ]
                if (nrow(data) > threshold) {
                        vec <- c(vec, data["sulfate"], data["nitrate"])
                }
        }
        print(vec)
}