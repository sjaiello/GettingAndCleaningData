---
title: 'Read Me: Getting and Cleaning Data Project'
author: "Steve Aiello"
date: "June 19, 2016"
output: html_document
---
##getingAndCleaningDataProject.R  
#####This script is designed to import data from the Human Activity Recognition Using Smartphones Data Set and extract the mean and standard deviation attributes and summarize the mean of each attribute for each subject and activity.
##Before sourcing this script be sure:
     1. Save this script in the top level of the working directory.
     2. The dplyr package is installed (the script will load it but it will not install it).
     3. The "getdata-projectfiles-UCI HAR Dataset.zip" must be unzipped in the top level of the working directory.  Do not move or rename files or sub-directories of the data set. 
 
##Running the script:  
####From the R consol type:  
##### source("gettingAndCleaningDataProject.R")  
#####this will create 11 functions descriped below and the data frame  
#####HumanActivityRecognitionSummary  
#####which is the tidy data set (step 5 of the assignment) and .

#####There is nothing else you need to do.  However each function can be run independently as long as it's passed the correct input.   Also if you would like to see the data from each stap of the project run the folloing commands in order.

#####step1Answer <- getDataSet()  
#####step2Answer <- columnFilter(step1Answer)  
#####step3Answer <- activitiesAsFactors(step2Answer)  
#####step4Answer <- descriptiveColumnNames(step3Answer)  
#####step5Answer <- getGroupSummaryMean(step4Answer)  

#####If you would like to include the meanFreq() and angle() data in the summary you can run getTidyData with the includeFreqMeans or includeAngleMeans set to TRUE or any combination there of.  
####Example:  
#####step5WithFreqMean <- getTidyData(includeFreqMeans = TRUE, includeAngleMeans = FALSE)  

##Code Structure:
#####The code is structured such that each function never calls a function defined above it, with the exception of the last function which is immediatly envoked and requires the functions above to be defined at the time the code is sourced.  Each function can be called independently with the correct input.
 
###Function list:  
getDataSet()  
getData()  
getDataDirectories()  
getFileList()  
importData()  
getColumnNames()  
activitiesAsFactors()  
columnFilter()  
descriptiveColumnNames()  
getGroupSummaryMean()  
getTidyData()  
  
###Function descriptions:
####getDataSet()
  This function takes no inputs.  It will get data from both data sets (test and train), combined them into 1 untidy data set and return the combine data set.  This function is called by getTidydata().

####getData()
This function has 1 required input called 'dataSetName'.  'dataSetName' is a character vector.  It will retrieve all of the data for dataSetName (train or test), add a new column to the data set named Dataset.  This column is the name of the data set the data is from, finally it will order the columns such that the first 3 columns are Dataset, Subject, Activity.  This function is called by getDataSet().

####getDataDirectories()
This function has 1 required input called 'dataSetName'.  'dataSetName' is a character vector.  It returns a list of the directories where files for 'dataSetName' are located.  (Note no error checking is done, this function assumes the file structure is in the current working directory and has not been changed from the supplied structure in the .zip file).  This function is called by getData()

####getFileList()
This function has 2 required inputs called 'directory' and 'dataSetName'.  It returns a list of files in 'directory' that match a pattern partially based on 'dataSetName'.  This function is called by getData().

####importData()
This function has 2 required inputs called 'directory' and 'fileList'.  It reads the files from fileList that are in 'directory into a data frame and renames the columns based on the file name.  This function also provides user feedback in the form of a messages informing the user directory files are being imported from, the name file imported and when the import for the directory is complete. (Note this is not an indication of success or failure, it's just a status of where it is in the process).  It returns the imported data in the form of a data frame.  This function is called by getData()

####getColumnNames()
This function has 1 required input called 'fileName'.  This function uses 'fileName' to construct a column name vector for the data in the file.  The format for the Inertial Signals data is windowIndex, motionReference, motion, axis.  Where windowIndex is the number of the window from 1:128, motionReference is eaither Body or Total, motion is AngularVelocity or Acceleration, and axis is X, Y, or Z. So the  column names for the file body_ gyro_z_test.txt  would be 1BodyAngularVelocityZ.  The column names for X_test are read from the features.txt file, the column names y_test Activity and finally the column name for subject_ is Subject.  It returns a character vector of column names.  This function is called by importData().

####activitiesAsFactors()
This function as 1 required input called 'dataFrame'.  This function reads the activity_labels.txt file to obtain the activity factors, then it converts the Activity numbers in dataFrame to factors obtained in the file above.  It returns a data frame with the Activities as factors.

####columnFilter()
This function has 1 required input 'dataFrame' and 2 optional inputs 'includeFreqMeans' and 'includeAngleMeans'.  This function filters out all the columns of dataFrame except for Subject, Activity, and the mean and standard deviation data from the features set. It returns the filtered dataFrame. Note: there was some confusion as to weather or not they wanted the freqMean and angle(x, gravityMean).  I assumed they did not want these included, however to be safe I added code to include one both or neither of these in the tidy data set.  These are included by setting includeFreqMeans or includeAngleMeans to TRUE.  They are FALSE by default.  This function is called by getTidyData().

####descriptiveColumnNames()
This function has 1 required input 'dataFrame'.  This function renames column names for 'dataFrame' to more descriptive names.  It removes any leading numbers and dashes, preceding t or f are changed to Time  or Frequency, Acc is changed to Acceleration, Gyro is changed to AngularVelocity, angle is changed to Angle, mean() is changed to Mean, std() is changed to StandardDeviation and meanFrequency is changed to MeanFrequency.  It returns a data frame with the new column names.  This function is called by getTidyData()

####getGroupSummaryMean()
This function has 1 required input 'dataFrame'  This function groups the data in dataFrame by Subject then Activity and summarizes the mean of each variable.  It returns the grouped and summarized data as a data frame.  This function is called by getTidyData()

####getTidyData()
This function has 2 optional inputs, includeFreqMeans and includeAngleMeans.  This function returns a tidy summarized data frame of the data in the UCI HAR Data set.  The two optional parameters are respectively set to TRUE if the user wants to include the mean frequency or Angle( , mean) data in the summary data frame.  Both options are FALSE by default.  See notes for the columnFilter() function for more information.  Also this function is immediately invoked when the file is sourced and will create a data frame named HumanActivityRecognitionSummry.
