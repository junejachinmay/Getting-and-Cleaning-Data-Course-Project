## Getting and Cleaning Data Course Project

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

In this project, data collected from the accelerometer and gyroscope of the Samsung Galaxy S smartphone was retrieved, worked with, and cleaned, to prepare a tidy data that can be used for later analysis.

My repository contains the following files:

* run_analysis.R - my R script used to create the tidy data set
* README.md - this explains the analysis files clearly.
* CodeBook.md - indicates all the variables and summaries calculated, along with units, and any other relevant information.
* tidy_data.txt - my output tidy data set.

## Study Design

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## My Script

My run_analysis.R script is attached in this repository. It has 5 parts: 

Part 1 merges the training and the test datasets to create one data set called "X", "Y", and "Subject". 

Part 2 extracts only the measurements on the mean and standard deviation for each measurement in "index"

Part 3 uses descriptive activity names from activity_lables.txt to name the activities in the data set "Y"

Part 4 appropriately labels the data set with descriptive variable names.

Part 5, from the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Result

Result is shown in tidydata.txt file.
