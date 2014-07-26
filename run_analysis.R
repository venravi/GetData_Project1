# Coursera - Getting and Cleaning Data: Project 1
#
# https://github.com/a-drummond/GetData_Project1

#You should create one R script called run_analysis.R that does the following.

    #Merges the training and the test sets to create one data set.
    #Extracts only the measurements on the mean and standard deviation for each measurement.
    #Uses descriptive activity names to name the activities in the data set
    #Appropriately labels the data set with descriptive variable names.
    #Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#####
# Step 0: Setup - download data files and unzip files, if required
#
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dataDir <- "./data/"

if (!file.exists(dataDir)) {
    dir.create(dataDir)
    download.file(fileUrl, destfile = paste0(dataDir, "project1Data.zip"), method = "curl")
    unzip(paste0(dataDir, "project1Data.zip"), exdir = dataDir)
}

dataSetDir <- paste0(dataDir, "UCI HAR Dataset/")
#####
# Step 1: Merge the training and the test sets to create one data set
#

# read in features names
features <- read.table(paste0(dataSetDir, "features.txt"))[,2]

# clean up features names (as read.table(check.names=T) doesn't seem to fix them/thow any warnings)
features <- gsub("[()-]", "", features)
features <- gsub(",", "-", features)

# read in activity names
activities <- read.table(paste0(dataSetDir, "activity_labels.txt"), col.names = c("activityId", "activityLabel"))



# read in Training data
subjectTrainingData <- read.table(paste0(dataSetDir, "train/subject_train.txt"), col.names = c("subjectId"))
xTrainingData <- read.table(paste0(dataSetDir, "train/X_train.txt"), col.names = features)
yTrainingData <- read.table(paste0(dataSetDir, "train/y_train.txt"), col.names = c("activityId"))

# change yTrainingData activity IDs to activity labels
yTrainingData[,1] <- activities[yTrainingData[,1],2]
names(yTrainingData) <- c("activityLabel")

# combine training data in to a single table
trainingData <- cbind(subjectTrainingData, yTrainingData, xTrainingData)


# read in Test data
subjectTestData <- read.table(paste0(dataSetDir, "test/subject_test.txt"), col.names = c("subjectId"))
xTestData <- read.table(paste0(dataSetDir, "test/X_test.txt"), col.names = features)
yTestData <- read.table(paste0(dataSetDir, "test/y_test.txt"), col.names = c("activityId"))

# change yTestData activity IDs to activity labels
yTestData[,1] <- activities[yTestData[,1],2]
names(yTestData) <- c("activityLabel")

# combine testing data in to a single table
testData <- cbind(subjectTestData, yTestData, xTestData)


combinedData <- rbind(trainingData, testData)