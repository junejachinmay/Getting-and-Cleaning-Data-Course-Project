## My R Script for "Getting and Cleaning Data Course"" Project
## I use a Mac, so there was no need to unzip the files.
## My zip file is downloaded and saved under working directory.

## Reading the files

## Test:

XTest<- read.table("UCI HAR Dataset/test/X_test.txt")
YTest<- read.table("UCI HAR Dataset/test/Y_test.txt")
SubjectTest <-read.table("UCI HAR Dataset/test/subject_test.txt")

## Train:

XTrain<- read.table("UCI HAR Dataset/train/X_train.txt")
YTrain<- read.table("UCI HAR Dataset/train/Y_train.txt")
SubjectTrain <-read.table("UCI HAR Dataset/train/subject_train.txt")

## Features:

features<-read.table("UCI HAR Dataset/features.txt")

## Activity:

activity<-read.table("UCI HAR Dataset/activity_labels.txt")


## Part1
## Merges the training and the test sets to create one data set
## Row-binding X data of test and train together and doing the same for Y data and Subject data.

X<-rbind(XTest, XTrain)
Y<-rbind(YTest, YTrain)
Subject<-rbind(SubjectTest, SubjectTrain)

## Just to get an idea about how the data looks like and what its dimensions are:

head(X,5)
head(Y,5)
head(Subject,5)
dim(X)
dim(Y)
dim(Subject)

## Part2
## Extracts only the measurements on the mean and standard deviation for each measurement.
## To achieve this, we need to use the features dataset which contains the means and standard deviations.
## Below function gives the number of indices which contains mean and standard deviation.

index<-grep("mean\\(\\)|std\\(\\)", features[,2])

## Checking the length of index which gives the total count.

length(index)

## Extracting the variables with mean and standard deviation.

X<-X[,index] 

## Checking dimensions of subset 

dim(X)

## Part3
## Uses descriptive activity names to name the activities in the data set.
## Using the activity_labels.txt data as a lookup for our data set

Y[,1]<-activity[Y[,1],2] 

## Part4
## Appropriately labels the data set with descriptive variable names.
## Gathering names from our data set containing only means and standard deviations

Names<-features[index,2]

## Providing proper descriptive names to our variables
names(X)<-Names 
names(Y)<-"Activities"
names(Subject)<-"SubjectIDs"

## Prepping data for Part5

cleandata<-cbind(Subject, Y, X)

## Part5
## From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
## Putting the cleandata in table format.

library(data.tables)
cleandata<-data.table(cleandata)

## Getting average of Subject and Activity in tidydata dataset.

tidydata <- cleandata[, lapply(.SD, mean), by = 'SubjectIDs,Activities'] 

## Creating our tidydata.txt 

write.table(tidydata, file = "tidydata.txt", row.names = FALSE)

##Viewing 5 rows and columns of our tidydata dataset

head(tidydata[,c(1:5), with = FALSE],5) 