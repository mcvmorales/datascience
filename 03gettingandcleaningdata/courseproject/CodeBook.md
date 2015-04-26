Code Book for `run_analysis.R`
==============================
The goal of `run_analysis.R` is to demonstrate an ability to collect, work with, and clean a data set.

Description of the Data
-----------------------
From the README.md for the **Human Activity Recognition Using Smartphones Dataset (Version 1.0)  **

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (`WALKING`, `WALKING_UPSTAIRS`, `WALKING_DOWNSTAIRS`, `SITTING`, `STANDING`, `LAYING`) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

> For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Variables
---------
The script `run_analysis.R` writes `tidydata.txt`, which contains a data frame of 10299 observations and 68 variables. The variables are:
- `Subject`: a subject's ID number, between 1 and 30.
- `Activity`: One of the six activities listed above (`WALKING` ... `LAYING`)
- Various measurements (mean, standard deviation only; x-, y-, z-axis) with descriptive labels, i.e.: 
  - `timeBodyAccelerometer`
  - `timeGravityAccelerometer`
  - `timeBodyAccelerometerJerk`
  - `timeBodyGyroscope`
  - `timeBodyGyroscopeJerk`
  - `timeBodyAccelerometerMagnitude`
  - `timeGravityAccelerometerMagnitude`       
  - `timeBodyAccelerometerJerkMagnitude`
  - `timeBodyGyroscopeMagnitude`
  - `timeBodyGyroscopeJerkMagnitude`
  - `frequencyBodyAccelerometer`
  - `frequencyBodyAccelerometerJerk`
  - `frequencyBodyGyroscope`
  - `frequencyBodyAccelerometerMagnitude`
  - `frequencyBodyAccelerometerJerkMagnitude`
  - `frequencyBodyGyroscopeMagnitude`
  - `frequencyBodyGyroscopeJerkMagnitude`

Process
-------
1. Download, unzip, and load the multiple data files into the environment  
2. Merge the separate data into a tidy data set  
3. Set appropriate names for the variables and factors
4. Extract only measurements on the mean and standard deviation for each observation
5. Subset this data and write `tidydata.txt` for future analysis
