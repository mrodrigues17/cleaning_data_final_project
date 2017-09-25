# getting-and-cleaning-data-final-project
Repo with files related to the final project for Coursera's Getting and Cleaning Data

All of the train and test data (including labels and features) are stored in a directory. You need to download the zip files, save them in a directory and set your working directory before running the code.

#1. Merges the training and test sets to create one data set
These scripts read in the two main data files, then merges by rows using rbind. The features file, which has all of the variable names for the data, will be read in, filtered by column two, then applied as the column names for the merged data.
```
library(reshape2)
train_data <- read.table("X_train.txt")
test_data <- read.table("X_test.txt")
merged_data <- rbind(train_data, test_data)
features <- read.table("features.txt")
features <- features$V2
colnames(merged_data) <- features
```
These next set of scripts read in the data related to the activities, then merge them similarly to the previous merge. These are coded 1-6, so these numbers need to be replaced with the corresponding activity (these are listed in "activity_labels.txt"). The column is renamed to be more descriptive.
```
train_activities <- read.table("Y_train.txt")
test_activities <- read.table("Y_test.txt")
merged_activities <- rbind(train_activities, test_activities)
merged_activities$V1 <- gsub("1", "WALKING", merged_activities$V1)
merged_activities$V1 <- gsub("2", "WALKING_UPSTAIRS", merged_activities$V1)
merged_activities$V1 <- gsub("3", "WALKING_DOWNSTAIRS", merged_activities$V1)
merged_activities$V1 <- gsub("4", "SITTING", merged_activities$V1)
merged_activities$V1 <- gsub("5", "STANDING", merged_activities$V1)
merged_activities$V1 <- gsub("6", "LAYING", merged_activities$V1)
colnames(merged_activities) <- "activity"
```
These scripts read in and merge the data related to the subjects' id numbers. The column name is changed to be more informative.
```
train_subjects <- read.table("subject_train.txt")
test_subjects <- read.table("subject_test.txt")
merged_subjects <- rbind(train_subjects, test_subjects)
colnames(merged_subjects) <- "subjectnumber"
```
Now that all of the data are renamed, they are ready to all be merged together.
```
merged_all <- cbind(merged_subjects, merged_activities, merged_data)
```
#2. Extracts only the measurements on the mean and standard deviation for each measurement.
If we looked at the structure of this data set, we would see that it has 563 variables. The assignment states we only want measurements on meand and standard deviation (std), so these scripts identify which items in the features file contain either "mean" or "std" in their name.
```
mean_std <- grep(pattern = "mean|std", features)
```
If we were to apply this to "merged_all", it would be incorrect since we added two columns. This scripts adds 2 to this new variable to offset this
```
mean_std <- mean_std + 2
```
Now the merged data set can be subsetted. This subset will only include the first two columns and all columns related to mean & std.
```
merged_all <- merged_all[,c(1, 2, mean_std)]
```
#3. Uses descriptive activity names to name the activities in the data set (already accomplised)
#4. Appropriately labels the data set with descriptive variable names.
Both 3 & 4 are already accomplished. The activity numbers were replaced with the corresponding activities and the merged data set now has appropriate variable names.

#5 From the data set in step 4, creates a second, independent tidy data set with the average of 
#each variable for each activity and each subject.

From the reshape2 package, melt creates unique subject-id/activity combinations and dcast casts the data frame so that the mean is given for each variable for each unique combination.
```
melted_dataset <- melt(merged_all, id = c("subjectid", "activity"))
final_dataset <- dcast(melted_dataset, subjectid + activity~variable, mean)
```
This is now the final tidy data set that is ready for analysis. We can save this as a "txt" file using write.table
```
write.table(final_dataset, file = "final_dataset.txt")
```
