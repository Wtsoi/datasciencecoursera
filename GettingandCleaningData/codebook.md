---
title: Getting and Cleaning Data Project
author: W Tsoi
date: 20/07/2017
---

## Project Description
The project is designed to demonstrate ability to collect, work with and clean a data set

### Collection of the raw data
Data was obtained from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones where it measured participants' physical activities and collected through accelerometers from Samsung Galaxy S smartphone provided to participants

### Notes on the original (raw) data 
The original data was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Creating the tidy datafile

### Guide to create the tidy data file
1. Download the file from the original source
2. files was unzipped into working directory
3. files were read and loaded into a table
    3.1 activitylabels : read from activity_labels.txt
    3.2 features : read from features.txt
    3.3 trainset : read from X_train.txt
    3.4 trainlabels : read from y_train.txt
    3.5 trainsubject : read from subject_train.txt
    3.6 testset : read from X_test.txt
    3.7 testlabels : read from y_test.txt
    3.8 testsubject : read from subject_test.txt
4. Data then combined according to subjects, sets and labels and each dataset was given at least one similar variable     name to merge them with.
5. Using the rbind and cbind, ll dataset was combined into one large table

### Cleaning of Data
The data containing mean and standard deviation was extracted out using "grep" function. The vector created from the function then used as variables in a new table. The following codes describe the methodology:
   1. meanstdev <- features$V2[grep("mean\\(\\)|std\\(\\)",features$V2)]
   2. selectedVar <- c("subjectId","activityId", as.character(meanstdev))

## Description of the variables in the tidydata.txt file
General description of the file including:
 - Dataset contains 10299 observations and 69 variables 
 - Dataset has the average of each variable for each activity and each subject
 - Data measurements variables are as follow:
   *timeBodyAccelerometer-mean-X 
   *timeBodyAccelerometer-mean-Y
   *timeBodyAccelerometer-mean-Z
   *timeBodyAccelerometer-std-X
   *timeBodyAccelerometer-std-Y
   *timeBodyAccelerometer-std-Z
   *timeGravityAccelerometer-mean-X
   *timeGravityAccelerometer-mean-Y
   *timeGravityAccelerometer-mean-Z
   *timeGravityAccelerometer-std-X
   *timeGravityAccelerometer-std-Y
   *timeGravityAccelerometer-std-Z
   *timeBodyAccelerometerJerk-mean-X
   *timeBodyAccelerometerJerk-mean-Y
   *timeBodyAccelerometerJerk-mean-Z
   *timeBodyAccelerometerJerk-std-X
   *timeBodyAccelerometerJerk-std-Y
   *timeBodyAccelerometerJerk-std-Z
   *timeBodyGyroscope-mean-X
   *timeBodyGyroscope-mean-Y
   *timeBodyGyroscope-mean-Z
   *timeBodyGyroscope-std-X
   *timeBodyGyroscope-std-Y
   *timeBodyGyroscope-std-Z
   *timeBodyGyroscopeJerk-mean-X
   *timeBodyGyroscopeJerk-mean-Y
   *timeBodyGyroscopeJerk-mean-Z
   *timeBodyGyroscopeJerk-std-X
   *timeBodyGyroscopeJerk-std-Y
   *timeBodyGyroscopeJerk-std-Z
   *timeBodyAccelerometerMagnitude-mean
   *timeBodyAccelerometerMagnitude-std
   *timeGravityAccelerometerMagnitude-mean
   *timeGravityAccelerometerMagnitude-std
   *timeBodyAccelerometerJerkMagnitude-mean
   *timeBodyAccelerometerJerkMagnitude-std
   *timeBodyGyroscopeMagnitude-mean
   *timeBodyGyroscopeMagnitude-std
   *timeBodyGyroscopeJerkMagnitude-mean
   *timeBodyGyroscopeJerkMagnitude-std
   *frequencyBodyAccelerometer-mean-X
   *frequencyBodyAccelerometer-mean-Y
   *frequencyBodyAccelerometer-mean-Z
   *frequencyBodyAccelerometer-std-X
   *frequencyBodyAccelerometer-std-Y
   *frequencyBodyAccelerometer-std-Z
   *frequencyBodyAccelerometerJerk-mean-X
   *frequencyBodyAccelerometerJerk-mean-Y
   *frequencyBodyAccelerometerJerk-mean-Z
   *frequencyBodyAccelerometerJerk-std-X
   *frequencyBodyAccelerometerJerk-std-Y
   *frequencyBodyAccelerometerJerk-std-Z
   *frequencyBodyGyroscope-mean-X
   *frequencyBodyGyroscope-mean-Y
   *frequencyBodyGyroscope-mean-Z
   *frequencyBodyGyroscope-std-X
   *frequencyBodyGyroscope-std-Y
   *frequencyBodyGyroscope-std-Z
   *frequencyBodyAccelerometerMagnitude-mean
   *frequencyBodyAccelerometerMagnitude-std
   *frequencyBodyAccelerometerJerkMagnitude-mean
   *frequencyBodyAccelerometerJerkMagnitude-std
   *frequencyBodyGyroscopeMagnitude-mean
   *frequencyBodyGyroscopeMagnitude-std
   *frequencyBodyGyroscopeJerkMagnitude-mean
   *frequencyBodyGyroscopeJerkMagnitude-std
  

### Other variables in the dataset
   *subjectId : test subject ID
   *activityID 
   *activitytype : activity types corresponding to activity ID, i.e. Walking, Sitting, Standing, etc.



