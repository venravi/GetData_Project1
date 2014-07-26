# Getting and Cleaning Data - Project 1

## Project Goal

1. Merges the training and the test sets to create one data set.
1. Extracts only the measurements on the mean and standard deviation for each measurement. 
1. Uses descriptive activity names to name the activities in the data set
1. Appropriately labels the data set with descriptive variable names. 
1. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## File Details

### README.md

This file. Describes the overall goals of the Project and includes details of the other key files within the project.

### CodeBook.md

The `CodeBook.md` file describes each of the varibles, data and transformations that took place on the source data.

### run_analysis.R

The main R script file that process the data. The file is structured to meet the above 5 key project goals, with an additional "Step 0" to download/extract the source data.

The output of this script is a `tidy_data_set.txt` file in the R working directory as per step 5 above.

### .gitignore

The .gitignore file excludes the source data directory and internal R files (.RData and .Rhistory).
