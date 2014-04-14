# run_analysis.R function 
#
# Written for the Coursera course "Getting and Cleaning Data" by Jeff Leek
# take data from:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# 
#

run_analysis <- function(path = "") {
  
  # path of the files on my machine
  path_X_test = paste0(path,"UCI HAR Dataset/test/X_test.txt")
  path_Y_test = paste0(path,"UCI HAR Dataset/test/y_test.txt")
  path_X_train = paste0(path,"UCI HAR Dataset/train/X_train.txt")
  path_Y_train = paste0(path,"UCI HAR Dataset/train/y_train.txt")
  path_subject_test = paste0(path,"UCI HAR Dataset/test/subject_test.txt")
  path_subject_train = paste0(path,"UCI HAR Dataset/train/subject_train.txt")
  
  # load the data into tables
  X_test = read.table(path_X_test)
  Y_test = read.table(path_Y_test)
  X_train = read.table(path_X_train)
  Y_train = read.table(path_Y_train)
  subject_test = read.table(path_subject_test)
  subject_train = read.table(path_subject_train)
  
  # bind the data by rows 
  X = rbind(X_train , X_test)
  Y = rbind(Y_train , Y_test)
  subject = rbind(subject_train,subject_test)
  
  # load the features dictionary 
  features = read.table(paste0(path,"UCI HAR Dataset/features.txt"))
  
  # find the columns in X that only contains "mean()" and "std()"
  mean_and_std_columns = grep("mean|std",features[,2])
  
  # Extract in X_mean_and_std the columns in X with mean or std
  X_mean_and_std = X[,mean_and_std_columns]
  
  # Also change the names of columns because easier to deal with
  colnames(X_mean_and_std) = features[unlist(mean_and_std_columns),2]
  colnames(subject) = "subject"
  
  # load the activity labels dictionary 
  activity_labels = read.table(paste0(path,"UCI HAR Dataset/activity_labels.txt"))
  
  # Change the elements of Y to descriptive activity names
  activity  = activity_labels[unlist(Y),2]
  
  # bind the data by columums
  full_data = cbind(X_mean_and_std,activity,subject)
  
  # compute the mean for each of the variable by subject and by activity
  mean_by_subject_and_activity = aggregate(.~activity+subject , full_data , mean)
  
  return(mean_by_subject_and_activity)
}

