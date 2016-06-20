library("dplyr")

getDataSet <- function(){
     
     trainData <- getData("train")
     
     testData <- getData("test")
     
     output <- rbind(trainData, testData)
     
     return(output)     
}

getData <- function(dataSetName){
     
     directories <- getDataDirectories(dataSetName )
     
     for(i in seq_along(directories)){
          
          files <- getFileList(as.character(directories[i]), dataSetName)
          
          currentData <- importData(directories[i], files)
          
          ifelse(i == 1, output <- currentData, output <- cbind(output,
                 currentData))
     }
     
     output[,"Dataset"] <- dataSetName
     
     output <- select(output, Dataset, Subject, Activity, everything())
     
     output <- tbl_df(output)
     
     return(output)
}

getDataDirectories <- function(dataSetName){
     
     root <- "UCI HAR Dataset/"
     
     output <- list()
     
     output[1] <- paste0(root, dataSetName, "/")
     
     output[2] <- paste0(root, dataSetName,"/Inertial Signals/")
     
     return(output)
}

getFileList <- function(directory, dataSetName){
     
     directory <- as.character(directory)
     
     ifelse(grepl("/Inertial Signals", directory)[1],
            pattern   <- paste0("_[xyz]_", dataSetName, "\\.txt$"),
           
            ifelse(grepl("^UCI HAR Dataset/", directory),
                   pattern <- paste0("_", dataSetName, "\\.txt$"),
                   return()
          )
     )
     
     output <- list.files(directory, pattern = pattern)
     
     return(output)
}

importData <- function(directory, fileList){ 
     
     output <- data.frame()
     
     message("Importing from ", directory)
     
          for(i in seq_along(fileList)){
               
               currentFile <- paste0(directory, fileList[i])
               
               message("Importing file: ", fileList[i])
               
               currentData <- read.table(currentFile)
               
               names(currentData) <- getColumNames(currentFile)
              
               ifelse(i == 1, output <- currentData,
                      output <- cbind(currentData, output))
          }
      
     message(directory, " import complete.")
     
     return(output)
}

getColumNames <- function(fileName){
     
     output <- character()
     
     if(grepl("_(gyro|acc)_([Xx]|[Yy]|[Zz])_(train|test)\\.txt$", fileName)[1]){
          
          ifelse(grepl("_[Xx]_", fileName)[1], axis <- "X",
          ifelse(grepl("_[Yy]_", fileName)[1], axis <- "Y",
          axis <- "Z")
          )
          
          ifelse(grepl("body", fileName)[1], motionReference <- "Body",
                 motionReference <- "Total")
     
          ifelse(grepl("_gyro_", fileName)[1], motion <- "AngularVelocity",
                 motion <- "Acceleration")
          
          windowIndex <- c(1:128)
          
          output <- paste0(windowIndex, motionReference, motion, axis)
     }
     
     else if(grepl("([Xx]|[Yy]|subject)_(train|test)\\.txt$", fileName)[1]){
          
          ifelse(grepl("/[Xx]", fileName)[1],
                 output <- readLines("UCI HAR Dataset/features.txt"),
          ifelse(grepl("/[Yy]", fileName)[1], output <- "Activity",
          output <- "Subject")
          )
     }
     
     return(output)
}

activitiesAsFactors <- function(dataFrame){
     
     message("Importing file: activity_labels.txt")
     
     activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
     
     message("Import complete.")
     
     dataFrame$Activity <- factor(dataFrame$Activity,
                                  levels = activityLabels$V1,
                                  labels = activityLabels$V2)
     
     return(dataFrame)
}

columnFilter <- function(dataFrame, includeFreqMeans = FALSE,
                         includeAngleMeans = FALSE){
     
     filter <- "Subject|Activity|std[(][)]"
     
     ifelse(includeAngleMeans, filter <- paste0(filter,"|Mean|mean[(][)]"),
            filter <- paste0(filter,"|mean[(][)]"))
     
     ifelse(includeFreqMeans, filter <- paste0(filter, "|meanFreq[(][)]"),
            filter <- filter)
     
     filter <- paste0("(", filter, ")")
     
     cols <- grepl(filter, names(dataFrame))
     
     output <- dataFrame[,cols]
     
     return(output)
}

descriptiveColumnNames <- function(dataFrame){
     
     columnNames <- names(dataFrame)
     
     columnNames <- sub("([1-9]|[1-9][0-9]|[1-9][0-9][0-9]) fBodyAcc",
                        "FreaquencyBodyAcceleration", columnNames)
     
     columnNames <- sub("([1-9]|[1-9][0-9]|[1-9][0-9][0-9]) fBodyBodyAcc",
                        "FrequencyBodyBodyAcceleration", columnNames)
     
     columnNames <- sub("([1-9]|[1-9][0-9]|[1-9][0-9][0-9]) fBodyBodyGyro",
                        "FrequencyBodyBodyAngularVelocity", columnNames)
     
     columnNames <- sub("([1-9]|[1-9][0-9]|[1-9][0-9][0-9]) fBodyGyro",
                        "FrequencyBodyAngularVelocity", columnNames)
     
     columnNames <- sub("([1-9]|[1-9][0-9]|[1-9][0-9][0-9]) tBodyAcc",
                        "TimeBodyAcceleration", columnNames)
     
     columnNames <- sub("([1-9]|[1-9][0-9]|[1-9][0-9][0-9]) tBodyBodyAcc",
                        "TimeBodyBodyAcceleration", columnNames)
     
     columnNames <- sub("([1-9]|[1-9][0-9]|[1-9][0-9][0-9]) tGravityAcc",
                        "TimeGravityAcceleration", columnNames)
     
     columnNames <- sub("([1-9]|[1-9][0-9]|[1-9][0-9][0-9]) tBodyGyro",
                        "TimeBodyAngularVelocity", columnNames)
     
     columnNames <- sub("([1-9]|[1-9][0-9]|[1-9][0-9][0-9]) angle[(]tBodyAcc",
                        "Angle(TimeBodyAcceleration", columnNames)
     
     columnNames <- sub("([1-9]|[1-9][0-9]|[1-9][0-9][0-9]) angle[(]tBodyGyro",
                        "Angle(TimeBodyAngularVelocity", columnNames)
     
     columnNames <- sub("([1-9]|[1-9][0-9]|[1-9][0-9][0-9]) angle[(]",
                        "Angle(", columnNames)
     
     columnNames <- sub("^([1-9]|[1-9][0-9]|[1-9][0-9][0-9])-","", columnNames)
     
     columnNames <- sub("mean[(][)]", "Mean", columnNames)
     
     columnNames <- sub("std[(][)]", "StandardDeviation", columnNames)
     
     columnNames <- sub("meanFreq[(][)]", "FrequencyMean", columnNames)
     
     columnNames <- sub("Mag", "Magnitude", columnNames)
     
     names(dataFrame) <- columnNames
     
     return(dataFrame)
}

getGroupSummaryMean <- function(dataFrame){
     
     output <- dataFrame %>% group_by(Subject, Activity) %>% 
          summarise_each(funs(mean))
     
     return(output)
}

HumanActivityRecognitionSummary <- (getTidyData <- function(
                                   includeFreqMeans = FALSE,
                                   includeAngleMeans = FALSE){
     
     output <- getDataSet()
     
     output <- columnFilter(output, includeFreqMeans, includeAngleMeans)
     
     output <- activitiesAsFactors(output)
     
     output <- descriptiveColumnNames(output)
     
     output <- getGroupSummaryMean(output)
     
     return(output)
})()
