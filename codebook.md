Synopsis
====================

This tidy data file (tidy_data.csv) is a comma separated value (CSV) text file containing the average of the mean and standard deviation values for each subject and activity extracted from the Human Activity Recognition Using Smartphones Data Set from the UCI Machine Learning Repository.  This data set contains recordings of 30 subjects performing 6 types of activities of daily living (ADL) - Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, and laying - while carrying a waist-mounted smartphone with embedded inertial sensors.

Data Format
====================

The data is in a long form (tall and skinny) with 4 variables.  Each row represents the average of feature variable for a given subject and activity.  For example:
 
"Subject"|"Activity"|"Feature"|"Average_Value"
---------|----------|---------|---------------
1|"LAYING"|"tBodyAcc-mean()-X"|0.22159824394

For the above row, *0.22159824394* is the average *tBodyAcc-mean()-X* value for subject #1 carrying out the laying activity.

There are 11,880 rows and 1 header row in the tidy data file.  There are 33 unique mean and 33 unique standard deviations.
11,880 rows = (33 mean values + 33 standard deviation values) * 30 subjects * 6 activities / subject 

Sort Order
====================

The tidy data has been sorted by subject ID and activity name respectively.

Study Design
====================

The raw data was extracted from the following site: 
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

Further information on this data sest can be found within the README.txt file, which is located within this zip file and the following site:
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Variables
====================

##Subject
The ID of the subject that carried out the activity.  ID ranges from 1 to 30.

##Activity
The activity the subject carried out.  Values include:
* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

##Feature
The name of the feature variable.  Feature variables are limited to mean and standard deviation of each measurement.  There are 33 unique mean variables and 33 unique standard deviation variables.

##Average_Value
The average value of the feature variable for the given subject and activity.

