# Data-Wrangling
Foundations of Data Science data wrangling project using Samsung Galaxy S Smartphone dataset for human activity recognition 

###Load dplyr & tidyr
[library(dplyr)
library(tidyr)]

###Loading and exploring the structure of the dataset.  
Doing this I came up with 8 different tables/data frames that would need to be merged, they are: x_train, y_train, x_test, y_test, subject_test, subject_train, feature_labels, and activity_labels. 


###Merge training and test data (on X,subject & y respectively)
At this point, the task was to merge the training data with the test data, which is what I did to create 3 different data frames called x_data, subject_total, and y_data, each from x_test & x_train, subject_test & subject_train, and y_test & y_train, respectively. At this point, I ignored the labels for the data.

[x_data <- bind_rows(x_train, x_test)
subject_total <- bind_rows(subject_train, subject_test)
y_data <- bind_rows(y_train, y_test)]

###Apply labels to data.  
At this point, I am ready to merge the feature_labels & activity_labels to the data.  Feature labels were applied for the column names and activity labels were applied to describe the numbers 1-6 as walking, walking upstairs, walking downstairs, sitting, standing and laying.  I had to apply labels to the activity_labels data set so I could later join it with y_data.  
[names(subject_total) <- c('Subject')
names(x_data) <- make.names(feature_labels$V2, unique=TRUE)
names(activity_labels) <- c('ActivityLabel', 'ActivityName')
names(y_data) <- c('ActivityLabel')]

###Apply activity names to y_data to use to label all observations with the corresponding activity labels and names respectively
This step joins the actvity_label and y_data set to apply the activity name to each observation, instead of using just the activity_label or code for each activity.  This makes it easier to understand what is happening with the dataset. I called this data frame y_labeled.
[y_labeled<- y_data %>% left_join(activity_labels)]

###Merge x,y, and subject data
In this step, I merged the x_data, the y_labeled, and subject_total.  The x_data are the observations, the y_labeled are essentially the row names and the subject_total also are row names describing which subject is performing which activity for each observation. I called the resulting data frame one_data_set.
[one_data_set <-bind_cols(subject_total, y_labeled, x_data)]

###Extract columns containing mean and standard deviation in the name. 
I selected everything from one_data_set except for those columns which had "mean" or std" in the name.
[select_data <- select(one_data_set, -matches("mean|std"))]

###Create a new summary data set from select_data
In this step I created a tidy data set from select_data which calculated the mean for each column, grouped by subject and activity name.  The resulting data frame, called summary_data, included 180 observations (to account for 30 subjects * 6 activities) of 478 variables.  
[summary_data <- select_data %>% group_by(Subject, ActivityName) %>% summarise_each(funs(mean))]


####The summary_data can be viewed here:
[https://drive.google.com/file/d/0B8dPWvrTMSCSMlJyVlBLY1lRaU0/view?usp=sharing](url)
