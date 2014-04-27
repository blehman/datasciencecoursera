#run\_analysis.R process:
##TEST DATA SET
pull in normalized data
pull in activity types
label activities
pull in subjects
combine all test data into one dataset
mark this set 
## TRAIN DATA SET
pull in normalized data
pull in activity types
label activities (uses predefined 'act\_type\_label')
pull in subjects
combine all training data into one dataset
label set
##COMBINE TEST AND TRAINING SET
subset1: extract data that contains mean or std
save subset1
average of each variable for each activity and each subject
