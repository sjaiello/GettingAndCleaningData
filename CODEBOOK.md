---
title: 'Code Book Getting And Cleaning Data Project'
author: "Steve Aiello"
date: "June 19, 2016"
output: html_document
---
###Data Collection
####  The data in this data set is from the Human Activity Recognition Using Smartphones Data Set.  The test and train data has been merged together into one data set in it's raw form.  As the raw data did not contain column labels, column labels were added as needed.  The labels for the columns is explained in the READMEgettingAndCleaningDataProject file under the getColumnNames() function.  For incormation on  how the data was collected and the explaination of the raw variables and units please see the README.txt and features_info.txt that is included in the 'getdata-projectfiles-UCI HAR Dataset.zip' file.  
###Data Processing
####A subset of the data set containing only the mean and standard deviation variables as well as the Subject and Activity data was extracted from the full data set.  
####Activity values were replace with activity names as defined in the activity_labels.txt file in the HAR dataset.  
####Variable names were changed to be more descriptive. These changes are descriped in the READMEgettingAndCleaningDataProject file under the function descriptiveColumnNames().
####Finally the subset data was grouped by Subject and Activity; and the mean was calculated for each varable for the subject preforming the activity

###Data Set Format 
####There are 66 variables plus 20 optional variables.  By Default the 20 optional variables are not included. (see READgettingAndCleaningDataProject for more information about optinal variables)  The first two columns of the dataset are Subject and Activity the next 66 columns contain the calculated mean for each group as defined above.      

###Observation Labels
####Subject                                                        
####Activity 
###Variable List
####TimeBodyAcceleration-Mean-X                                    
####TimeBodyAcceleration-Mean-Y                                    
####TimeBodyAcceleration-Mean-Z                                    
####TimeBodyAcceleration-StandardDeviation-X                       
####TimeBodyAcceleration-StandardDeviation-Y                       
####TimeBodyAcceleration-StandardDeviation-Z                       
####TimeGravityAcceleration-Mean-X                                 
####TimeGravityAcceleration-Mean-Y                                 
####TimeGravityAcceleration-Mean-Z                                 
####TimeGravityAcceleration-StandardDeviation-X                    
####TimeGravityAcceleration-StandardDeviation-Y                    
####TimeGravityAcceleration-StandardDeviation-Z                    
####TimeBodyAccelerationJerk-Mean-X                                
####TimeBodyAccelerationJerk-Mean-Y                                
####TimeBodyAccelerationJerk-Mean-Z                                
####TimeBodyAccelerationJerk-StandardDeviation-X                   
####TimeBodyAccelerationJerk-StandardDeviation-Y                   
####TimeBodyAccelerationJerk-StandardDeviation-Z                   
####TimeBodyAngularVelocity-Mean-X                                 
####TimeBodyAngularVelocity-Mean-Y                                 
####TimeBodyAngularVelocity-Mean-Z                                 
####TimeBodyAngularVelocity-StandardDeviation-X                    
####TimeBodyAngularVelocity-StandardDeviation-Y                    
####TimeBodyAngularVelocity-StandardDeviation-Z                    
####TimeBodyAngularVelocityJerk-Mean-X                             
####TimeBodyAngularVelocityJerk-Mean-Y                             
####TimeBodyAngularVelocityJerk-Mean-Z                             
####TimeBodyAngularVelocityJerk-StandardDeviation-X                
####TimeBodyAngularVelocityJerk-StandardDeviation-Y                
####TimeBodyAngularVelocityJerk-StandardDeviation-Z                
####TimeBodyAccelerationMagnitude-Mean                             
####TimeBodyAccelerationMagnitude-StandardDeviation                
####TimeGravityAccelerationMagnitude-Mean                          
####TimeGravityAccelerationMagnitude-StandardDeviation             
####TimeBodyAccelerationJerkMagnitude-Mean                         
####TimeBodyAccelerationJerkMagnitude-StandardDeviation            
####TimeBodyAngularVelocityMagnitude-Mean                          
####TimeBodyAngularVelocityMagnitude-StandardDeviation             
####TimeBodyAngularVelocityJerkMagnitude-Mean                      
####TimeBodyAngularVelocityJerkMagnitude-StandardDeviation         
####FreaquencyBodyAcceleration-Mean-X                              
####FrequencyBodyAcceleration-Mean-Y                              
####FrequencyBodyAcceleration-Mean-Z                              
####FrequencyBodyAcceleration-StandardDeviation-X                 
####FrequencyBodyAcceleration-StandardDeviation-Y                 
####FrequencyBodyAcceleration-StandardDeviation-Z                 
####FrequencyBodyAccelerationJerk-Mean-X                          
####FrequencyBodyAccelerationJerk-Mean-Y                          
####FrequencyBodyAccelerationJerk-Mean-Z                          
####FrequencyBodyAccelerationJerk-StandardDeviation-X             
####FrequencyBodyAccelerationJerk-StandardDeviation-Y             
####FrequencyBodyAccelerationJerk-StandardDeviation-Z             
####FrequencyBodyAngularVelocity-Mean-X                            
####FrequencyBodyAngularVelocity-Mean-Y                            
####FrequencyBodyAngularVelocity-Mean-Z                            
####FrequencyBodyAngularVelocity-StandardDeviation-X               
####FrequencyBodyAngularVelocity-StandardDeviation-Y               
####FrequencyBodyAngularVelocity-StandardDeviation-Z               
####FrequencyBodyAccelerationMagnitude-Mean                       
####FrequencyBodyAccelerationMagnitude-StandardDeviation          
####FrequencyBodyBodyAccelerationJerkMagnitude-Mean                
####FrequencyBodyBodyAccelerationJerkMagnitude-StandardDeviation   
####FrequencyBodyBodyAngularVelocityMagnitude-Mean                 
####FrequencyBodyBodyAngularVelocityMagnitude-StandardDeviation    
####FrequencyBodyBodyAngularVelocityJerkMagnitude-Mean             
####FrequencyBodyBodyAngularVelocityJerkMagnitude-StandardDeviation  
###Optional Variables
####FrequencyBodyAcceleration-FrequencyMean-X                     
####FrequencyBodyAcceleration-FrequencyMean-Y                     
####FrequencyBodyAcceleration-FrequencyMean-Z
####FrequencyBodyAccelerationJerk-FrequencyMean-X                 
####FrequencyBodyAccelerationJerk-FrequencyMean-Y                 
####FrequencyBodyAccelerationJerk-FrequencyMean-Z  
####FrequencyBodyAngularVelocity-FrequencyMean-X                   
####FrequencyBodyAngularVelocity-FrequencyMean-Y                   
####FrequencyBodyAngularVelocity-FrequencyMean-Z
####FrequencyBodyAccelerationMagnitude-FrequencyMean  
####FrequencyBodyBodyAccelerationJerkMagnitude-FrequencyMean  
####FrequencyBodyBodyAngularVelocityMagnitude-FrequencyMean  
####FrequencyBodyBodyAngularVelocityJerkMagnitude-FrequencyMean    
####Angle(TimeBodyAccelerationMean,gravity)                        
####Angle(TimeBodyAccelerationJerkMean),gravityMean)               
####Angle(TimeBodyAngularVelocityMean,gravityMean)                 
####Angle(TimeBodyAngularVelocityJerkMean,gravityMean)             
####Angle(X,gravityMean)                                           
####Angle(Y,gravityMean)                                           
####Angle(Z,gravityMean)