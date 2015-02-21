
#Load requested library
  library("data.table","reshape2")

#Locate the data files
  Trainingset <- "UCI HAR Dataset/train/X_train.txt"
  Traininglabels <- "UCI HAR Dataset/train/y_train.txt"
  Trainingsubject <- "UCI HAR Dataset/train/subject_train.txt"
  Testset <- "UCI HAR Dataset/test/X_test.txt"
  Testlabels <- "UCI HAR Dataset/test/y_test.txt"
  Testsubject <- "UCI HAR Dataset/test/subject_test.txt"

#Read local files
  data_traininglabels <- fread(Traininglabels)
  data_testlabels <- fread(Testlabels)
  data_trainingsubject <- fread(Trainingsubject)
  data_testsubject <- fread(Testsubject)
#fread doesn't recognize correctly EOF in the set files
#Use of another function to read the file, but we need to convert to data.table
  data_trainingset <- read.table(Trainingset)
  data_testset <- read.table(Testset)
  data_trainingset <- data.table(data_trainingset)
  data_testset <- data.table(data_testset)

#Subject is a variable, labels is a variable, set is a set of variables (each of them in one column)
#MERGE of datasets means add columns subject and labels then merge by row
  setnames(data_traininglabels, "V1", "activityNum")
  setnames(data_trainingsubject, "V1", "subject")
  data_training <- cbind(data_trainingsubject, data_traininglabels, data_trainingset)
  setnames(data_testlabels, "V1", "activityNum")
  setnames(data_testsubject, "V1", "subject")
  data_test <- cbind(data_testsubject, data_testlabels, data_testset)
#Merge datasets 
#POINT 1: Merges the training and the test sets to create one data set.
  dataset <- rbind(data_training,data_test)
  
#To define a dataset only with mean and std measures, features.txt says which columns to extract
#Read features and define a dataset with subsets of mean and std features
  featurename <- "UCI HAR Dataset/features.txt"
  data_feature <- fread(featurename)
  setnames(data_feature,colnames(data_feature),c("featureID","featurename"))
  data_feature <- data_feature[grep("mean|std",featurename),]
  data_feature$featurecode <- paste0("V",data_feature$featureID)

#Extract the required dataset 
#POINT 2: Extracts only the measurements on the mean and standard deviation for each measurement.
  dataselection <- dataset[,c("subject","activityNum",data_feature$featurecode),with=FALSE]
  
#Retrieve activity label
  activityFile <- "UCI HAR Dataset/activity_labels.txt"
  data_activitylabels <- fread(activityFile)
  setnames(data_activitylabels, "V1", "activityNum")
  setnames(data_activitylabels, "V2", "activityName")

#POINT 3: Uses descriptive activity names to name the activities in the data set
  datamerged <- merge(data_activitylabels,dataselection,by="activityNum",all.y=TRUE)

#POINT 4: Appropriately labels the data set with descriptive variable names. 
  setnames(datamerged, old=data_feature$featurecode, new=data_feature$featurename)

#Prepare to calculate average
  datamerged[,activityNum:=NULL]
  setkey(datamerged,subject,activityName)
  datamerged$activityName <- factor(datamerged$activityName)
  datamerged$subject <- factor(datamerged$subject)
#It's not necessary to indicate id.vars because we created the factor columns
  dataTidy <- data.table(melt(datamerged,id.vars=key(datamerged),variable.name = "measureName"))

#POINT 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
  dataTidy2 <- aggregate(dataTidy$value,by=list(dataTidy$subject,dataTidy$activityName,dataTidy$measureName),FUN=mean)
  setnames(dataTidy2,new=names(dataTidy),old=names(dataTidy2))
  dataTidy2 <- dataTidy2[order(dataTidy2$subject, dataTidy2$activityName,dataTidy2$measureName),]
  write.table(dataTidy2,file="project.txt", row.name=FALSE)
