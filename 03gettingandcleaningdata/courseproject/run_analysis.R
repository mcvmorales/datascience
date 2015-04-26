# Download the file
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "./uci-har-data.zip")

# Unzip the file
zipfile <- "./uci-har-data.zip"
unzip(zipfile)

# Read labels
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")      # labels for activities (6)
features <- read.table("./UCI HAR Dataset/features.txt")             # labels for observations (561)

# Read data sets
train.obs <- read.table("./UCI HAR Dataset/train/X_train.txt")       # training observations
train.act <- read.table("./UCI HAR Dataset/train/Y_train.txt")       # training activities
train.sub <- read.table("./UCI HAR Dataset/train/subject_train.txt") # training subject ID numbers
test.obs  <- read.table("./UCI HAR Dataset/test/X_test.txt")         # testing observations
test.act  <- read.table("./UCI HAR Dataset/test/Y_test.txt")         # testing activities
test.sub  <- read.table("./UCI HAR Dataset/test/subject_test.txt")   # testing subject ID numbers

# Merge "train" and "test" data into tiny data set
tidysubs <- rbind(train.sub, test.sub)
tidyacts <- rbind(train.act, test.act)
tidyfeat <- rbind(train.obs, test.obs)

# Set names to variables
names(tidysubs) <- c("Subject")
names(tidyacts) <- c("Activity")
names(tidyfeat) <- features$V2

# Merge to begin forming tidy data set
row.info <- cbind(tidysubs, tidyacts)
tidydata <- cbind(tidyfeat, row.info)

# Extract only the measurements on the mean and standard deviation (std) for each observation
sub.feat <- features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]

# Subset "tidydata" further
sub.name <- c(as.character(sub.feat), "Subject", "Activity")
tidydata <- subset(tidydata, select = sub.name)

# Use descriptive activity names to name the activities in the data set
tidydata$Activity <- as.factor(tidydata$Activity)
levels(tidydata$Activity) <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING",
                               "STANDING", "LAYING")

# Give appropriate labels to the data set with descriptive variable names
names(tidydata) <- gsub("^t", "time", names(tidydata))
names(tidydata) <- gsub("^f", "frequency", names(tidydata))
names(tidydata) <- gsub("Acc", "Accelerometer", names(tidydata))
names(tidydata) <- gsub("Gyro", "Gyroscope", names(tidydata))
names(tidydata) <- gsub("Mag", "Magnitude", names(tidydata))
names(tidydata) <- gsub("BodyBody", "Body", names(tidydata))

# Create another tidy data set
install.packages("plyr")
library(plyr)

# Takes the average of each variable for each activity and subject based on "tidydata"
tidy.avg <- aggregate(. ~ Subject + Activity, tidydata, mean)
tidy.avg <- tidy.avg[order(tidy.avg$Subject, tidy.avg$Activity), ]
write.table(tidy.avg, file = "tidydata.txt", row.names = FALSE)