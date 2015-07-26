##Objective
The objective of this project is to create a tidy data set associated with the UCI Har Dataset.

##Collection of Raw Data
The raw data is downloaded from the following website and unzipped into the local directory where the run_analysis.R is also located.
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##Raw Data
* The raw data consists of accelerometer and gyro measurements recorded from 30 different subjects while they were involved in six different physical activities such as standing and walking. 
* It contains a total of 561 measurements that encapsulate the acceleration and gyroscope time series measurements. 
* The raw data is available as two different sub sets one labeled "Train" and the other labeled "Test". The two sub-sets contain different number of rows but the same number of columns.


###Creating the tidy data file
1. Load the subject ID data, and the data associated with X and Y train and test files into the R workspace.
2. Concatenate the subject ID, X, and y data sets to create three separated bigger data sets.
3. Select those variables/columns from the X data set whose names have either "mean" or "std". This would result in a total of 79 columns for the X dataset
4. Merge the subject Id, y, and X datasets to get a data frame with 81 columns
5. Select all measurements specific to the 30 different subjects specific to the six activities and take the average of the 79 measurements described earlier.
6. The tidy data set finally has 180 row and 81 columns.
7. Write the data set to a file name "tidyData.txt" in comma separated format.

###Description of variable names
