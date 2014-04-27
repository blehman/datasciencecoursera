#Explanation of process: run\_analysis.R
##test data
pull in normalized data

pull in activity types

label activities

pull in subjects

combine all test data into one dataset (cbind)

mark this set 
##train data
pull in normalized data

pull in activity types

label activities (uses predefined 'act\_type\_label')

pull in subjects

combine all training data into one dataset (cbind)

mark this set
##combine test and train
simple rbind

##create subset1 and reshape1
use grep and subsetting to extract data that contains mean or std 

save subset1 

use melt and dcast to find the average of each variable for each activity and each subject 

save reshape1

print reshape1
