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

The main R script file that process the data. The file is structured to meet the above 5 key project goals.

### .gitignore

The `.gitignore` file excludes the source data directory, internal R files (`.RData` and `.Rhistory`) and the output `tidy_data_set.txt` file.

## Setup and Execution

The `run_analysis.R` sctipt includes an additional "Step 0" to download/extract the source data and place it in a separate `dataDir` which can be specified on line 17.

One run, `run_analysis.R` will produce a `tidy_data_set.txt` file in the R working directory.

The resulting `tidy_data_set.txt` can be read in to R via the command:
```
read.table(file = "tidy_data_set.txt", header = TRUE, sep = "\t")
```
