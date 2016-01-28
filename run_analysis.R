#You should create one R script called run_analysis.R that does the following.

#Merges the training and the test sets to create one data set.
#Extracts only the measurements on the mean and standard deviation for each 
#measurement.
#Uses descriptive activity names to name the activities in the data set
#Appropriately label the data set with descriptive variable names.
#From the data set in step 4, creates a second, independent tidy data set 
#with the average of each variable for each activity and each subject.


#read column headers for test and training sets into a vector

features <- read.table('./data/UCI HAR Dataset/features.txt')
headers <- features$V2

#read in the training and test main data sets and pass in headers for the column names
X_train <- read.table('./data/UCI HAR Dataset/train/X_train.txt', col.names = headers)
X_test <- read.table('./data/UCI HAR Dataset/test/X_test.txt', col.names = headers)

#read in remaining data files for test data.  Give column headers!


subject_test <- read.table('./data/UCI HAR Dataset/test/subject_test.txt', col.names = c('subject'))
y_test <- read.table('./data/UCI HAR Dataset/test/y_test.txt', col.names = c('activitycode'))



#read in remaining data files for train data

subject_train <- read.table('./data/UCI HAR Dataset/train/subject_train.txt',col.names = c('subject'))
y_train <- read.table('./data/UCI HAR Dataset/train/y_train.txt',col.names = c('activitycode'))

traindf_list <- list(subject_train,y_train,X_train)
testdf_list <- list(subject_test, y_test, X_test)

#Merge the test data files into one dataframe
#i.e. adding subject_test and y_test as new columns to X_test
mtest <- cbind(subject_test,y_test, X_test)

#Do same thing for train data files
mtrain <- cbind(subject_train, y_train, X_train)

#Now merge the rows in mtrain with the rows in mtest

mergedData <- rbind(mtest, mtrain)

#Now need to find which columns contain mean type data and standard deviation (std) type data.
# first get the column names of mergedData DF
headers2 <- colnames(mergedData)

#first have a look at the in scope column names

grep('mean', headers2, ignore.case = TRUE, value=TRUE)
grep('std', headers2, ignore.case=TRUE, value=TRUE)
#This gives the column numbers for mean and std columns
inscope <- grep('(mean|std)', headers2, ignore.case=TRUE)
#we still need first two columns so add them to list of column numbers we want
inscope2 <- c(1,2,inscope)

#create new DF, meanstd, that has all the mean and std columns, along with subject and activity

meanstd <- mergedData[,inscope2]

#Uses descriptive activity names to name the activities in the data set

#load the activity code/names mapping file into DF called activity_lables.
activity_labels <- read.table('./data/UCI HAR Dataset/activity_labels.txt',stringsAsFactors=FALSE)

#use sapply funtion to map actitivty names to activity codes
# e.g. activity_names <- sapply(meanstd[,2], function(x) activity_labels[x,2])

#But load dplyr package to map (mutate) the codes to the names
library(dplyr)

meanstd <- mutate(meanstd, activitycode=sapply(meanstd[,2], function(x) activity_labels[x,2]))

#Now rename 2nd column from activitycode to activityname

headers3 <- colnames(meanstd)
headers3[2] <- "activityname"

#Now lets go through the remaining coloumn names to make them more descriptive
#column names starting with 't' represent time domain signals.  Rename them to start with 'time'
headers3 <- sub("^t", "time", headers3)
#column names starting with 'f' represent frequency signals
#rename them to start with 'freq'
headers3 <- sub("^f", "freq", headers3)
#column names with 'Mag' represent the magnitude of the three dimensional signals.
#rename these to have 'Magnitude'
headers3 <- sub("Mag", "Magnitude", headers3)
#remove the '.'s from the column names
headers3 <-gsub("\\.","", headers3)
#make all column names lower case
headers3 <- tolower(headers3)
#remove _ from column names
headers3 <- sub("_", "", headers3)

#And apply the new column names to the meanstd dataframe

colnames(meanstd) <- headers3

#From the data set in step 4, creates a second, independent tidy data set 
#with the average of each variable for each activity and each subject.
# use dplyr group by to group meanstd by subject and activityname
meanstd_groups <- group_by(meanstd, subject, activityname)
#use dplyr::summarise_each to calculate the mean on all 'non grouped by' columns
finalDataSet <- meanstd_groups %>% dplyr::summarise_each(funs(mean))

#write the finalDataSet to a text file

write.table(finalDataSet, file = "./data/finalDataSet.txt",row.name=FALSE)
