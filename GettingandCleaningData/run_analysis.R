# Set working directory

setwd("D:/Users/tsoiwa/datasciencecoursera/GettingandCleaningData")

# load data.table library

library(data.table)

# Downloading and unzipping file
    ## 1. Check if the "courseproject" folder exists. If not, create a "courseproject" folder
    ## 2. download the file from url
    ## 3. unzip the files into the "courseproject" folder

if(!file.exists("./courseproject")){dir.create("./courseproject")}
    fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileurl, destfile = "./courseproject/Dataset.zip")
    unzip(zipfile = "./courseproject/Dataset.zip", exdir = "./courseproject")

# Read and load the activity labels and features
    activitylabels <- read.table("./courseproject/UCI HAR Dataset/activity_labels.txt")
    features <- read.table("./courseproject/UCI HAR Dataset/features.txt")    
    
# Read and load the training datasets
    trainset <- read.table("./courseproject/UCI HAR Dataset/train/X_train.txt")
    trainlabels <- read.table("./courseproject/UCI HAR Dataset/train/y_train.txt")
    trainsubject <- read.table("./courseproject/UCI HAR Dataset/train/subject_train.txt")

# Read and load the testing datasets
    testset <- read.table("./courseproject/UCI HAR Dataset/test/X_test.txt")
    testlabels <- read.table("./courseproject/UCI HAR Dataset/test/y_test.txt")
    testsubject <- read.table("./courseproject/UCI HAR Dataset/test/subject_test.txt")
    
# Combined data based on subjects, activity types and test/training dataset by binding the rows
    subjects <- rbind(testsubject,trainsubject)
    acttypes <- rbind (testlabels,trainlabels)
    datset <- rbind(testset,trainset)
    
# Assign names to variables
    colnames(subjects) <- "subjectId"
    colnames(acttypes) <- "activityId"
    colnames(datset) <- features$V2
    colnames(activitylabels) <- c("activityId","activitytype")
    
# Merge all training data into one
    combdata <- cbind(subjects,acttypes)
    totaldata <- cbind(combdata,datset)

# Extract the measurement on the mean and standard deviation for each measurement
    meanstdev <- features$V2[grep("mean\\(\\)|std\\(\\)",features$V2)]
    selectedVar <- c("subjectId","activityId", as.character(meanstdev))
    
# Select those data with the specified requirement above
    totaldata <- totaldata[,selectedVar]

# Label the variables in dataset with descriptive names
    colnames(totaldata) <- gsub("^t","time",colnames(totaldata))
    colnames(totaldata) <- gsub("^f","frequency",colnames(totaldata))
    colnames(totaldata) <- gsub("Acc","Accelerometer",colnames(totaldata))
    colnames(totaldata) <- gsub("Gyro","Gyroscope",colnames(totaldata))
    colnames(totaldata) <- gsub("Mag","Magnitude",colnames(totaldata))
    colnames(totaldata) <- gsub("BodyBody","Body",colnames(totaldata))
    colnames(totaldata) <- gsub("[()]","",colnames(totaldata))
    
# Creating a second, independent tidy dataset with the average of each variable
# for each activity and each subject
    tidydata <- aggregate(. ~subjectId + activityId, totaldata, mean)
    tidydata <- tidydata[order(tidydata$subjectId,tidydata$activityId),]
    
# Merge with activity labels to give descriptive activity names and re-order the variables
    finaltidydata <- merge(totaldata, activitylabels, by="activityId", all.x=TRUE)
    finaltidydata <- finaltidydata[,c(2,1,69,3:68)]
    
# Write the result into a text file
    write.table(finaltidydata,"tidydata.txt",row.names = FALSE)


    