# Getting-Cleaning-Data-Course-Project
For getting and cleaning data course project

The script does the following

STEP 1: Read the 2 data files containing the test and training information

STEP 2: Read the features.txt file and extract the column names of the 561 features. Strip out special characters and numbers from the features field names

STEP 3: set the column names of the 2 data files 

STEP 4: identify all columns which contain mean and standard deviation values create a single list of these columns

STEP 5: Create a subset by selecting only the mean and std columns for both the test and training data files
STEP 6: Combine the test and training data in that order
STEP 7: Read the test and training subject data sets. Combine them into a single data frame and name the column
STEP 8: Set the names of the test and training activity data sets
STEP 9: Set the name of the dataset to hold the combined data 
STEP 10: Copy the test and training activity datasets into one dataframe. name the dataframe column
STEP 11: Add subjectId and activity as new columns to the combined dataset 
STEP 12: For each combination of subjectId/activity calculate the average for all the columns
STEP 13: Get the revised file with modified user friendly column names. Update the column names with the new modified column names
STEP 14: Get the activity labels
STEP 15: Add a new column to include the activity label
STEP 16: Drop activity column as actLabel will be sufficient for the tidy dataset
STEP 17: Reorder the columns to get the subjectId and actLabel in front. 
STEP 18: Write out the tidy dataset
