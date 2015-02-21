#Download the dataset from internet location
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  localname <- "dataset.zip"
  download.file(url, destfile=localname)

#Unzip the archive locally
  unzip(localname)