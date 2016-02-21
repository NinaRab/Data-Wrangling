library(dplyr)
library(tidyr)

x_train <- read.table(paste0(dataFolder, "train/X_train.txt")
y_train <- read.table(paste0(dataFolder, "train/y_train.txt")
x_test <- read.table(paste0(dataFolder, "test/X_test.txt")
y_test <- read.table(paste0(dataFolder, "test/y_test.txt")
subject_test <- read.table(paste0(dataFolder, "test/subject_test.txt")
subject_train <- read.table(paste0(dataFolder, "train/subject_train.txt")
feature_labels <- read.table(paste0(dataFolder, "features.txt")
activity_labels <-read.table(paste0(dataFolder, "activity_labels.txt")

x_data <- bind_rows(x_train, x_test)
subject_total <- bind_rows(subject_train, subject_test)
y_data <- bind_rows(y_train, y_test)

names(subject_total) <- c('Subject')
names(x_data) <- make.names(feature_labels$V2, unique=TRUE)
names(activity_labels) <- c('ActivityLabel', 'ActivityName')
names(y_data) <- c('ActivityLabel')

y_labeled<- y_data %>% left_join(activity_labels)

one_data_set <-bind_cols(subject_total, y_labeled, x_data)

select_data <- select(one_data_set, -matches("mean|std")) 

summary_data <- select_data %>% group_by(Subject, ActivityName) %>% summarise_each(funs(mean))  
