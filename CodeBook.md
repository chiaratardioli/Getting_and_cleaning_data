The Code Book
======================================

It describes the variables, the data, and any transformations or work that I performed to clean up the data used by the R code `run_analysis.R`. 

## Raw data
Form the web link 

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

we download a folder named `UCI HAR Dataset`.

In the README file of this folder there is an explanation for the data source.
The experiments was carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person had performed six activities wearing a smartphone (Samsung Galaxy S II) on the waist.

Using its embedded accelerometer and gyroscope, they captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments was video-recorded to label the data manually. Then, the obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

### Activity
The activities are label as follows:

- 1 WALKING
- 2 WALKING_UPSTAIRS
- 3 WALKING_DOWNSTAIRS
- 4 SITTING
- 5 STANDING
- 6 LAYING 

### Features
The list of features is contained in the file `features.txt`:

```r
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("id","name")) # read features names
dim(features)
```

```
## [1] 561   2
```

```r
head(features)
```

```
##   id              name
## 1  1 tBodyAcc-mean()-X
## 2  2 tBodyAcc-mean()-Y
## 3  3 tBodyAcc-mean()-Z
## 4  4  tBodyAcc-std()-X
## 5  5  tBodyAcc-std()-Y
## 6  6  tBodyAcc-std()-Z
```

```r
tail(features,20)
```

```
##      id                                 name
## 542 542          fBodyBodyGyroJerkMag-mean()
## 543 543           fBodyBodyGyroJerkMag-std()
## 544 544           fBodyBodyGyroJerkMag-mad()
## 545 545           fBodyBodyGyroJerkMag-max()
## 546 546           fBodyBodyGyroJerkMag-min()
## 547 547           fBodyBodyGyroJerkMag-sma()
## 548 548        fBodyBodyGyroJerkMag-energy()
## 549 549           fBodyBodyGyroJerkMag-iqr()
## 550 550       fBodyBodyGyroJerkMag-entropy()
## 551 551         fBodyBodyGyroJerkMag-maxInds
## 552 552      fBodyBodyGyroJerkMag-meanFreq()
## 553 553      fBodyBodyGyroJerkMag-skewness()
## 554 554      fBodyBodyGyroJerkMag-kurtosis()
## 555 555          angle(tBodyAccMean,gravity)
## 556 556 angle(tBodyAccJerkMean),gravityMean)
## 557 557     angle(tBodyGyroMean,gravityMean)
## 558 558 angle(tBodyGyroJerkMean,gravityMean)
## 559 559                 angle(X,gravityMean)
## 560 560                 angle(Y,gravityMean)
## 561 561                 angle(Z,gravityMean)
```
where `t` at the beginning of the variable names stands for `time` and `f` for `frequency`.

The set of variables that were estimated from these signals are:

- mean(): Mean value
- std(): Standard deviation
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
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

All the information about the variables used on the feature vector are provided in the file `features_info.txt`of the downloaded folder.

### Measurements
The measurements, the activity labels and the identifier of the subject who carried out the experiment are contained in different files.

In `UCI HAR Dataset/train` folder we find information for the training data:
- `X_train.txt` contains the measurements.
- `y_train.txt` contains the activity labels (from 1 to 6).
- `subject_train.txt` contains the subject identifier (from 1 to 30).

In `UCI HAR Dataset/test` folder we find information for the test data:
- `X_test.txt` contains the measurements.
- `y_test.txt` contains the activity labels (from 1 to 6).
- `subject_test.txt` contains the subject identifier (from 1 to 30).

The training and test dataset can be read for example using R by:

```r
x_train <- read.table("UCI HAR Dataset/train/X_train.txt") # read training data
dim(x_train)
```

```
## [1] 7352  561
```

```r
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")    # read test data
dim(x_test)
```

```
## [1] 2947  561
```
and we notice that the number of columns of the each dataset is 561. So, for each features, the row number correspond to the column number in the measurement dataset.

## Processing data
No process has been made for this analysis.

