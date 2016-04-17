This code book describes the files, variables and transformations used to fulfill Coursera Data Science Module 3, Week 4's assignment and coded in the R program "run_analysis.R".

The data resides at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip [1]

FILES
Files from the referenced zip files used by "run_analysis.R" are as follows:
	X_train.txt
	y_train.txt
	subject_train.txt
	X_test.txt
	y_test.txt
	subject_test.txt
	features.txt
	activity_labels.txt

OUTPUT
The program outputs a tidy data set with the average of each variable for each activity and each subject in the form of a file called "copy_mean_data.Rda".


TRANSFORMATIONS
The program merges the training and the test sets to create one data set such that:
    x_train + x_test --> x_all
    y_train + y_test --> y_all
    subject_train + subject_test --> subject_all

First all files are read into  data frames.  Next both x_ files are combined.  So too for the two y_ files and the two subject_ files. 

Using the features.txt file an extract is taken that includes column names with "mean" or "std" in their name.
The "x_all" data frame is subset to include only the columns matching the subseted data from features.txt (i.e., only columns containing "mean" or "std".  This information is stored in a new data frame.

Next the activity_labels,txt file is used to update the combined y_ data frame _y_all) by the integer values in column V1 with the names of the activities.

Next labels consisting of descriptive varialbe names are applied to x_all, y_all and standard_all

Finally the three *_all files are combined into 1 data set and a file is saved consisting of the tidy data set with the average of each variable for each activity and each subject.






[1] This data set was made available by Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.








