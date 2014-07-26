# Coursera - Getting and Cleaning Data: Project 1
#
# https://github.com/a-drummond/GetData_Project1

#####
# Step 0: Setup - download data files and unzip files, if required
#

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dataDir <- "./"
dataSetDir <- paste0(dataDir, "UCI HAR Dataset/")

if (!file.exists(dataSetDir)) {
    download.file(fileUrl, destfile = paste0(dataDir, "project1Data.zip"), method = "curl")
    unzip(paste0(dataDir, "project1Data.zip"), exdir = dataDir)
}



#####
# Step 1: Merge the training and the test sets to create one data set
#

# read in features names
features <- read.table(paste0(dataSetDir, "features.txt"))[,2]

# get logical vector for the features we are interested in for Step #2 (see Readme.md for more details)
focusFeatures <- grepl("-(mean|std)\\(\\)", features)

# clean up features names (as read.table(check.names=T) doesn't seem to fix them/thow any warnings)
features <- gsub("[()]", "", features)
features <- gsub("[-,]", ".", features)

# clean up misnamed features
features <- gsub("BodyBody", "Body", features)

# read in activity names
activities <- read.table(paste0(dataSetDir, "activity_labels.txt"), col.names = c("activityId", "activityLabel"))

# read in Training data
subjectTrainingData <- read.table(paste0(dataSetDir, "train/subject_train.txt"), col.names = c("subjectId"))
xTrainingData <- read.table(paste0(dataSetDir, "train/X_train.txt"), col.names = features)
yTrainingData <- read.table(paste0(dataSetDir, "train/y_train.txt"), col.names = c("activityId"))

# change yTrainingData activity IDs to activity labels (Step #3)
yTrainingData[,1] <- activities[yTrainingData[,1],2]
names(yTrainingData) <- c("activityLabel")

# combine training data in to a single table
trainingData <- cbind(subjectTrainingData, yTrainingData, xTrainingData)

# read in Test data
subjectTestData <- read.table(paste0(dataSetDir, "test/subject_test.txt"), col.names = c("subjectId"))
xTestData <- read.table(paste0(dataSetDir, "test/X_test.txt"), col.names = features)
yTestData <- read.table(paste0(dataSetDir, "test/y_test.txt"), col.names = c("activityId"))

# change yTestData activity IDs to activity labels (Step #3)
yTestData[,1] <- activities[yTestData[,1],2]
names(yTestData) <- c("activityLabel")

# combine testing data in to a single table
testData <- cbind(subjectTestData, yTestData, xTestData)

# combine the training and test data
combinedData <- rbind(trainingData, testData)

#####
# Step 2: Extract the mean/std features we are interested in (see Readme.md for justification of features selected)
#

# add in additional elements in the vector to cater for the subject and activity data at the start of the data frame
focusFeatures <- c(TRUE, TRUE, focusFeatures)
filteredData <- combinedData[,focusFeatures]

#####
# Step 3: Use descriptive activity names to name the activities in the data set

# Included in Step 1 above.

#####
# Step 4: Appropriately label the data set with descriptive variable names.
#

# Included in Step 1 above.

#####
# Step 5: Create an independent tidy data set with the average of each variable for each activity and each subject.

# melt data set across all variables
library(reshape2)
idVars <- c("subjectId", "activityLabel")
measureVars <- setdiff(names(filteredData), idVars)
meltedDataSet <- melt(filteredData, id = idVars, measure.vars = measureVars)

# cast dataset - mean across all the variables per subject/activity
tidyDataSet <- dcast(meltedDataSet, subjectId + activityLabel ~ variable, mean)

# output to a file
write.table(tidyDataSet, file = "tidy_data_set.txt", quote = FALSE, col.names = TRUE, row.names = FALSE, sep = "\t")
