# ==============================
# MARIA CELESTINA MORALES
# RPROG-012
# ASSIGNMENT 3, PART I
# best.R
# ==============================

# best() takes two arguments: the two-character abbreviated name of a state and
# an outcome name (from "outcome-of-care-measures.csv")

best <- function(state, outcome) {
        oc <- c("heart attack", "heart failure", "pneumonia")
        if (outcome %in% oc == FALSE) stop ("Invalid outcome")
        
        data <- read.csv("outcome-of-care-measures.csv",
                         colClasses = "character")
        
        data <- data[c(2, 7, 11, 17, 23)]
        names(data)[1] <- "Hospital"
        names(data)[2] <- "State"
        names(data)[3] <- "heart attack"
        names(data)[4] <- "heart failure"
        names(data)[5] <- "pneumonia"
        
        st <- data[, 2]
        st <- unique(st)
        if (state %in% st == FALSE) stop ("Invalid State")

        data <- data[data$State == state & data[outcome] != "Not Available", ]
        rets <- data[, outcome]
        rNum <- which.min(rets)
        
        print(data[rNum, ]$Hospital)
}