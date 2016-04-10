#CODEBOOK#
Getting and Cleaning Data - Course Project (Week 4)

###Contents of this Document###
* GENERAL
 * Purpose
 * Data Source
 * Datasets
* THE CODE
 * Variables
 * Process
* THE DATA
 * Activities
 * Features

##GENERAL##

###Purpose###
The purpose of this codebook is to describe the variables, the data, and the functions used to clean up the data.  It's important to note that this code will automatically execute the download and extraction of the data.

###Data Source###
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

###Dataset(s)###
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
This is a zipped file that will be downloaded to a locally generated folder at the root.

##THE CODE##
###Variables###
Described in order of use:

* **fileUrl**: stores the URL for the datasource, used to download dataset
* **x_train**: all data from X_train.txt
* **y_train**: all data from y_train.txt
* **subject_train**: all data from subject_train.txt
* **x_test**: all data from X_test.txt
* **y_test**: all data from y_test.txt
* **subject_train**: all data from subject_test.txt
* **x_data**: merged data from x_train and x_test, row bound
* **y_data**: merged data from y_train and y_test, row bound
* **subject_data**: merged dated subject_train and subject_test
* **features**: data from features.txt
* **ms_features**: features where columns contain the string mean or std
* **activities**: data from activity_labels.txt
* **all_data**: all data bound by activity, column bound
* **avg_data**: all_data averaged by subject/activity excluding columns 1 - 66

###Process###
This script creates a tidy dataset from the data linked above.  It automatically downloads, extracts, parses and cleans the data to create a clean data set called tidyData.txt.  When you source/run this function the process is as follows:
* Sets your working directory to "c:".
* Checks to see if there is a folder called "data".  If not, it creates the folder.
* Sets your working directory to "c:/data".
* Downloads the data set from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and puts it in the folder "c:/data".
* Unzips the file and stores it in current folder "c:/data".
* Loads the library data.table.
* Loads the library dplyr.
* Merges data (STEP 1):
 * Creates a dataset from the X_train.txt file (X_train).
 * Creates a dataset from the y_train.txt file (y_train).
 * Creates a dataset from the subject_train.txt file (subject_train).
 * Creates a dataset from the X_test.txt file (X_test).
 * Creates a dataset from the y_test.txt file (y_test).
 * Creates a dataset from the subject_test.txt file (subject_test).
 * Merges datasets x_train and x_text (x_data) binding data by row.
 * Merges datasets y_train and y_text (y_data) binding data by row.
* Extracts mean and standard deviation (STEP 2):
 * Creates dataset from features.txt (features).
 * Creates dataset (ms_features) by grepping columns with the string "mean" or "std" in the column name.
 * Uses ms_features to rename columns in x_data set.
* Assigns descriptive activitity names (STEP 3):
 * Creates dataset from activity_labels.txt (activities).
 * Uses activities to rename activities to something more "readable".
 * Assigns new descriptive values to activities.
* Assigns descriptive values to subject (STEP 4):
 * Changes column "subject_data" to "subject"
 * Merges all data (all_data) to create one dataset bound by column.
* Creates and stores a tidy dataset (STEP 5):
 * Creates a data set (avg_data) averaging all subjects/activities excluding columns 1 - 66.
 * Creates a tidy dataset and saves it to the local directory as tidyData.txt (C:/data/UCI HAR Dataset/tidyData.txt) setting the row.name to false.

##DATA##

### Activties ###
* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

### Features ###
* tBodyAccMeanX
* tBodyAccMeanY
* tBodyAccMeanZ
* tBodyAccStdX
* tBodyAccStdY
* tBodyAccStdZ
* tGravityAccMeanX
* tGravityAccMeanY
* tGravityAccMeanZ
* tGravityAccStdX
* tGravityAccStdY
* tGravityAccStdZ
* tBodyAccJerkMeanX
* tBodyAccJerkMeanY
* tBodyAccJerkMeanZ
* tBodyAccJerkStdX
* tBodyAccJerkStdY
* tBodyAccJerkStdZ
* tBodyGyroMeanX
* tBodyGyroMeanY
* tBodyGyroMeanZ
* tBodyGyroStdX
* tBodyGyroStdY
* tBodyGyroStdZ
* tBodyGyroJerkMeanX
* tBodyGyroJerkMeanY
* tBodyGyroJerkMeanZ
* tBodyGyroJerkStdX
* tBodyGyroJerkStdY
* tBodyGyroJerkStdZ
* tBodyAccMagMean
* tBodyAccMagStd
* tGravityAccMagMean
* tGravityAccMagStd
* tBodyAccJerkMagMean
* tBodyAccJerkMagStd
* tBodyGyroMagMean
* tBodyGyroMagStd
* tBodyGyroJerkMagMean
* tBodyGyroJerkMagStd
* fBodyAccMeanX
* fBodyAccMeanY
* fBodyAccMeanZ
* fBodyAccStdX
* fBodyAccStdY
* fBodyAccStdZ
* fBodyAccMeanFreqX
* fBodyAccMeanFreqY
* fBodyAccMeanFreqZ
* fBodyAccJerkMeanX
* fBodyAccJerkMeanY
* fBodyAccJerkMeanZ
* fBodyAccJerkStdX
* fBodyAccJerkStdY
* fBodyAccJerkStdZ
* fBodyAccJerkMeanFreqX
* fBodyAccJerkMeanFreqY
* fBodyAccJerkMeanFreqZ
* fBodyGyroMeanX
* fBodyGyroMeanY
* fBodyGyroMeanZ
* fBodyGyroStdX
* fBodyGyroStdY
* fBodyGyroStdZ
* fBodyGyroMeanFreqX
* fBodyGyroMeanFreqY
* fBodyGyroMeanFreqZ
* fBodyAccMagMean
* fBodyAccMagStd
* fBodyAccMagMeanFreq
* fBodyBodyAccJerkMagMean
* fBodyBodyAccJerkMagStd
* fBodyBodyAccJerkMagMeanFreq
* fBodyBodyGyroMagMean
* fBodyBodyGyroMagStd
* fBodyBodyGyroMagMeanFreq
* fBodyBodyGyroJerkMagMean
* fBodyBodyGyroJerkMagStd
* fBodyBodyGyroJerkMagMeanFreq


