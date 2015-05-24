# RUN ANALYSIS.R
# Note: Input data: UCI HAR Dataset. Look at the CodeBook.md for more info.

library(dplyr)

# 1. Merges the training and the test sets to create one data set.
x_train <- read.table("UCI HAR Dataset/train/X_train.txt") # read training data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")    # read test data
x_data <- rbind(x_train,x_test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("id","name")) 
logical_vector <- grepl("mean\\(",features$name) | grepl("std\\(",features$name)
x_data <- x_data[,logical_vector]

# 3. Uses descriptive activity names to name the activities in the data set.
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = c("activity.label"))
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = c("activity.label") )
y_data <- rbind(y_train,y_test)

activity_names <- function(i){
    activity_vector = c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS",
                        "SITTING","STANDING","LAYING")
    activity_vector[i]
}
y_data <- mutate(y_data, activity.label=activity_names(activity.label))

# 4. Appropriately labels the data set with descriptive variable names.
features.name <- features$name[logical_vector]
colnames(x_data)[1:length(features.name)] <- as.character(features.name)

# 5. From the data set in step 4, creates a second, independent tidy data set with the 
# average of each variable for each activity and each subject.

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = c("subject.ID"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = c("subject.ID"))
s_data <- rbind(subject_train,subject_test)  # subject identifier column

mergeData <- cbind(x_data,y_data,s_data)  # all the info in a single fata frame

groupData <- aggregate(. ~subject.ID + activity.label, mergeData, mean)
groupData <- groupData[order(groupData$subject.ID,groupData$activity.label),]
write.table(groupData, file = "tidy_dataset.txt", row.name = FALSE)


