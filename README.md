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

## Implementation Details

### Feature Selection

As part of Step #2 in the `run_analysis.R` file a sub set of the features were extracted from the `combinedData` data table. Based on the `features_info.txt` file within the source data set a decision was made to extract the features where the following was true:

* Feature name included `-mean()`
* Feature name included `-std()`

The rationale for including the features named as above was the focus on the *mean* and *standard deviation* for each measurement. Features, such as `*-meanFreq()` are calculating the average of the frequency of measuremean, rather than the measurement itself. Additionally, other features like `gravityMean`, `t*Mean` are means calculated over the signal window sample, rather than the time/frequency based measurements.


