library(dplyr)
#1 - Merging all the datasets into one dataset
## Read all concerned datasets
x_train <- read.table("./../data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./../data/UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("./../data/UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("./../data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./../data/UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("./../data/UCI HAR Dataset/test/subject_test.txt")

## Creating the merged dataset
x_total <- rbind(x_train, x_test)
y_total <- rbind(y_train, y_test)
subject_total <- rbind(subject_train, subject_test)

merged_data <- cbind(x_total, y_total, subject_total)

#2 - Extract the data on the mean and the standard deviation on each measurement
mean_measurement <- data.frame(apply(merged_data[,1:561],1, mean))
sd_measurement <-  data.frame(apply(merged_data[,1:561],1, sd))

extracted_data <- cbind(mean_measurement, sd_measurement, y_total, subject_total)

#3 - Describing each activity by a fitting name
colnames(merged_data)[562] <- "Activity"
category <- read.table("./../data/UCI HAR Dataset/activity_labels.txt")

for (index in seq_along(category[,2])) {
   merged_data[,562] <- gsub(pattern=category[index,1], category[index,2], merged_data[,562])
}

#4 - Decribing each data measurement by a fitting name
measurement_labels <- read.table("./../data/UCI HAR Dataset/features.txt")
for (index in 1:dim(measurement_labels)[1]) {
   colnames(merged_data)[index] <- measurement_labels[index,2]
}

#5 - Creating a second, independent tidy data set with the average of each variable for each activity and each subject
colnames(merged_data)[563] <- "Subject"
colnames(merged_data) <- make.unique(colnames(merged_data))
final_data <- merged_data %>% group_by(Activity, Subject) %>% summarise(across(everything(), list(mean))) 
write.csv(final_data, "./../data/UCI HAR Dataset/tidy_data.csv")