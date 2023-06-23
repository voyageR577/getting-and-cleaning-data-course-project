**PART 1 ID variables**

- `subject_id`: the identifier of each subject. Values: integer 1-30

- `activity`: the activity that the subject performs. Values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

**PART 2 measurement variables**

features containing:

- `tBodyAcc-mean()-X`
- `tBodyAcc-mean()-Y`
- `tBodyAcc-mean()-Z`
- `tBodyAcc-std()-X`
- `tBodyAcc-std()-Y`
- `tBodyAcc-std()-Z`
- `tGravityAcc-mean()-X`
- `tGravityAcc-mean()-Y`
- `tGravityAcc-mean()-Z`
- `tGravityAcc-std()-X`
- `tGravityAcc-std()-Y`
- `tGravityAcc-std()-Z`
- `tBodyAccJerk-mean()-X`
- `tBodyAccJerk-mean()-Y`
- `tBodyAccJerk-mean()-Z`
- `tBodyAccJerk-std()-X`
- `tBodyAccJerk-std()-Y`
- `tBodyAccJerk-std()-Z`
- `tBodyGyro-mean()-X`
- `tBodyGyro-mean()-Y`
- `tBodyGyro-mean()-Z`
- `tBodyGyro-std()-X`
- `tBodyGyro-std()-Y`
- `tBodyGyro-std()-Z`
- `tBodyGyroJerk-mean()-X`
- `tBodyGyroJerk-mean()-Y`
- `tBodyGyroJerk-mean()-Z`
- `tBodyGyroJerk-std()-X`
- `tBodyGyroJerk-std()-Y`
- `tBodyGyroJerk-std()-Z`
- `tBodyAccMag-mean()`
- `tBodyAccMag-std()`
- `tGravityAccMag-mean()`
- `tGravityAccMag-std()`
- `tBodyAccJerkMag-mean()`
- `tBodyAccJerkMag-std()`
- `tBodyGyroMag-mean()`
- `tBodyGyroMag-std()`
- `tBodyGyroJerkMag-mean()`
- `tBodyGyroJerkMag-std()`
- `fBodyAcc-mean()-X`
- `fBodyAcc-mean()-Y`
- `fBodyAcc-mean()-Z`
- `fBodyAcc-std()-X`
- `fBodyAcc-std()-Y`
- `fBodyAcc-std()-Z`
- `fBodyAccJerk-mean()-X`
- `fBodyAccJerk-mean()-Y`
- `fBodyAccJerk-mean()-Z`
- `fBodyAccJerk-std()-X`
- `fBodyAccJerk-std()-Y`
- `fBodyAccJerk-std()-Z`
- `fBodyGyro-mean()-X`
- `fBodyGyro-mean()-Y`
- `fBodyGyro-mean()-Z`
- `fBodyGyro-std()-X`
- `fBodyGyro-std()-Y`
- `fBodyGyro-std()-Z`
- `fBodyAccMag-mean()`
- `fBodyAccMag-std()`
- `fBodyAccJerkMag-mean()`
- `fBodyAccJerkMag-std()`
- `fBodyGyroMag-mean()`
- `fBodyGyroMag-std()`
- `fBodyGyroJerkMag-mean()`
- `fBodyGyroJerkMag-std()`

Features are normalized and bounded within [-1,1].

Abbreviations intepretation

- t: time domain signals
- f: frequency domain signals
- XYZ: 3-axial signals in the X, Y and Z directions
- Acc: signals recorded by accelerometer
- Gyro: signals recorded by gyroscope
- Body: signals coming from body
- Gravity: signals coming from gravity
- Jerk: Jerk signals
- Mag: the magnitude of signals calculated using the Euclidean norm

- mean(): Mean value
- std(): Standard deviation
