project for the "Getting and Cleaning Data" Coursera course
====================

This code works the data found there:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

- The code extract training and test sets and merges the test set with the train set for each variable  "X", "y" and "subject".
- It selects the variables related to the mean and standard deviation
- It renames the columns to more meaningful names
- It replaces the activity labels by its literal counterpart found in "activity_labels.txt"
- It merges the different data sets into one
- It returns the data averaged by activity and subject 




