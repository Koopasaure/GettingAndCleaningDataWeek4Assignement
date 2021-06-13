# GettingAndCleaningDataWeek4Assignement

This repository is part od the assignment for Getting and Cleaning Data Coursera week 4 course.

   - First, download and unzip the data file into your R working directory : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
   - Second, take the R script called run_analysis.R and execute it to obtain the tidy data set.

There are different categories of data :
   - X data are sorted through 561 columns and represents the sensor signals measured with waist-mounted smartphone (Samsung Galaxy S)
   - Y data represents the activity that was performed to get the X data on this row
   - Subject data represents which one of the 30 subjects performed the activity on this row

This code was written according to the instructions given by the week 4 assignment of the Getting and Cleaning data Coursera Course
    1- Merges the training and the test sets to create one data set.
      a - Read all datasets from training and tests from the downloaded data
      b - Merging all datasets into one dataset
    2- Extracts only the measurements on the mean and standard deviation for each measurement.
      a- Obtain the mean and the standard deviation on each measurement
      b- Put the extracted data in a new dataframe
    3- Uses descriptive activity names to name the activities in the data set
      Replace the numbers by each activity name so that each activity is described appropriately
    4- Appropriately labels the data set with descriptive variable names. 
      Replace the column names for each variable so that the each variable is described appropriately
    5- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
      a- Summarising the data so that we obtain the average of each variable for each subject
      b- Creating the second tidy dataset asked by the instructions
