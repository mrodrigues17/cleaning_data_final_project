#all of the train and test data (including labels and features) are stored in a directory.
#first need to set the directory as your wd before running code

library(reshape2)
#1. Merges the training and test sets to create one data set
# read in and merge the two data files
train_data <- read.table("X_train.txt")
test_data <- read.table("X_test.txt")
merged_data <- rbind(train_data, test_data)

#read in features, which will be applied as column names
features <- read.table("features.txt")
#only need the second column of the file. 
features <- features$V2
#give the merged train/test data set column names (dplyr::glimpse() on this shows 10,299 obs with 561 variables) 
colnames(merged_data) <- features

#read in and merge the data files related to the 6 activities
train_activities <- read.table("Y_train.txt")
test_activities <- read.table("Y_test.txt")
merged_activities <- rbind(train_activities, test_activities)
#change from numbers to corresponding activity labels (this is #3 for the assignment)
merged_activities$V1 <- gsub("1", "WALKING", merged_activities$V1)
merged_activities$V1 <- gsub("2", "WALKING_UPSTAIRS", merged_activities$V1)
merged_activities$V1 <- gsub("3", "WALKING_DOWNSTAIRS", merged_activities$V1)
merged_activities$V1 <- gsub("4", "SITTING", merged_activities$V1)
merged_activities$V1 <- gsub("5", "STANDING", merged_activities$V1)
merged_activities$V1 <- gsub("6", "LAYING", merged_activities$V1)
#change column name of merged_activities to something more informative
colnames(merged_activities) <- "activity"

#read in the subject # data files and merge together
train_subjects <- read.table("subject_train.txt")
test_subjects <- read.table("subject_test.txt")
merged_subjects <- rbind(train_subjects, test_subjects)
#change the column name to something more informative
colnames(merged_subjects) <- "subjectid"

#merge all of the data sets into one
merged_all <- cbind(merged_subjects, merged_activities, merged_data)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.

#Only want mean and standard deviation (std) measurements from the file
mean_std <- grep(pattern = "mean|std", features)
#add 2 to this because we added two variables: merged activities & merged subjects
mean_std <- mean_std + 2
#Need to subset merged_all based on mean_std. This is now a tidy data set with relevant measurements
merged_all <- merged_all[,c(1, 2, mean_std)]

#3. Uses descriptive activity names to name the activities in the data set (already accomplised)
#4. Appropriately labels the data set with descriptive variable names.
#already accomplished(took label names from "features.txt" and applied)

#5 From the data set in step 4, creates a second, independent tidy data set with the average of 
#each variable for each activity and each subject.

#from the reshape2 package, melt creates unique subject-id/activity combinations. The following scripts
#"cast" the data frame so that the mean is given for each variable for each unique combination
melted_dataset <- melt(merged_all, id = c("subjectid", "activity"))
final_dataset <- dcast(melted_dataset, subjectid + activity~variable, mean)

#a glimpse() at the final data set shows that means are calculated for each subject, for each activity
#turn this data set into a txt file
write.table(final_dataset, file = "final_dataset.txt")

