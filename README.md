
# Human Activity Recognition Using Smartphones Data

by Balaji Iyengar in Jun, 2014

## Overview
-----------------------------------
Concept, Experiment & Data originators: 

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

-----------------------------------

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

## Data Transformation Process
The transformations applied to the raw data files include:

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


1. Extract mean & std features (79 cols) by inspecting for 'mean' or 'std' present in variable names
2. Merge Activity labels using Activity code (e.g. 'WALKING' for 1 .. 'LAYING' for 6)
3. Rename feature variables to delete/replace characters in "(-)" such that it may not cause programming errors when they are referenced in formulae/functions
4. Compute averages of all extracted features by subject (30) and activity (6) resulting in 180 aggregated observations  

See 'CodeBook.md' for more details. 
