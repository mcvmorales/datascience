# ==============================
# MARIA CELESTINA MORALES
# RPROG-012
# ASSIGNMENT 1, PART II
# complete.R
# ==============================

# complete() reads a directory of files and returns the
# number of completely observed cases in each data file.

complete <- function(directory, id = 1:332) {
        files.all <- list.files(directory, full.names = TRUE)
        nobs <- c()
        ret <- data.frame()
        for (i in id) {
                sub <- data.frame()
                sub <- rbind(sub, read.csv(files.all[i]))
                nob <- dim(sub[complete.cases(sub), ])[1]
                nobs <- c(nobs, nob)
        }
ret <- data.frame(id, nobs)
print(ret)
}
