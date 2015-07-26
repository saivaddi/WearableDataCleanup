##Purpose of the document
This document describes how to create a tidy data set using raw data obtained from UCI. 

##Downloading the relevant files
* Download the run_analysis.R file to your local directory. 
* It is imperative that the local directory also contain a directory named "UCI HAR Dataset" which in turn 
contains the sub-directories "Train" and "Test". 
* The raw data is downloaded from the following website and unzipped into the local directory where the run_analysis.R is also located.
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


##Executing the R Script
* Open the run_analysis.R function from your R Studio.
* Source the code and run it from the command the prompt by simply typing run_analysis()
* The output produced from the code is a csv file written to a text file in the same directory and is named "tidyData.txt".
