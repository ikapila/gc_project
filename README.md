# run_analysis.R

This function retuns a tidy data set from the  Human Activity Recognition Using Smartphones Data. A full description of this data set is available at : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


The source data is available at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

This function requires the sourse data to be available in the working directory in it is original form. Source data should also remain in the orginal sub directories.


This function makes the source data tidy by 
1. mergeing the training and the test sets to create one data set.
2. Extracting only the measurements on the mean and standard deviation for each measurement. 
3. Using descriptive activity names to name the activities in the data set.
4. Appropriately labeling the data set with descriptive variable names. 
5. Producing a data set with the average of each variable for each activity and each subject.

# How to use this function

1. Download the source data to your working director from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

2. Load the "dplyr" package if it is not already loaded

3. Load the tidy data set in to a varialble.
Example: tidy_data <- run_analysis() 