# GettingAndCleaningDataProject
Repo for the final assignment for Coursera Getting and Cleaning Data course

#read column headers for test and training sets into a vector

#read in the training and test main data sets and pass in headers for the column names


#read in remaining data files for test data.  Give column headers!

#read in remaining data files for train data

#Merge the test data files into one dataframe using bind
#i.e. adding subject_test and y_test as new columns to X_test


#Do same thing for train data files

#Now merge the rows in mtrain with the rows in mtest using bind



#Now need to find which columns contain mean type data and standard deviation (std) type data.
# first get the column names of mergedData DF


#This gives the column numbers for mean and std columns
#we still need first two columns so add them to list of column numbers we want

#create new DF, meanstd, that has all the mean and std columns, along with subject and activity


#Uses descriptive activity names to name the activities in the data set

#load the activity code/names mapping file into DF called activity_lables.

#use sapply funtion to map actitivty names to activity codes
# e.g. activity_names <- sapply(meanstd[,2], function(x) activity_labels[x,2])

#But load dplyr package to map (mutate) the codes to the names

#Now rename 2nd column from activitycode to activityname

#Now lets go through the remaining coloumn names to make them more descriptive
#column names starting with 't' represent time domain signals.  Rename them to start with 'time'

#column names starting with 'f' represent frequency signals
#rename them to start with 'freq'

#column names with 'Mag' represent the magnitude of the three dimensional signals.
#rename these to have 'Magnitude'

#remove the '.'s from the column names

#make all column names lower case

#remove _ from column names


#And apply the new column names to the meanstd dataframe

#From the data set in step 4, creates a second, independent tidy data set 
#with the average of each variable for each activity and each subject.
# use dplyr group by to group meanstd by subject and activityname

#use dplyr::summarise_each to calculate the mean on all 'non grouped by' columns

#write the finalDataSet to a text file

