cleaning-data-project
=====================

This code was created as a practice assignment to clean data as part of the coursera data science specialization.  Data were taken from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

For more information about the original dataset see:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

This script assumes that the content of the zip file about (with including intact "test" and "train" directories) are in the working directory.

The script does the following:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
  * In this script all mean and standard deviation measurements were taken using both time and frequency domain and time domain data
* Uses descriptive activity names to name the activities in the data set
  * Depreciated charcters "-()" were removed
  * Case was changed to match R standards
* Appropriately labels the data set with descriptive activity names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Please see the code book for details regarding variables in the tidy dataset.