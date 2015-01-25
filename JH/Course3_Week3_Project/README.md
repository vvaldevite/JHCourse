#README
##Coursera Getting and Cleaning Data - Week 3 - Course Project
The objective of this R script is to create a tidy dataset as requested in the Course Project of the Coursera Getting and Cleaning Data - Week 3.

The data derives from the Samsung's devices sensors and can be found at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
A description about the raw data can be found at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

A short description about the steps to create the tidy dataset are:
*Merges the training and the test sets to create one data set.
*Extracts only the measurements on the mean and standard deviation for each measurement. 
*Uses descriptive activity names to name the activities in the data set
*Appropriately labels the data set with descriptive variable names. 
*From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

To run the R script, execute the function run_analysis(). This functions expects that the raw data resides in a folder inside your working directory, called "UCI HAR Dataset".
The R script is commented for a better understanding. Below are some steps of the algorithm.
*read all files that will be used
*merge the test dataset into 1 data set
*merge the train dataset into 1 data set
*merge the test and train datasets
*extract only the mean and std measurments
*rename the columns
*add the corresponding activity names
*average each value grouped by activity and subject
*write the data to disk

For more information about the final variables, please read the Code Book.