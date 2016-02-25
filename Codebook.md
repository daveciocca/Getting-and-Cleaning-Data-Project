# Codebook
##### Getting and Cleaning Data - Course Project
##### David Ciocca - Feb 2016

### Project Data:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Data Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Analysis:

The data read into R includes the following files:

x_test.txt, y_test.txt, subject_test.txt, x_train.txt, y_train.txt, subject_train.txt, features.txt, activity_labels.txt

###### The run_analysis.R script takes the data thourgh several transformations.

1.  Training and test sets are merged into one data set.
2.  Measurements of mean and standard deviation are isolated from other measurements.
3.  Descriptive names are applied to the activities in the data set.
4.  Variables are descriptively labeled.
5.  An independent, tiday data set is created, and output as "tidyFile.txt".
