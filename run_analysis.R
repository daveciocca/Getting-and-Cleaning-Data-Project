## 
##  Getting and Cleaning Data Project
##  David Ciocca
##  Feb 2016
##
##  This script will perform the following 5 actions, as described
##  in the Assignment from Coursea:
## 
##  1.  Merge training and test data sets to one data set.
##  2.  Extract only the measurements for mean and standard deviation for each
##      measurement.
##  3.  Use descriptive names for the activites in the data set.
##  4.  Label data set with descriptive variable names.
##  5.  Create a second, independent tidy data set with the average of each
##      variable for each activity and subject.
##
##

library(data.table)
library(plyr)

# 1.  Merge training and test data sets to one data set.

setwd("\\\\AGFS03/UserShares/dciocca/My Documents/GetCleanProject/data")

# Read all relevant data files.
xTest <- read.table("x_test.txt", header = FALSE)
yTest <- read.table("y_test.txt", header = FALSE)
subTest <- read.table("subject_test.txt", header = FALSE)
xTrain <-  read.table("x_train.txt", header = FALSE)
yTrain <-  read.table("y_train.txt", header = FALSE)
subTrain <- read.table("subject_train.txt", header = FALSE)
features <- read.table("features.txt", header = FALSE)
activity <- read.table("activity_labels.txt", header = FALSE)

# Merge data sets
xDat <- rbind(xTest, xTrain)
yDat <- rbind(yTest, yTrain)
subDat <- rbind(subTest, subTrain)


# 2.  Extract only the measurements for mean and standard deviation for each
#     measurement.

meanStdVec <- grep("mean\\(\\)|std\\(\\)", features[, 2])
xDatMS <- subset(xDat, select=meanStdVec)
names(xDatMS) <- features[meanStdVec, 2]


# 3.  Use descriptive names for the activites in the data set.

yDat[, 1] <- activity[yDat[, 1], 2]
names(yDat) <- "activity"
xDatMS <- merge(activity, xDatMS)


# 4.  Label data set with descriptive variable names.

setnames(subDat, "V1", "volunteer")
setnames(yDat, "V1", "activity")
setnames(activity, "V1", "activityNum")
setnames(activity, "V2", "activityName")
setnames(xDatMS, "V1", "activityNum")
setnames(xDatMS, "V2", "activityName")


# 5.  Create a second, independent tidy data set with the average of each
#    variable for each activity and subject.

tidyData <- ddply(xDatMS, .(activityNum, activityName), function(x) colMeans(x[, 3:68]))
write.csv(tidyData, "tidyFile.txt")









 