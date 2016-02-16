#DATA

x_train: training set (7352 obs. of 561 var.)

y_train: training labels (7351 obs. of 1 var.)

x_test: test set (2947 obs. of 561 var.)

y_test: test labels(2947 obs. of 1 var.)

subject_test: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. (2947 obs. of 1 variable)

subject_train: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. (7352 obs. of 1 variable)

feature_labels: List of all features (561 obs. of 2 variables)

activity_labels: List and corresponding codes of each activity (6 obs. of 2 variables)


x_data: merged training and test data observations (10,299 obs. of 561 variables)

subject_total: merged subject_test and subject_train (10,299 obs. of 1 var.)

y_data: merged training and test labels (10,299 obs. of 1 var.)


y_labeled: merged y_data with corresponding activity names by activity_labels (10,299 obs. of 2 var.)


one_data_set: merged x_data (for observations), y_data (for activities by rows), and subject_total(subject by rows) (10,299 obs. of 564 var.)

select_data: same as one_data_set, only without the observations of features (or columns) with "mean" or "std" in the name (10,299 obs. of 478 var.)

summary_data:  tidy data set with all the data from select_data, grouped by subject & activity, and summarized by mean for each variable. (180 obs. of 478 var.)

