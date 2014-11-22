Coursera Getting and Cleaning Data - Project
====================

#Synopsis

**R Script:** run_analysis.R

This R script extracts data from the Human Activity Recognition Using Smartphones Data Set produces a tidy data file containing the average value of each mean and standard deviation variable value per activity and subject.

This tidy data file (tidy_data.csv) is a comma separated value (CSV) text file containing the average of the mean and standard deviation values for each subject and activity extracted from the Human Activity Recognition Using Smartphones Data Set from the UCI Machine Learning Repository.  This data set contains recordings of 30 subjects performing 6 types of activities of daily living (ADL) - Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, and laying - while carrying a waist-mounted smartphone with embedded inertial sensors.

## Assumptions and notes
1. The data set is located in the current working directory within a directory named "UCI HAR Dataset/"
1. The tidy data set will be saved to a file named "tidy_file.csv" located within the current working directory
1. The raw data was extracted from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), and downloaded on November 16, 2014 15:44 EST.
1. The script requires the *reshape2* package to run.

#Outline

The run_analysis.R script carries out the following steps:

* Reads in raw data
The script reads in the raw data from the following files into two sets of data frames, representing the training data set and test data set.

File|File Path|Description

Activity Labels | "./UCI HAR Dataset/activity_labels.txt | Links the class labels with their activity name.
Features | "./UCI HAR Dataset/features.txt | List of all features

Training Data  | "./UCI HAR Dataset/train/X_train.txt | Training data set of observations containing 561 variables (features) of data. 
Training Activity  | "./UCI HAR Dataset/train/y_train.txt |  Each row identifies the activity that was performed for each observation (window sample).  The activity is represented by the activity class label. Its range is from 1 to 6. Each row in this file corresponds to the equivalent row in the Training data file.
Training Subjects  | "./UCI HAR Dataset/train/subject_train.txt | Each row identifies the subject ID who performed the activity for each observation (window sample). Its range is from 1 to 30.  Each row in this file corresponds to the equivalent row in the Training data file.

Test Data  | ./UCI HAR Dataset/test/X_test.txt | Test data set containing 561 variables (features) of data. 
Test Activity  |./UCI HAR Dataset/test/y_test.txt | Each row identifies the activity that was performed for each observation (window sample).  The activity is represented by the activity class label. Its range is from 1 to 6. Each row in this file corresponds to the equivalent row in the Test data file.
Test Subjects  | ./UCI HAR Dataset/test/subject_test.txt | Each row identifies the subject ID who performed the activity for each observation (window sample). Its range is from 1 to 30.  Each row in this file corresponds to the equivalent row in the Test data file. 

* Activity and Subject data frames binded to the raw data frames- The activity and subject data frames are column binded into the training and test data frames.

* Combine train and data set - The training and test data frames are combined into a single data frame. 

* Activity Labels - The combined data frame is joined with the data frame with activity labels - each row now has a field displaying the activity.

* Extact mean and standard deviation - The script filters the combined data frame to limit the values to mean and standard devation values.  This task is accomplished by finding column names containing the term "mean()" or "std()" using the *grep* command.

* Melt the data frame - The script "melts" the data to produce a long form data frame (tall and skinny).  All the mean and standard deviation values are stacked into a single column. 

* Average - Using the "melted" data frame, the script calculates the average mean and standard devation values per subject, activity, and variable.

* Sort - The resulting data frame is sorted by subject ID and activity respectively.

* Output - The data frame is written out as a CSV file.

#Tidy Data Format

The data is in a long form (tall and skinny) with 4 variables.  Each row represents the average of feature variable for a given subject and activity.  For example:
 
"Subject"|"Activity"|"Feature"|"Average_Value"
---------|----------|---------|---------------
1|"LAYING"|"tBodyAcc-mean()-X"|0.22159824394

For the above row, *0.22159824394* is the average *tBodyAcc-mean()-X* value for subject #1 carrying out the laying activity.

There are 11,880 rows and 1 header row in the tidy data file.  There are 33 unique mean and 33 unique standard deviations.
11,880 rows = (33 mean values + 33 standard deviation values) * 30 subjects * 6 activities / subject 

#Study Design

The raw data was extracted from the following site: 
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

Further information on this data sest can be found within the README.txt file, which is located within this zip file and the following site:
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

