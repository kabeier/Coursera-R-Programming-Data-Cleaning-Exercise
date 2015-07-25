#Codebook for Coursera R Programming Data Cleaning Exercise

###Working with the Human Activity Recognition Using Smartphones Data Set from UCI

####Data Collection & incorporation into R

This data was gathered from the UCI website:

>http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Details on the experiments and the data collection up to this point can be viewed at the URL above.

The data was combined using the test/train (the conditions) folders contents.  The *subject_(condition).txt* was used to create the id for the Subject and the *X_(condition).txt* was used to create the Data values, while the *y_(condition).txt* was used to label the Activity field.  

The data is then combined into of set of data (ignoring the test/train condition (which can be recovered in the script before the end of part 1-4 comment marker))

The activity markers are renamed using the *activity_labels.txt* 
 
All unmentioned files in the download have been ignored for this script.

The final data table is outputted from R (in current wd) as *project3.txt* using write.table().  This table represents the average means and average standard deviations across the both train and test trials(note: no subject numbers appear in both sets) of each Subject performing a given Activity


####The Data Variables:
**Note:** All data variable correlate to the data variable from the original data, except for the special characters are all replaced with ".", Also the Subject and Activity Columns variable names are new to this script.

**"Subject"**  This is an ID representing the Subject that participate in the event.  Includes both the Train and the Test groups (without distinguishing this in the final output)

**"Activity"**  This shows one of 6 activity labels that the Subject performed. 
WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

The following data labels are all written in this construct:

>t/f Body/Gravity Acc/Gyro blank/Jerk .mean/.sd ...X/Y/Z

**t/f* f says it was Fast Fourier Transform to receive the frequency domain, t is for regular time
**Body/gravity* a Butterworth low-pass filters (.3Hz)reading into body acceleration and gravity denoted here
**Acc/Gyro* from Accelerometer or Gyroscope
**blank/jerk* denotes whether it is a jerk signal or not.
**mean/sd* whether this is an estimated calculation of the mean or standard deviation
**X/Y/Z* the dimension of the reading


####Labels


**"tBodyAcc.mean...X"**
**"tBodyAcc.mean...Y"**
**"tBodyAcc.mean...Z"**

**"tGravityAcc.mean...X"**
**"tGravityAcc.mean...Y"**
**"tGravityAcc.mean...Z"**

**"tBodyAccJerk.mean...X"**
**"tBodyAccJerk.mean...Y"**
**"tBodyAccJerk.mean...Z"**

**"tBodyGyro.mean...X"**
**"tBodyGyro.mean...Y"**
**"tBodyGyro.mean...Z"**

**"tBodyGyroJerk.mean...X"**
**"tBodyGyroJerk.mean...Y"**
**"tBodyGyroJerk.mean...Z"**

**"tBodyAccMag.mean.."**
**"tGravityAccMag.mean.."**
**"tBodyAccJerkMag.mean.."**
**"tBodyGyroMag.mean.."**
**"tBodyGyroJerkMag.mean.."**

**"fBodyAcc.mean...X"**
**"fBodyAcc.mean...Y"**
**"fBodyAcc.mean...Z"**

**"fBodyAccJerk.mean...X"**
**"fBodyAccJerk.mean...Y"**
**"fBodyAccJerk.mean...Z"**

**"fBodyGyro.mean...X"**
**"fBodyGyro.mean...Y"**
**"fBodyGyro.mean...Z"**

**"fBodyAccMag.mean.."**
**"fBodyBodyAccJerkMag.mean.."**
**"fBodyBodyGyroMag.mean.."**
**"fBodyBodyGyroJerkMag.mean.."**

**"tBodyAcc.std...X"**
**"tBodyAcc.std...Y"**
**"tBodyAcc.std...Z"**

**"tGravityAcc.std...X"**
**"tGravityAcc.std...Y"**
**"tGravityAcc.std...Z"**

**"tBodyAccJerk.std...X"**
**"tBodyAccJerk.std...Y"**
**tBodyAccJerk.std...Z"**

**tBodyGyro.std...X"**
**tBodyGyro.std...Y"**
**tBodyGyro.std...Z"**

**tBodyGyroJerk.std...X"**
**tBodyGyroJerk.std...Y"**
**tBodyGyroJerk.std...Z"**

**tBodyAccMag.std.."**
**tGravityAccMag.std.."**
**tBodyAccJerkMag.std.."**
**tBodyGyroMag.std.."**
**tBodyGyroJerkMag.std.."**

**fBodyAcc.std...X"**
**fBodyAcc.std...Y"**
**fBodyAcc.std...Z"**

**fBodyAccJerk.std...X"**
**fBodyAccJerk.std...Y"**
**fBodyAccJerk.std...Z"**

**fBodyGyro.std...X"**
**fBodyGyro.std...Y"**
**fBodyGyro.std...Z"**

**fBodyAccMag.std.."**
**fBodyBodyAccJerkMag.std.."**
**fBodyBodyGyroMag.std.."**

