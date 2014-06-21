# Codebook for Human Activity Recognition Using Smartphones Data

by Balaji Iyengar in Jun, 2014

## Introduction

Please refer to README.md for overview of this data and exercise

## Dataset

UCIHAR_tidy.txt contains means of key metrics collected from the experiment. The file contains a header with variable names and data separated by space(s). The data is an aggregate (summary) of measurements recorded for 30 subjects who conducted 6 different activities (exercises). For the rest of the documentation, the unaggregated data is referred as 'Subject-Activity-Instance-Metrics' 

## Subject-Activity-Instance-Metrics Detail

Each record in this dataset contains metrics for each instance of activity conducted by a subject.

Variables include:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

______

Features (activity metrics) are derived from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency

Other estimates from the original datasets that were excluded for this exercise:

- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample that are also excluded for this exercise. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

Features (activity metrics) are normalized and bounded within [-1,1].

## Consolidated Subject-Activity-Instance-Metrics Detail

The total number of observations (by subject, activity, instance) is 10,299.
The total number of variables is 563.

### Data Transformation Process

1. Training (7,352 obs) dataset derived from binding columns (563) from:

	1.1. Subject (1 col):	'./train/subject_train.txt'
	
	1.2. Activity (1 col):	'./train/y_train.txt'
	
	1.3. Features (561 cols): './train/X_train.txt'    

2. Test (2,947 obs) dataset derived from binding columns (563) from:

	1.1. Subject (1 col):	'./test/subject_test.txt'
	
	1.2. Activity (1 col):	'./train/y_test.txt'
	
	1.3. Features (561 cols): './train/X_test.txt'
	
3. Concatenate Training & Test datasets (7,352 + 2,947 = 10,299 obs) x (563 cols)
4. Feature names were derived from 'features.txt'. Some feature names were duplicated, so unique variable names were derived by appending the variable position (& then cleaned up)	    

## Summary of Subject-Activity-Instance-Metrics (UCIHAR_tidy.txt) Detail

This file contains means by subject (30) for each activity (6) for a total of 180 (30 x 6) observations

Variables (81) include:

- Subject:				Coded as 1-30 (integer)
- Activity:				Coded as "LAYING", "SITTING", "STANDING", "WALKING", "WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS" (derived from 'activity.txt')

- tBodyAcc (6 vars):	subject-activity mean of t(time)BodyAcc(body acceleration) 
	- tBodyAcc.mean.X	: instance mean for X dim (float) 
 	- tBodyAcc.mean.Y
 	- tBodyAcc.mean.Z
	- tBodyAcc.std.X	: instance std for X dim (float) 
 	- tBodyAcc.std.Y
 	- tBodyAcc.std.Z

- fBodyAcc (9 vars):	subject-activity mean of f(FFT)BodyAcc(body acceleration) 
	- fBodyAcc.mean.X	: instance mean for X dim (float) 
 	- fBodyAcc.mean.Y
 	- fBodyAcc.mean.Z
	- fBodyAcc.std.X	: instance std for X dim (float) 
 	- fBodyAcc.std.Y
 	- fBodyAcc.std.Z
	- fBodyAcc.meanFreq.X	: instance meanFreq for X dim (float) 
 	- fBodyAcc.meanFreq.Y
 	- fBodyAcc.meanFreq.Z

- tBodyAccMag (2 vars):	subject-activity mean of t(time)BodyAcc(body acceleration)Mag(magnitude of Euclidean distance across XYZ dims) 
	- tBodyAccMag.mean	: instance mean (float) 
	- tBodyAccMag.std	: instance std (float) 

- fBodyAccMag (3 vars):	subject-activity mean of f(FFT)BodyAcc(body acceleration)Mag(magnitude of Euclidean distance across XYZ dims) 
	- fBodyAccMag.mean	: instance mean (float) 
	- fBodyAccMag.std	: instance std (float) 
	- fBodyAccMag.meanFreq	: instance meanFreq (float) 

- tBodyAccJerk (6 vars):	subject-activity mean of t(time)BodyAcc(body acceleration)Jerk 
	- tBodyAccJerk.mean.X	: instance mean for X dim (float) 
 	- tBodyAccJerk.mean.Y
 	- tBodyAccJerk.mean.Z
	- tBodyAccJerk.std.X	: instance std for X dim (float) 
 	- tBodyAccJerk.std.Y
 	- tBodyAccJerk.std.Z

- fBodyAccJerk (9 vars):	subject-activity mean of f(FFT)BodyAcc(body acceleration)Jerk 
	- fBodyAccJerk.mean.X	: instance mean for X dim (float) 
 	- fBodyAccJerk.mean.Y
 	- fBodyAccJerk.mean.Z
	- fBodyAccJerk.std.X	: instance std for X dim (float) 
 	- fBodyAccJerk.std.Y
 	- fBodyAccJerk.std.Z
	- fBodyAccJerk.meanFreq.X	: instance meanFreq for X dim (float) 
 	- fBodyAccJerk.meanFreq.Y
 	- fBodyAccJerk.meanFreq.Z

