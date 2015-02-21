# GandCD_Project

# Purporse of this repository
This repository contains all items related to Getting and Cleaning Data (from Coursera) course project.
<br>There are:
<ul>
  <li>An R script, called <B>run_analysis.R</B>, that perform the requested analysis</li>
  <li>A code book, called <B>CodeBook.md</B>, that describes the variables, the data, and transformations performed</li>
  <li>A tidy dataset</li>
</ul>
The tidy dataset is created using long form and considering each variable that contain "mean" or "std" in the name.
<br>
#Prerequisites
The data for this project is located here https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
<br>A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The script assumes that data is downloaded and available in your working directory.
If not you can use the script <B>getdata.R</B> to download the data.

Data are stored on local directory called <B>UCI HAR Dataset</B> under your working directory. 

In R studio the following packages are assumed installed: <B>data.table</B> and <B>reshape2</B>. Please check them and install if not available in your R Studio.
<br>
#Run Analysis
Check prerequisites<br>
Make sure the folder "UCI HAR Dataset" and the run_analysis.R script are both in the current working directory.<br>
Load run_analysis.R in R Studio (using source command)<br>
Run the script
<br>
#Result
The script create a file called <B>project.txt</B>, with write.table instruction, in your working directory.<br>
This file contains the tidy dataset
