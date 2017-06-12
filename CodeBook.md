After analyzing the data it was clear that there were separate datasets for recording the transaction data
* data with readings -  one for test and one for training
* subject - people/equipment which contributed the data
* activity - what action they were doing 

In addition there were 2 reference datasets
* features columns describing the values
* activity desription

After analysing the data the following was evident:
* data values file had 561 columns of values with 2947 test and 7352 training observations.
* The features file had 561 column names.

After identifying the columns with Mean and Standard Deviation values, they were extracted out separately.

This subset of data was grouped by subject & activity and averages of all data columns was calculated.

A separate file with better user friendly column names were created for the data.

Activity id was replaced with activity description.

Finally the order of the columns were set to have the subject & activity label in front followed by 
all remaining data columns which contained the averages.
