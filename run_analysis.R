##### Coursera Module 3 Week 4 Exercise: run_analysis.R

### 1. Merges the training and the test sets to create one data set
###    using the X_, Y_ and Subject_ files:
###    x_train + x_test --> x_all
###    y_train + y_test --> y_all
###    subject_train + subject_test --> subject_all

# read train input to data frames
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

# read test input to data frames
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# combine x (train and test) data frames
x_all <- rbind(x_train, x_test)

# combine y (train and test) data frames
y_all <- rbind(y_train, y_test)

# combine subject (train and test) data frames
subject_all <- rbind(subject_train, subject_test)


### 2. Extracts only the measurements on the mean and standard deviation for each measurement.
###    In this step use the features file to get the proper column names.  Subset the features data frame for columns with mean or std in their name
###    Get those columns that match from x_all and substitute the full names into x_all

features <- read.table("features.txt")

# select columns with mean() or std() in name
meanORstandard <- grep(".*mean.*|.*std.*", features[,2])

# select mean or std columns from x_all
x_subset <- x_all[, meanORstandard]




### 3. Uses descriptive activity names to name the activities in the data set
###    Use the activity_labels file and apply to y_all file

activities <- read.table("activity_labels.txt")

# update y_all rows with activity names
y_all[, 1] <- activities[y_all[, 1], 2]




### 4. Appropriately labels the data set with descriptive variable names

# update column names x_subset 
names(x_subset) <- features[meanORstandard, 2]

# update column name in y_all 
names(y_all) <- "activity"

# update column name in subject_all
names(subject_all) <- "subject"

# create one data frame from x_subset, y_all and subject_all to prepare for 5.
complete_data <- cbind(x_subset, y_all, subject_all)




### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(plyr)
mean_data<- ddply(complete_data, .(activity, subject), function(x) colMeans(x[, 1:79]))
save(mean_data,file="copy_mean_data.Rda")













