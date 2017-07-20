## Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The script, run_analysis.R, contains codes as follow:

   1. Set the working directory the files are going to be saved
   2. Downloading the files and unzip into the desired working directory
   3. Loading and reading the training, training and the labels files
   4. Combining files based on subjects and activities
   5. Re-assigning names to variables to descriptive names
   6. Merged all the data into one dataset
   7. Extract those data which contains mean and standard deviation
   8. Re-labeled the variable names to give a better descriptive meaning
   9. Create a second tidy dataset with the average of each variable for each activity and each subject
   10.Merge the dataset with activity label to provide descriptive activities and re-arrange the variables logically

The result is stored as tidydata.txt