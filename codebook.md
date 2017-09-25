## Code book 
Getting and Cleaning Data Course Project
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##Description of the data:
The data are taken from experiments carried out by 30 volunteers who each performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, laying). They wore a smartphone on their waste while completing the activities. The smartphone's accelerometer and gyroscope captured 3 axial linear acceleration and 3-axial angular velocity. For each record in the data set, the triaxial acceleration from the accelerometer and the estimated body acceleration is provided, as well as the triaxial angular velocity from the gyroscope, a 561 feacture vector with time (t) and frequency (f) domain variables, activity labels and subject id numbers. Since this project was only concerned with variables that had mean or standard deviation measurements, the following variables were included (XYZ indicate the 3 axial directions... these were combined to save space):
```
subjectid
activity
tBodyAcc-mean()-XYZ            
tBodyAcc-std()-XYZ
tGravityAcc-mean()-XYZ           
tGravityAcc-std()-XYZ           
tBodyAccJerk-mean()-XYZ          
tBodyAccJerk-std()-XYZ           
tBodyGyro-mean()-XYZ             
tBodyGyro-std()-XYZ              
tBodyGyroJerk-mean()-XYZ         
tBodyGyroJerk-std()-XYZ          
tBodyAccMag-mean()             
tBodyAccMag-std()
tGravityAccMag-mean()
tGravityAccMag-std()           
tBodyAccJerkMag-mean()
tBodyAccJerkMag-std()
tBodyGyroMag-mean()            
tBodyGyroMag-std()
tBodyGyroJerkMag-mean()
tBodyGyroJerkMag-std()        
fBodyAcc-mean()-XYZ           
fBodyAcc-std()-XYZ              
fBodyAcc-meanFreq()-XYZ         
fBodyAccJerk-mean()-XYZ         
fBodyAccJerk-std()-XYZ           
fBodyAccJerk-meanFreq()-XYZ     
fBodyGyro-mean()-XYZ            
fBodyGyro-std()-XYZ             
fBodyGyro-meanFreq()-XYZ       
fBodyAccMag-mean()
fBodyAccMag-std()
fBodyAccMag-meanFreq()        
fBodyBodyAccJerkMag-mean()
fBodyBodyAccJerkMag-std()
fBodyBodyAccJerkMag-meanFreq()
fBodyBodyGyroJerkMag-mean()
fBodyBodyGyroJerkMag-std()
fBodyBodyGyroJerkMag-meanFreq()
```
Only a few files from the data files are required to create the merged tidy data set. The files used are listed below:
```
1. Subject id numbers
subject_train.txt
subject_test.txt
2. Activity files
y_test.txt
y_train.txt
3. Main data files
X_test.txt
X_train.txt
4. Activity names
activity_labels.txt
5. Main data file varible names
features.txt
```


