#Coursera Getting and Cleaning Data course Assignment

The script, run_analysis.R makes use of the “Human Activity Recognition Using Smartphones Dataset v1.0” available from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.  The data set contains the results of an experiment conducted by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, and Luca Onetoto to measure the body movements of 30 test subjects using a Samsung Galaxy S II smartphone.  The subjects performed 6 different activities:WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

The script requires that the data set be stored in a subdirectory from the working directory called ./data. When unpacked, the data will be in the following path: ~./data/UCI HAR dataset

The unpacked dataset has the following contents:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.


The script, run_analysis.R, merges together the test and training sets and then extracts only the measurements on the mean and standard deviation for each observation.

Up to now, the data set uses activity codes to identify which activities are being measured, e.g. 1 for walking, 4 for sitting.  The script replaces the numeric codes with the text activity descriptions.  It then renames the dataset’s column headers to make them more descriptive.

Finally, the script creates a new, independent, tidy data set with the average of each variable for each activity and each subject.  The final data set is written to a file in the working directory called ‘finalDataSet.txt’

The script makes use of the dplyr library to run the functions mutate, group by and summarise_each.

The names of the final data set’s 88 columns are given below. These were derived from the original data sets which is described more fully in ./data/UCI HAR data/features.txt.  The original test and train data sets contained 10299 combined observations across 30 subjects and 6 activities.  The final dataset takes the mean of all the mean and standard deviation measurements.  That is, for 30 subjects across 6 different activities, 180 observations containing the mean values for the  mean and standard deviation measurements are provided.

##column numbers and names of finalDataSet.txt

 [1] "subject"                              
 [2] "activityname"                         
 [3] "timebodyaccmeanx"                     
 [4] "timebodyaccmeany"                     
 [5] "timebodyaccmeanz"                     
 [6] "timebodyaccstdx"                      
 [7] "timebodyaccstdy"                      
 [8] "timebodyaccstdz"                      
 [9] "timegravityaccmeanx"                  
[10] "timegravityaccmeany"                  
[11] "timegravityaccmeanz"                  
[12] "timegravityaccstdx"                   
[13] "timegravityaccstdy"                   
[14] "timegravityaccstdz"                   
[15] "timebodyaccjerkmeanx"                 
[16] "timebodyaccjerkmeany"                 
[17] "timebodyaccjerkmeanz"                 
[18] "timebodyaccjerkstdx"                  
[19] "timebodyaccjerkstdy"                  
[20] "timebodyaccjerkstdz"                  
[21] "timebodygyromeanx"                    
[22] "timebodygyromeany"                    
[23] "timebodygyromeanz"                    
[24] "timebodygyrostdx"                     
[25] "timebodygyrostdy"                     
[26] "timebodygyrostdz"                     
[27] "timebodygyrojerkmeanx"                
[28] "timebodygyrojerkmeany"                
[29] "timebodygyrojerkmeanz"                
[30] "timebodygyrojerkstdx"                 
[31] "timebodygyrojerkstdy"                 
[32] "timebodygyrojerkstdz"                 
[33] "timebodyaccmagnitudemean"             
[34] "timebodyaccmagnitudestd"              
[35] "timegravityaccmagnitudemean"          
[36] "timegravityaccmagnitudestd"           
[37] "timebodyaccjerkmagnitudemean"         
[38] "timebodyaccjerkmagnitudestd"          
[39] "timebodygyromagnitudemean"            
[40] "timebodygyromagnitudestd"             
[41] "timebodygyrojerkmagnitudemean"        
[42] "timebodygyrojerkmagnitudestd"         
[43] "freqbodyaccmeanx"                     
[44] "freqbodyaccmeany"                     
[45] "freqbodyaccmeanz"                     
[46] "freqbodyaccstdx"                      
[47] "freqbodyaccstdy"                      
[48] "freqbodyaccstdz"                      
[49] "freqbodyaccmeanfreqx"                 
[50] "freqbodyaccmeanfreqy"                 
[51] "freqbodyaccmeanfreqz"                 
[52] "freqbodyaccjerkmeanx"                 
[53] "freqbodyaccjerkmeany"                 
[54] "freqbodyaccjerkmeanz"                 
[55] "freqbodyaccjerkstdx"                  
[56] "freqbodyaccjerkstdy"                  
[57] "freqbodyaccjerkstdz"                  
[58] "freqbodyaccjerkmeanfreqx"             
[59] "freqbodyaccjerkmeanfreqy"             
[60] "freqbodyaccjerkmeanfreqz"             
[61] "freqbodygyromeanx"                    
[62] "freqbodygyromeany"                    
[63] "freqbodygyromeanz"                    
[64] "freqbodygyrostdx"                     
[65] "freqbodygyrostdy"                     
[66] "freqbodygyrostdz"                     
[67] "freqbodygyromeanfreqx"                
[68] "freqbodygyromeanfreqy"                
[69] "freqbodygyromeanfreqz"                
[70] "freqbodyaccmagnitudemean"             
[71] "freqbodyaccmagnitudestd"              
[72] "freqbodyaccmagnitudemeanfreq"         
[73] "freqbodybodyaccjerkmagnitudemean"     
[74] "freqbodybodyaccjerkmagnitudestd"      
[75] "freqbodybodyaccjerkmagnitudemeanfreq" 
[76] "freqbodybodygyromagnitudemean"        
[77] "freqbodybodygyromagnitudestd"         
[78] "freqbodybodygyromagnitudemeanfreq"    
[79] "freqbodybodygyrojerkmagnitudemean"    
[80] "freqbodybodygyrojerkmagnitudestd"     
[81] "freqbodybodygyrojerkmagnitudemeanfreq"
[82] "angletbodyaccmeangravity"             
[83] "angletbodyaccjerkmeangravitymean"     
[84] "angletbodygyromeangravitymean"        
[85] "angletbodygyrojerkmeangravitymean"    
[86] "anglexgravitymean"                    
[87] "angleygravitymean"                    
[88] "anglezgravitymean"  
