# this R script does the following:
# 1.	Merges the training and the test sets to create one data set.
# 2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3.	Uses descriptive activity names to name the activities in the data set
# 4.	Appropriately labels the data set with descriptive variable names. 
# 5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# load packages
library(dplyr)

# Check if the dataset exists and download it if it's not
if (!file.exists("UCI\ HAR\ Dataset")) {
    fileUrl <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl,destfile="UCI\ HAR\ Dataset.zip",method="curl")
    unzip(zipfile="UCI\ HAR\ Dataset.zip")
    message("Make sure that the downloaded dataset is saved to your working directory while running this R script")
}

# Read text file
# features
features<-read.table("./UCI\ HAR\ Dataset/features.txt")
# test
t_subject_id<-read.table("./UCI\ HAR\ Dataset/test/subject_test.txt") # subject_id
t_activity_label<-read.table("./UCI\ HAR\ Dataset/test/y_test.txt") # test activity label
t_result<-read.table("./UCI\ HAR\ Dataset/test/X_test.txt") # test data
t_data<-data.frame(t_subject_id,t_activity_label,t_result)
# train
n_subject_id<-read.table("./UCI\ HAR\ Dataset/train/subject_train.txt")
n_activity_label<-read.table("./UCI\ HAR\ Dataset/train/y_train.txt")
n_result<-read.table("./UCI\ HAR\ Dataset/train/X_train.txt")
n_data<-data.frame(n_subject_id,n_activity_label,n_result)

# 1. to merge into one dataset
DT<-bind_rows(t_data,n_data) %>%
    as_tibble

# 2. to extract only the measurements on the mean and std
features<-sub("BodyBody","Body",features[,2]) # refine the feature names with 2 'Body' strings
index<-grep("(.*mean[^Freq].*)|(.*std.*)",features) # features index selected for future use. Avoid meanFreq or Mean
features_selected<-grep("(.*mean[^Freq].*)|(.*std.*)",features,value = TRUE) # feature names selected for future use
result_selected<-select(DT,-(1:2)) %>%
    select(.,all_of(index)) # result selected based on the index
measurement_limited<-cbind(select(DT,1:2),result_selected) %>% # limit measurements to mean and std
    as_tibble
colnames(measurement_limited)<-c("subject_id","activity_label",features_selected) # set variable names

# 3. activity_label to activity name
activityid<-read.table("./UCI\ HAR\ Dataset/activity_labels.txt",col.names = c("activity_label","activity"))
activity_name_introduced <-
    merge(activityid,measurement_limited,by.y = "activity_label")

# 4. create a tidy dataset
tidied<-cbind(select(activity_name_introduced,subject_id,activity),select(activity_name_introduced,-(1:3))) %>% # change the order of columns
    arrange(subject_id) %>%
    as_tibble

# 5. the average of each variable for each activity and each subject
final_data<-aggregate(. ~ subject_id + activity,data=tidied,mean) %>%
    arrange(subject_id)

# save the final result as a text file
write.table(final_data,"mean.txt",row.names = FALSE)