- tBodyAccJerkMag (2 vars):	subject-activity mean of t(time)BodyAcc(body acceleration)JerkMag(magnitude of Euclidean distance across XYZ dims) 
	- tBodyAccJerkMag.mean	: instance mean (float) 
	- tBodyAccJerkMag.std	: instance std (float) 

- fBodyBodyAccJerkMag (3 vars):	subject-activity mean of f(FFT)Body(should not be here-mistake in original downloaded data file ?)BodyAcc(body acceleration)JerkMag(magnitude of Euclidean distance across XYZ dims) 
	- fBodyBodyAccJerkMag.mean	: instance mean (float) 
	- fBodyBodyAccJerkMag.std	: instance std (float) 
	- fBodyBodyAccJerkMag.meanFreq	: instance meanFreq (float) 

- tBodyGyro (6 vars):	subject-activity mean of t(time)BodyGyro(body motion) 
	- tBodyGyro.mean.X	: instance mean for X dim (float) 
 	- tBodyGyro.mean.Y
 	- tBodyGyro.mean.Z
	- tBodyGyro.std.X	: instance std for X dim (float) 
 	- tBodyGyro.std.Y
 	- tBodyGyro.std.Z

- fBodyGyro (9 vars):	subject-activity mean of f(FFT)BodyGyro(body motion) 
	- tBodyGyro.mean.X	: instance mean for X dim (float) 
 	- tBodyGyro.mean.Y
 	- tBodyGyro.mean.Z
	- tBodyGyro.std.X	: instance std for X dim (float) 
 	- tBodyGyro.std.Y
 	- tBodyGyro.std.Z
	- tBodyGyro.meanFreq.X	: instance meanFreq for X dim (float) 
 	- tBodyGyro.meanFreq.Y
 	- tBodyGyro.meanFreq.Z

- tBodyGyroMag (2 vars):	subject-activity mean of t(time)BodyGyro(body motion)Mag(magnitude of Euclidean distance across XYZ dims) 
	- tBodyGyroMag.mean	: instance mean (float) 
	- tBodyGyroMag.std	: instance std (float) 

- fBodyBodyGyroMag (3 vars):	subject-activity mean of f(FFT)Body(should not be here-mistake in original downloaded data file ?)BodyGyro(body motion)Mag(magnitude of Euclidean distance across XYZ dims) 
	- fBodyBodyGyroMag.mean	: instance mean (float) 
	- fBodyBodyGyroMag.std	: instance std (float) 
	- fBodyBodyGyroMag.meanFreq	: instance meanFreq (float) 

- tBodyGyroJerk (6 vars):	subject-activity mean of t(time)BodyGyro(body motion)Jerk 
	- tBodyGyroJerk.mean.X	: instance mean for X dim (float) 
 	- tBodyGyroJerk.mean.Y
 	- tBodyGyroJerk.mean.Z
	- tBodyGyroJerk.std.X	: instance std for X dim (float) 
 	- tBodyGyroJerk.std.Y
 	- tBodyGyroJerk.std.Z

- tBodyGyroJerkMag (2 vars):	subject-activity mean of t(time)BodyGyro(body motion)JerkMag(magnitude of Euclidean distance across XYZ dims) 
	- tBodyGyroJerkMag.mean	: instance mean (float) 
	- tBodyGyroJerkMag.std	: instance std (float) 
 	
- fBodyBodyGyroJerkMag (3 vars):	subject-activity mean of f(FFT)Body(should not be here-mistake in original downloaded data file ?)BodyGyro(body motion)JerkMag(magnitude of Euclidean distance across XYZ dims) 
	- fBodyBodyGyroJerkMag.mean	: instance mean (float) 
	- fBodyBodyGyroJerkMag.std	: instance std (float) 
 	
- tGravityAcc (6 vars):	subject-activity mean of t(time)GravityAcc(gravity acceleration) 
	- tGravityAcc.mean.X	: instance mean for X dim (float) 
 	- tGravityAcc.mean.Y
 	- tGravityAcc.mean.Z
	- tGravityAcc.std.X	: instance std for X dim (float) 
 	- tGravityAcc.std.Y
 	- tGravityAcc.std.Z
- tGravityAccMag (2 vars):	subject-activity mean of t(time)GravityAcc(gravity acceleration)Mag(magnitude of Euclidean distance across XYZ dims) 
	- tGravityAccMag.mean	: instance mean (float) 
	- tGravityAccMag.std	: instance std (float) 

### Data Transformation Process

The transformations applied to the Consolidated Subject-Activity-Instance-Metrics dataset include:

1. Extract mean & std features (79 cols) by inspecting for 'mean' or 'std' present in variable names
2. Merge Activity labels using Activity code (e.g. 'WALKING' for 1 .. 'LAYING' for 6)
3. Rename feature variables to delete/replace characters in "(-)" such that it may not cause programming errors when they are referenced in formulae/functions
4. Compute averages of all extracted features by subject (30) and activity (6)   