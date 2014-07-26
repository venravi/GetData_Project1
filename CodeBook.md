# Codebook for tidy_data.txt

## Source Data

Source data[1] is from recordings of 30 subjects carring a waist-mounted smartphone with embedded sensors.

Data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

[1]: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Variables



## Transformations

### Training and Test Data

The Training and Test data sets were combined in to a single data set.

### Subjects

Subject IDs were combined in to the single data set.

### Activities

Activity labels were combined in to the single data set.

### Features

The following clean up on the features defined in the original dataset, `features.txt`, via `run_analysis.R`.

1. features with invalid characters were updated:
    1.1. parentheses we removed
    1.1. hyphens and commas were replaced with a period
1. features with duplicate/incorrect names were updated:
    1.1. "BodyBody" was replaced with "Body"

### Feature Selection

As part of Step #2 in the `run_analysis.R` file a subset of the features were extracted from the `combinedData` data table. Based on the `features_info.txt` file within the source data set a decision was made to extract the features where either of the following was true:

* Feature name included `-mean()`
* Feature name included `-std()`

The rationale for including the features named as above was the focus on the *mean* and *standard deviation* for each measurement. Features, such as `*-meanFreq()` are calculating the average of the frequency of measurement, rather than the measurement itself. Additionally, other features like `gravityMean`, `t*Mean` are means calculated over the signal window sample, rather than being time/frequency based measurements.

