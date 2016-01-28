library(dplyr)

## Step 1:

# Read in the test datasets.
subject_test <- read.table('./test/subject_test.txt')
x_test <- read.table('./test/x_test.txt')
y_test <- read.table('./test/y_test.txt')

# Rename some of the variables in the test data.
subject_test <- rename(subject_test, ST = V1)
y_test <- rename(y_test, Y = V1)

subject_train <- read.table('./train/subject_train.txt')
x_train <- read.table('./train/X_train.txt')
y_train <- read.table('./train/y_train.txt')

# Read in the training datasets.
subject_train <- rename(subject_train, ST = V1)
y_train <- rename(y_train, Y = V1)

# Rename some of the variables in the training data.
test_data <- cbind(subject_test, y_test, x_test)
train_data <- cbind(subject_train, y_train, x_train)

# Create a single dataset from the test and training data.
all_data <- rbind(test_data, train_data)

## Step 2:

# Read in the features table to extract the variables for the mean and std.
features <- read.table('./features.txt', stringsAsFactors = FALSE)
features_mean <- features[grepl("mean()", features$V2),]
features_std <- features[grepl("std()", features$V2),]
features_mean_std <- rbind(features_mean, features_std)
features_mean_std <- arrange(features_mean_std, V1)
features_mean_std <- mutate(features_mean_std, V1 = V1 + 2)

# Create a dataset just containing those columns identified as containing mean or std.
all_data_mean_std <- select(all_data, c(1, 2, features_mean_std$V1))


## Step 3:

# Extract the activity labels.
activity_labels <- read.table('./activity_labels.txt', stringsAsFactors = FALSE)
activity_labels <- rename(activity_labels, Y = V1)

# Index the activity labels and use them as a lookup in the dataset.
values <- c(activity_labels$V2)
names(values) <- c(activity_labels$V1)

all_data_mean_std$Y <- values[all_data_mean_std$Y]


## Step 4:

# Merge in the column names and make some changes.
features_mean_std_new <- mutate(features_mean_std, V1 = paste0("V" , V1 - 2))
colnames(all_data_mean_std) <- features_mean_std_new[,2][match(colnames(all_data_mean_std), features_mean_std_new[,1])] 
colnames(all_data_mean_std)[1] <- "subject"
colnames(all_data_mean_std)[2] <- "activity"

# Make some column name replacements to make them easier to read.
colnames(all_data_mean_std) <- sub("^t", "time", colnames(all_data_mean_std))
colnames(all_data_mean_std) <- sub("Acc", "Accelerometer", colnames(all_data_mean_std))
colnames(all_data_mean_std) <- sub("-mean\\(\\)", "Mean", colnames(all_data_mean_std))
colnames(all_data_mean_std) <- sub("^f", "freq", colnames(all_data_mean_std))
colnames(all_data_mean_std) <- sub("-std\\(\\)", "StandardDeviation", colnames(all_data_mean_std))
colnames(all_data_mean_std) <- sub("-meanFreq\\(\\)", "MeanFreq", colnames(all_data_mean_std))
colnames(all_data_mean_std) <- sub("-X", "XAxis", colnames(all_data_mean_std))
colnames(all_data_mean_std) <- sub("-Y", "YAxis", colnames(all_data_mean_std))
colnames(all_data_mean_std) <- sub("-Z", "ZAxis", colnames(all_data_mean_std))


## Step 5:

# Create a new table of averages for each column in the tidy dataset grouped by subject and activity.
all_data_mean_std_avg <- all_data_mean_std %>% group_by(subject, activity) %>% summarise_each(funs(mean))
colnames(all_data_mean_std_avg) <- sub("^time", "AverageTime", colnames(all_data_mean_std_avg))
colnames(all_data_mean_std_avg) <- sub("^freq", "AverageFreq", colnames(all_data_mean_std_avg))
