# run_analysis.R
# This R script extracts data from the Human Activity Recognition Using Smartphones Data Set.
# The R script produces a tidy data file containing the average value of each mean and standard deviation variable value per activity and subject.


# Assumptions and notes  
# 1) The data set is in the current working directory.
# 2) The data set in located in a directory named "UCI HAR Dataset/" located in the current working directory
# 3) The tidy data set will be saved to a file named "tidy_file.txt" located within the current working directory


#
# Filename variables
activity_labels_file = "./UCI HAR Dataset/activity_labels.txt"
features_file = "./UCI HAR Dataset/features.txt"

data_train_file = "./UCI HAR Dataset/train/X_train.txt"
activity_train_file ="./UCI HAR Dataset/train/y_train.txt"
subject_train_file = "./UCI HAR Dataset/train/subject_train.txt"

data_test_file = "./UCI HAR Dataset/test/X_test.txt"
activity_test_file ="./UCI HAR Dataset/test/y_test.txt"
subject_test_file = "./UCI HAR Dataset/test/subject_test.txt"

tidy_file_name = "./tidy_file.txt"


### BEGIN Read Activity Labels file

activity_labels <- read.csv (activity_labels_file, sep="", header=FALSE, na.strings=c("NA"), stringsAsFactors=FALSE )
colnames (activity_labels) <-c("activity_id", "activity")

### END Read Activity Labels file

### BEGIN Read Activity Labels file

features_df <- read.csv (features_file, sep="", header=FALSE, na.strings=c("NA"), stringsAsFactors=FALSE )
features <- features_df[,2]

### END Read Activity Labels file

### BEGIN Read training set
data_train <- read.csv (data_train_file, sep="", header=FALSE, na.strings=c("NA"), stringsAsFactors=FALSE )
colnames (data_train) <- features

activity_train <- read.csv (activity_train_file, sep="", header=FALSE, na.strings=c("NA"), stringsAsFactors=FALSE )
colnames (activity_train) <-c("activity_id")

subject_train <- read.csv (subject_train_file, sep="", header=FALSE, na.strings=c("NA"), stringsAsFactors=FALSE )
colnames (subject_train) <-c("subject")

## TODO - assign variable names

#Bind activity and subject to data
data_train <- cbind (activity_train, data_train)
data_train <- cbind(subject_train, data_train)

### END Read training set

#### Begin Read test set

data_test <- read.csv (data_test_file, sep="", header=FALSE, na.strings=c("NA"), stringsAsFactors=FALSE )
colnames (data_test) <- features

activity_test <- read.csv (activity_test_file, sep="", header=FALSE, na.strings=c("NA"), stringsAsFactors=FALSE )
colnames (activity_test) <-c("activity_id")

subject_test <- read.csv (subject_test_file, sep="", header=FALSE, na.strings=c("NA"), stringsAsFactors=FALSE )
colnames (subject_test) <-c("subject")

#Bind activity and subject to data
data_test <- cbind (activity_test, data_test)
data_test <- cbind(subject_test, data_test)

#### End Read test set

# Merge training and test set
data_merged <- rbind (data_train,data_test)

# Join on Activity file
data_merged <- merge(activity_labels, data_merged, by.x="activity_id", by.y="activity_id", all=FALSE)

####  BEGIN - Extract mean and std dev values only

meanVals <- grep ("mean()", features, fixed=TRUE, value=TRUE)
stdVals <- grep ("std()", features, fixed=TRUE, value=TRUE)
meanAndStdVals <- c ("subject","activity", meanVals,stdVals)
data_merged <- data_merged [,meanAndStdVals]

####  END - Extract mean and std dev values only

#Calculate average data by Activty and Subject
avgData <-aggregate (. ~ subject + activity, data = data_merged ,mean)

#Sort by Subject, Activity
avgData <- avgData[order(avgData$subject,avgData$activity),]

#Write out tidy data set
write.table (avgData, file=tidy_file_name, sep=",", row.names=FALSE)
