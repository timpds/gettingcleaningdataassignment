# Coursera - Cleaning and tidying data - Assignment code book

## Overview
The objective of this work was to take the 'Human Activity Recognition Using Smartphones Dataset' available from <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>, to tidy it and keep only those columns relating to mean and standard deviation measurements, and finally produce a second dataset containing the averages for each of these columns.  More details about the data can be found by following the link above.

The source data can be found at <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>
The aim of this project was to create a single script to:

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Use descriptive activity names to name the activities in the data set.
4. Appropriately label the data set with descriptive variable names.
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.


## Transformation steps
The following steps describe how the two datasets were created:

### Creating the first tidy dataset - 'all_data_mean_std'
1. Read in the following files from the source:
  1. subject_test.txt
  2. x_test.txt
  3. y_test.txt
  4. subject_train.txt
  5. X_train.txt
  6. y_train.txt
  
2. Rename the variables in the 'x' and 'y' datasets prior to merging.
3. Combine all of the datasets to produce a single 'all_data' intermediate data frame.
4. Using the reference file 'features.txt', extract those column names which represent 'mean' and 'standard deviation' measurements.
5. Extract only those columns that represent mean and standard deviation from the 'all_data' dataset based on the identified columns from the reference file, plus the subject and activity columns.
6. Using the reference file 'activity_labels.txt' as a lookup, replace the code value in the 'activity' column with the full text label.
7. Make the column headings more human readable by placing values of 't' with 'time', 'f' with 'freq' and so on, with additional punctuation being removed.

### Creating the second tidy dataset of averages - 'all_data_mean_std_avg'
1. Using the first dataset 'all_data_mean_std', group by the subject and activity, and calculate the mean for each column.
2. Rename each column, prepending 'Average' to each one.


## Data columns
This section privides a brief description of each column in the 'all_data_mean_std' data set.

Within the 'all_data_mean_std_avg' data set, each column (except for 'subject' and 'activity') is as below but prepended with 'Average'.  The descriptions remain the same, except that each column represents the average value of the column based on the subject and activity.

Note that no units of measurement were included in the original data set.

