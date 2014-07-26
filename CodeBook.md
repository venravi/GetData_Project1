# Codebook for tidy_data_set.txt

## Source Data

Source data[1] is from recordings of 30 subjects carring a waist-mounted smartphone with embedded sensors.

Data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

[1]: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Features

The following description of the features comes from the original data source above:

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

> These signals were used to estimate variables of the feature vector for each pattern:  
> '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

### Feature List

The output `tidy_data_set.txt` file will include for each Subject/Activity the mean of the following features:
```
1. subjectId - subject ID of the measurement
2. activityLabel - observed activity
3. tBodyAcc.mean.X
4. tBodyAcc.mean.Y
5. tBodyAcc.mean.Z
6. tBodyAcc.std.X
7. tBodyAcc.std.Y
8. tBodyAcc.std.Z
9. tGravityAcc.mean.X
10. tGravityAcc.mean.Y
11. tGravityAcc.mean.Z
12. tGravityAcc.std.X
13. tGravityAcc.std.Y
14. tGravityAcc.std.Z
15. tBodyAccJerk.mean.X
16. tBodyAccJerk.mean.Y
17. tBodyAccJerk.mean.Z
18. tBodyAccJerk.std.X
19. tBodyAccJerk.std.Y
20. tBodyAccJerk.std.Z
21. tBodyGyro.mean.X
22. tBodyGyro.mean.Y
23. tBodyGyro.mean.Z
24. tBodyGyro.std.X
25. tBodyGyro.std.Y
26. tBodyGyro.std.Z
27. tBodyGyroJerk.mean.X
28. tBodyGyroJerk.mean.Y
29. tBodyGyroJerk.mean.Z
30. tBodyGyroJerk.std.X
31. tBodyGyroJerk.std.Y
32. tBodyGyroJerk.std.Z
33. tBodyAccMag.mean
34. tBodyAccMag.std
35. tGravityAccMag.mean
36. tGravityAccMag.std
37. tBodyAccJerkMag.mean
38. tBodyAccJerkMag.std
39. tBodyGyroMag.mean
40. tBodyGyroMag.std
41. tBodyGyroJerkMag.mean
42. tBodyGyroJerkMag.std
43. fBodyAcc.mean.X
44. fBodyAcc.mean.Y
45. fBodyAcc.mean.Z
46. fBodyAcc.std.X
47. fBodyAcc.std.Y
48. fBodyAcc.std.Z
49. fBodyAccJerk.mean.X
50. fBodyAccJerk.mean.Y
51. fBodyAccJerk.mean.Z
52. fBodyAccJerk.std.X
53. fBodyAccJerk.std.Y
54. fBodyAccJerk.std.Z
55. fBodyGyro.mean.X
56. fBodyGyro.mean.Y
57. fBodyGyro.mean.Z
58. fBodyGyro.std.X
59. fBodyGyro.std.Y
60. fBodyGyro.std.Z
61. fBodyAccMag.mean
62. fBodyAccMag.std
63. fBodyAccJerkMag.mean
64. fBodyAccJerkMag.std
65. fBodyGyroMag.mean
66. fBodyGyroMag.std
67. fBodyGyroJerkMag.mean
68. fBodyGyroJerkMag.std
```

## Transformations

### Training and Test Data

The Training and Test data sets were combined in to a single data set.

### Subjects

Subject IDs were combined in to the single data set.

### Activities

Activity labels were combined in to the single data set.

### Features Cleanup

The following clean up on the features defined in the original dataset, `features.txt`, via `run_analysis.R`.

1. features with invalid characters were updated:
    1. parentheses we removed
    1. hyphens and commas were replaced with a period
1. features with duplicate/incorrect names were updated:
    1. "BodyBody" was replaced with "Body"

### Feature Selection

As part of Step #2 in the `run_analysis.R` file a subset of the features were extracted from the `combinedData` data table. Based on the `features_info.txt` file within the source data set a decision was made to extract the features where either of the following was true:

* Feature name included `-mean()`
* Feature name included `-std()`

The rationale for including the features named as above was the focus on the *mean* and *standard deviation* for each measurement. Features, such as `*-meanFreq()` are calculating the average of the frequency of measurement, rather than the measurement itself. Additionally, other features like `gravityMean`, `t*Mean` are means calculated over the signal window sample, rather than being time/frequency based measurements.

