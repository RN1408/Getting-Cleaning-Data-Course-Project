
## Read the 2 data files containing the test and training information

filef <- read.table("D:/Coursera/UCI HAR Dataset/test/X_test.txt", header=FALSE, sep = "", stringsAsFactors = FALSE)
filef2 <- read.table("D:/Coursera/UCI HAR Dataset/train/X_train.txt", header=FALSE, sep = "", stringsAsFactors = FALSE)

## read the features.txt file and extract the column names of the 561 features
## strip out special characters and numbers from the features field names

feat <- read.csv("D:/Coursera/UCI HAR Dataset/features.txt", header = FALSE, sep=" ")
featCols <- gsub("[^a-z A-Z]", "", feat$V2)
featCols <- paste(featCols, c(1:561), sep = "")

## set the column names of the 2 data files 
names(filef) <- featCols
names(filef2) <- featCols

## identify all columns which contain mean and standard deviation values
## create a single list of these columns
meanCols <- grep("[Mm]ean", names(filef))
stdCols <- grep("[Ss]td", names(filef))
combinedCols <- c(stdCols,meanCols)

## create a subset by selecting only the mean and std columns for both the test and training 
## data files
filefSel <- select(filef, combinedCols)
filef2Sel <- select(filef2, combinedCols)

## combine the test and training data in that order
combinedFile <- merge(filefSel,filef2Sel, all= TRUE)

## read the test and training subject data sets
## combine them into a single data frame and name the column
subjTest <- read.table("D:/Coursera/UCI HAR Dataset/test/subject.txt", header=FALSE)
subjTrain <- read.table("D:/Coursera/UCI HAR Dataset/train/subject_train.txt", header=FALSE)
subjAll <- merge(subjTest, subjTrain, all = TRUE)
names(subjAll) <- c("subjectId")

## set the names of the test and training activity data sets
actTestF <- "D:/Coursera/UCI HAR Dataset/test/y_test.txt"
actTrainF <- "D:/Coursera/UCI HAR Dataset/train/y_train.txt"

## set the name of the dataset to hold the combined data 
actAllF <- "D:/Coursera/UCI HAR Dataset/actAllF.txt"

## copy the test and training activity datasets into one dataframe
## name the dataframe column
file.copy(actTestF,actAllF)
file.append(actAllF, actTrainF)
actAll <- read.table(actAllF, header=FALSE)
names(actAll) <- c("activity")

## add subjectId and activity as new columns to the combined dataset 
combinedFile$subjectId = unlist(subjAll)
combinedFile$activity = unlist(actAll)

## For each combination of subjectId/activity calculate the average for all the columns
## k is the counter for building the new dataframe xAns with calculated averages
k <- 0
xAns <- combinedFile[0,]

for (i in 1:6) {
	for(j in 1:30){ 
		k <- k+1
		xAns[k,] <- colMeans(filter(combinedFile, combinedFile$activity==i & combinedFile$subjectId==j))
	}
}

## get the revised file with modified user friendly column names 
## update the column names with the new modified column names
featuresNew <- read.csv("featuresNew.csv",header = FALSE)
names(xAns) <- make.names(featuresNew$V1)

## get the activity labels
actLabels <- read.csv("D:/Coursera/UCI HAR Dataset/activity_labels.txt", header = FALSE, sep=" ")

## add a new column to include the activity label
xAns$actLabel <- actLabels$V2[xAns$activity[]]

## drop activity column as actLabel will be sufficient for the tidy dataset
xAns$activity <- NULL

## reorder the columns to get the subjectId and actLabel in front
## write out the tidy dataset
xAns2 <- xAns[,c(87,88,1:86)]
write.csv(xAns2, "TidyDataset.csv")