|Column number|Column name|Description
|---|---|---|
|1|subject                                          |Numeric ID for the subject|
|2|activity                                         |Activity type|
|3|timeBodyAccelerometerMeanXAxis                   |Mean value of time based body acceleration on the X axis.|
|4|timeBodyAccelerometerMeanYAxis                   |Mean value of time based body acceleration on the Y axis.|
|5|timeBodyAccelerometerMeanZAxis                   |Mean value of time based body acceleration on the Z axis.|
|6|timeBodyAccelerometerStandardDeviationXAxis      |Standard deviation value of time based body acceleration on the X axis.|
|7|timeBodyAccelerometerStandardDeviationYAxis      |Standard deviation value of time based body acceleration on the Y axis.|
|8|timeBodyAccelerometerStandardDeviationZAxis      |Standard deviation value of time based body acceleration on the Z axis.|
|9|timeGravityAccelerometerMeanXAxis                |Mean value of time based gravity acceleration on the X axis.|
|10|timeGravityAccelerometerMeanYAxis                |Mean value of time based gravity acceleration on the Y axis.|
|11|timeGravityAccelerometerMeanZAxis                |Mean value of time based gravity acceleration on the Z axis.|
|12|timeGravityAccelerometerStandardDeviationXAxis   |Standard deviation value of time based gravity acceleration on the X axis.|
|13|timeGravityAccelerometerStandardDeviationYAxis   |Standard deviation value of time based gravity acceleration on the Y axis.|
|14|timeGravityAccelerometerStandardDeviationZAxis   |Standard deviation value of time based gravity acceleration on the Z axis.|
|15|timeBodyAccelerometerJerkMeanXAxis               |Mean jerk value of time based body acceleration on the X axis.|
|16|timeBodyAccelerometerJerkMeanYAxis               |Mean jerk value of time based body acceleration on the Y axis.|
|17|timeBodyAccelerometerJerkMeanZAxis               |Mean jerk value of time based body acceleration on the Z axis.|
|18|timeBodyAccelerometerJerkStandardDeviationXAxis  |Standard jerk deviation value of time based body acceleration on the X axis.|
|19|timeBodyAccelerometerJerkStandardDeviationYAxis  |Standard jerk deviation value of time based body acceleration on the Y axis.|
|20|timeBodyAccelerometerJerkStandardDeviationZAxis  |Standard jerk deviation value of time based body acceleration on the Z axis.|
|21|timeBodyGyroMeanXAxis                            |Mean value of time based body on the gyroscope X axis.|
|22|timeBodyGyroMeanYAxis                            |Mean value of time based body on the gyroscope Y axis.|
|23|timeBodyGyroMeanZAxis                            |Mean value of time based body on the gyroscope Z axis.|
|24|timeBodyGyroStandardDeviationXAxis               |Standard deviation value of time based body on the gyroscope X axis.|
|25|timeBodyGyroStandardDeviationYAxis               |Standard deviation value of time based body on the gyroscope Y axis.|
|26|timeBodyGyroStandardDeviationZAxis               |Standard deviation value of time based body on the gyroscope Z axis.|
|27|timeBodyGyroJerkMeanXAxis                        |Mean jerk value of time based body on the gyroscope X axis.|
|28|timeBodyGyroJerkMeanYAxis                        |Mean jerk value of time based body on the gyroscope Y axis.|
|29|timeBodyGyroJerkMeanZAxis                        |Mean jerk value of time based body on the gyroscope Z axis.|
|30|timeBodyGyroJerkStandardDeviationXAxis           |Standard jerk deviation value of time based body on the gyroscope X axis.|
|31|timeBodyGyroJerkStandardDeviationYAxis           |Standard jerk deviation value of time based body on the gyroscope Y axis.|
|32|timeBodyGyroJerkStandardDeviationZAxis           |Standard jerk deviation value of time based body on the gyroscope Z axis.|
|33|timeBodyAccelerometerMagMean                     |Mean value of time on body accelerometer magnitude.|
|34|timeBodyAccelerometerMagStandardDeviation        |Standard deviation value of time on body accelerometer magnitude.|
|35|timeGravityAccelerometerMagMean                  |Mean value of time based gravity accelerometer magnitude.|
|36|timeGravityAccelerometerMagStandardDeviation     |Standard deviation value of time based gravity accelerometer magnitude.|
|37|timeBodyAccelerometerJerkMagMean                 |Mean jerk value of time based gravity accelerometer magnitude.|
|38|timeBodyAccelerometerJerkMagStandardDeviation    |Standard deviation jerk value of time based gravity accelerometer magnitude.|
|39|timeBodyGyroMagMean                              |Mean value of time based magnitude on gyroscope.|
|40|timeBodyGyroMagStandardDeviation                 |Standard deviation value of time based magnitude on gyroscope.|
|41|timeBodyGyroJerkMagMean                          |Mean jerk value of time based magnitude on gyroscope.|
|42|timeBodyGyroJerkMagStandardDeviation             |Standard deviation jerk value of time based magnitude on gyroscope.|
|43|freqBodyAccelerometerMeanXAxis                   |Mean value of frequency based body acceleration on the X axis.|
|44|freqBodyAccelerometerMeanYAxis                   |Mean value of frequency based body acceleration on the Y axis.|
|45|freqBodyAccelerometerMeanZAxis                   |Mean value of frequency based body acceleration on the Z axis.|
|46|freqBodyAccelerometerStandardDeviationXAxis      |Standard deviation value of frequency based body acceleration on the X axis.|
|47|freqBodyAccelerometerStandardDeviationYAxis      |Standard deviation value of frequency based body acceleration on the Y axis.|
|48|freqBodyAccelerometerStandardDeviationZAxis      |Standard deviation value of frequency based body acceleration on the Z axis.|
|49|freqBodyAccelerometerMeanFreqXAxis               |Mean value of frequency based body acceleration on the X axis in the frequency domain.|
|50|freqBodyAccelerometerMeanFreqYAxis               |Mean value of frequency based body acceleration on the Y axis in the frequency domain.|
|51|freqBodyAccelerometerMeanFreqZAxis               |Mean value of frequency based body acceleration on the Z axis in the frequency domain.|
|52|freqBodyAccelerometerJerkMeanXAxis               |Mean jerk value of frequency based body acceleration on the X axis.|
|53|freqBodyAccelerometerJerkMeanYAxis               |Mean jerk value of frequency based body acceleration on the Y axis.|
|54|freqBodyAccelerometerJerkMeanZAxis               |Mean jerk value of frequency based body acceleration on the Z axis.|
|55|freqBodyAccelerometerJerkStandardDeviationXAxis  |Standard deviation jerk value of frequency based body acceleration on the X axis.|
|56|freqBodyAccelerometerJerkStandardDeviationYAxis  |Standard deviation jerk value of frequency based body acceleration on the Y axis.|
|57|freqBodyAccelerometerJerkStandardDeviationZAxis  |Standard deviation jerk value of frequency based body acceleration on the Z axis.|
|58|freqBodyAccelerometerJerkMeanFreqXAxis           |Mean jerk value of frequency based body acceleration on the X axis in the frequency domain.|
|59|freqBodyAccelerometerJerkMeanFreqYAxis           |Mean jerk value of frequency based body acceleration on the Y axis in the frequency domain.|
|60|freqBodyAccelerometerJerkMeanFreqZAxis           |Mean jerk value of frequency based body acceleration on the Z axis in the frequency domain.|
|61|freqBodyGyroMeanXAxis                            |Mean jerk value of frequency based body on the gyroscope X axis.|
|62|freqBodyGyroMeanYAxis                            |Mean jerk value of frequency based body on the gyroscope Y axis.|
|63|freqBodyGyroMeanZAxis                            |Mean jerk value of frequency based body on the gyroscope Z axis.|
|64|freqBodyGyroStandardDeviationXAxis               |Standard jerk deviation value of frequency based body on the gyroscope X axis.|
|65|freqBodyGyroStandardDeviationYAxis               |Standard jerk deviation value of frequency based body on the gyroscope Y axis.|
|66|freqBodyGyroStandardDeviationZAxis               |Standard jerk deviation value of frequency based body on the gyroscope Z axis.|
|67|freqBodyGyroMeanFreqXAxis                        |Mean value of frequency based body gyroscope on the X axis in the frequency domain.|
|68|freqBodyGyroMeanFreqYAxis                        |Mean value of frequency based body gyroscope on the Y axis in the frequency domain.|
|69|freqBodyGyroMeanFreqZAxis                        |Mean value of frequency based body gyroscope on the Z axis in the frequency domain.|
|70|freqBodyAccelerometerMagMean                     |Mean value of frequency on body accelerometer magnitude.|
|71|freqBodyAccelerometerMagStandardDeviation        |Standard deviation value of frequency on body accelerometer magnitude.|
|72|freqBodyAccelerometerMagMeanFreq                 |Mean value of body acceleration magnitude in the frequency domain.|
|73|freqBodyBodyAccelerometerJerkMagMean             |Mean value of frequency of body accelerometer jerk magnitude.|
|74|freqBodyBodyAccelerometerJerkMagStandardDeviation|Standard deviation value of frequency of body accelerometer jerk magnitude.|
|75|freqBodyBodyAccelerometerJerkMagMeanFreq         |Mean value of frequency based body acceleration jerk magnitude in the frequency domain.|
|76|freqBodyBodyGyroMagMean                          |Mean value of frequency of body gyroscope magnitude.|
|77|freqBodyBodyGyroMagStandardDeviation             |Standard deviation value of frequency of body gyroscope magnitude.|
|78|freqBodyBodyGyroMagMeanFreq                      |Mean value of frequency based body gyroscope magnitude in the frequency domain.|
|79|freqBodyBodyGyroJerkMagMean                      |Mean value of frequency of body gyroscope jerk magnitude.|
|80|freqBodyBodyGyroJerkMagStandardDeviation         |Standard deviation value of frequency of body gyroscope jerk magnitude.|
|81|freqBodyBodyGyroJerkMagMeanFreq|Mean jerk value of frequency based gyroscope magnitude in the frequency domain.|