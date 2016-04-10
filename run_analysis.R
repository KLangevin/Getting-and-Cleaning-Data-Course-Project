## Getting and Cleaning Data
## Week 4
## Project - Tidy Data using Samsung datasets


###########################
## SETUP
###########################

  ## Set the working directory to root
    setwd("C:/")

  ## DOWNLOAD AND UNZIP THE DATA
    if(!file.exists("./data")){dir.create("./data")}
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl,destfile="./data/Dataset.zip")
    unzip(zipfile="./data/Dataset.zip",exdir="./data")

  ## LOAD LIBRARIES
    library(data.table)
    library(dplyr)

    
    
###########################
## ASSIGNMENT REQUIREMENTS
###########################
    
## STEP 1
## Merge the training and the test sets to create one data set.

  ## Read and store train data first
    x_train <- read.table("C:/data/UCI HAR Dataset/train/X_train.txt")
    y_train <- read.table("C:/data/UCI HAR Dataset/train/y_train.txt")
    subject_train <- read.table("C:/data/UCI HAR Dataset/train/subject_train.txt")
  
  ## Read and store test data next
    x_test <- read.table("C:/data/UCI HAR Dataset/test/X_test.txt")
    y_test <- read.table("C:/data/UCI HAR Dataset/test/y_test.txt")
    subject_test <- read.table("C:/data/UCI HAR Dataset/test/subject_test.txt")
    
  ## Bind the datasets by row
    x_data <- rbind(x_train, x_test)
    y_data <- rbind(y_train, y_test)
    subject_data <- rbind(subject_train, subject_test)


## STEP 2
## Extract only the measurements on the mean and standard deviation for each measurement.

  ## First extract the features from source file
    features <- read.table("C:/data/UCI HAR Dataset/features.txt")
    
  ## Then extract the columns with mean() or std() in their names
    ms_features <- grep("-(mean|std)\\(\\)", features[, 2])

  ## Then subset the columns
    x_data <- x_data[, ms_features]
    
  ## Then fix the column names
    names(x_data) <- features[ms_features, 2]
    

## STEP 3
## Use descriptive activity names to name the activities in the data set.

  ## First get the activity names
    activities <- read.table("C:/data/UCI HAR Dataset/activity_labels.txt")
  
  ## Then change the values of to something more readable
    y_data[, 1] <- activities[y_data[, 1], 2]
  
  ## Then rename the column
    names(y_data) <- "activity"
    
## STEP 4
## Appropriately label the data set with descriptive variable names.

  ## Change the column names to reflect appropriate subject
    names(subject_data) <- "subject"
    
  ## Bind the data by column
    all_data <- cbind(x_data, y_data, subject_data)
  
    
## STEP 5
## From the data set, create a second, independent tidy data set with the average of each variable for each activity and each subject.
    
  ## Exclude columns 1 through 66 showing only activities and subjects
    avg_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

  ## Create a file storing averages
    write.table(avg_data, "C:/data/UCI HAR Dataset/tidyData.txt", row.name=FALSE)
