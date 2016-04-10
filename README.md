#Getting and Cleaning Data - Course Project#
Week 4

The contents of this repository are related to the Coursera Project for Getting and Cleaning data.  The purpose of this readme file is to explain the purpose and process of the attached R files.

###About the Project###
Purpose: produce Tidy Data for further analysis.

Reason for analysis: Companies like FitBit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 

Data source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Datasets (zip file): Human Activity Recognition Using Smartphones https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The data linked are collected from the accelerometers from the Samsung Galaxy S smartphone.

###Libraries Used###
* library(data.table)
* library(dplyr)

###Files###
* run_analysis.R, this is the "executable".
* tidyData.txt, the Tidy dataset.
* codebook.md, indicate all the variables and summaries calculated, along with units, and any other relevant information.
* README.md, this document.

#About the run_analysis.R file#
When you source/run this script it will:
* Change your working directory to the root directory "C:".
* Check to see if you have a directory called "data" and if you don't create it.
* Move to the directory "C:/data".
* Download the data set from the wesbite noted above.
* Unzip the files.
* Merge the test and train data.
* Extract measurments on the mean and stanedard deviation for each measurement.
* Assign descriptive activitiy names to describle activities in dataset.
* Assign descriptive variable names to dataset.
* Create a Tidy dataset and save it as tidyData.txt in the directory "C:/data/UCI HAR Dataset/".

###Important Note###
Depending on your processor and memory this may take a few moments to complete.  The dataset is moderate in size and R runs in memory. Please be patient. 
