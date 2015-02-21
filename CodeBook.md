CodeBook
=================================================
This file describes the variables, the data, and transformations used in run_analisys.R

#Data & Variables
* The following site contains the original data and full description:<br>
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones      
* The data for the project are:<br>
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* The final dataset of the project is a data table with following characteristics:<br>
```
>str(dataTidy)
'data.frame':	14220 obs. of  4 variables:
 $ subject     : Factor w/ 30 levels "1","2","3","4",..: 1 1 1 1 1 1 1 1 1 1 ...
 $ activityName: Factor w/ 6 levels "LAYING","SITTING",..: 1 1 1 1 1 1 1 1 1 1 ...
 $ measureName : Factor w/ 79 levels "tBodyAcc-mean()-X",..: 1 2 3 4 5 6 7 8 9 10 ...
 $ value       : num  0.2216 -0.0405 -0.1132 -0.9281 -0.8368 ...
> summary(dataTidy)
    subject                  activityName             measureName        value         
 1      :  474   LAYING            :2370   tBodyAcc-mean()-X:  180   Min.   :-0.99767  
 2      :  474   SITTING           :2370   tBodyAcc-mean()-Y:  180   1st Qu.:-0.95242  
 3      :  474   STANDING          :2370   tBodyAcc-mean()-Z:  180   Median :-0.34232  
 4      :  474   WALKING           :2370   tBodyAcc-std()-X :  180   Mean   :-0.41241  
 5      :  474   WALKING_DOWNSTAIRS:2370   tBodyAcc-std()-Y :  180   3rd Qu.:-0.03654  
 6      :  474   WALKING_UPSTAIRS  :2370   tBodyAcc-std()-Z :  180   Max.   : 0.97451  
 (Other):11376                             (Other)          :13140    
```
* The dataset is written in TXT file in working directory<br>

#Transformation
* The run_analysis.R script performs the following steps to clean the data:   
 1. Read training data: set (x_train.txt), labels (y_train.txt) and subjects (subject_train.txt) from the "./UCI HAR Dataset/train" folder and store them in variables.       
 2. Read test data: set (x_train.txt), labels (y_train.txt) and subjects (subject_train.txt) from the "./UCI HAR Dataset/test" folder and store them in variables.  
 3. Create test dataset and training dataset combining by columns the portion of data
 4. Combine by row test and training datasets to create a single dataset (point 1 of the project)
 5. Read feature names (feature.txt) from the "./UCI HAR Dataset" folder and store them in variable.
 6. Paste feature names in dataset using feature ID as join variable
 7. Extract only the measures (columns) related to mean and std (mean and std in the name, point 2 of the project)
 8. Read activity labels (activity_labels.txt) from the "./UCI HAR Dataset" folder and store them in variable.
 9. Paste activity labels in dataset using activity number as join variable (point 3 of the project)
 10. Set label names to descriptive variable names (point 4 of the project)
 11. Melt data to create dataset in a long structure
 12. Aggregate data to calculate average for each measure (point 5 of the project)
 13. Write TXT file using write.table
 
 
