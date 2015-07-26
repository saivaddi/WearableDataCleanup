run_analysis <- function() {
  
  #Loading the feature name file
  featnames <- read.table("UCI HAR Dataset/features.txt")
  
  #Loading the training dataset
  xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
  yTrain <- read.table("UCI HAR Dataset/train/y_train.txt")
  sIndsTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")

  #Loading the test dataset    
  xTest <- read.table("UCI HAR Dataset/test/X_test.txt")
  yTest <- read.table("UCI HAR Dataset/test/y_test.txt")
  sIndsTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
  
  #Merging the training and test datasets
  xData <- rbind(xTrain, xTest)
  yData <- rbind(yTrain, yTest)
  sIndData <- rbind(sIndsTrain, sIndsTest)

  #Extracting measurements with mean and std
  colInds <- regexpr("mean|std", featnames[,2])
  subData <- xData[,colInds > 0]
  tidyDataNames <- c()
  
  #Renaming (Refactoring) the yData using activity labels
  yData[,1] <- as.factor(yData[,1])
  activityNames <- read.table("UCI HAR Dataset/activity_labels.txt")
  levels(yData[,1]) <- activityNames[,2]
  
  #Updating the merged data frame
  subData <- cbind(sIndData, yData, subData)
  
  #Initializing the tidyData data frame
  tidyData <- data.frame(matrix(nrow=0, ncol=ncol(subData)))
  
  count <- 1
  for (i in 1:30) { #Looping over subjects
    
    for (j in 1:6) { #Looping over activities
      tidyData[count,1] = i #Column 1 is for Subject ID
      tidyData[count,2] = as.character(activityNames[j,2]) # Column 2 is for Activity
      # Remaining columns computed below are the subject + activity specific measurement averages
      tidyData[count,3:ncol(subData)] = apply(subData[(subData[,1]==i) & (subData[,2]==activityNames[j,2]),3:ncol(subData)], 2, mean)
      count <- count + 1      
    }

  }

  posInds <- which(colInds>0)
  # Giving variable(column) names for the tidyData data frame
  tidyDataNames[1:2] <- c("Subject ID", "Activity")
  for (i in 3:ncol(subData)) {
    tidyDataNames[i] = gsub("-|\\()","",featnames[posInds[i-2],2])  
    }
  
  # Setting the names
  names(tidyData) <- tidyDataNames
  print(head(tidyData))

  # Writing the data to a file in comma separated format (csv)
  write.table(tidyData, "tidyData.txt", row.names = FALSE,sep=",")
 
}