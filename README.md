# getting-and-cleaning-data-course-project
This is the final project of a Coursera program Getting and Cleaning data, which aims to provide a practice on how data can be collected, organized and cleaned to get ready for analysis.

`README.md` gives you a good start on how to understand this project and get use of it.

So, this project takes _"UCI HAR Dataset"_ as its source data, which you can access at the following link:
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

With a full description of the dataset available at: 
  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

By running the R script `run_analysis.R`, the following things happen:
1. the test and the training sets in the original _"UCI HAR Dataset"_ will be merged into one dataset. 
2. the measurements on the mean and standard deviation for each measurement will be extracted;
3. activity labels will be turned into their actual names so they are more readable;
4. for each subject and each activity that they take on, the average of each feature collected in point 2 will be calculated and recorded;
5. the result of the above processing will be saved in a text file `mean.txt`, and it is a tidy dataset that can be used for future analysis.

`Codebook.md` lists all the variables that appear in the result `mean.txt` and explains what they mean.

Note that:

The original _"UCI HAR Dataset"_ contains 2 sub-directories, _"test"_ and _"train"_. As the 2 sub-directories are symmetrical, we'll take the example of the _"test"_ file to break down on how we merge the data and why we need to do that. The _"test"_ file also has a sub-directory _"Inertial Signals"_, and 3 text files _"subject_test.txt"_, _"X_test.txt"_ and _"y_test.txt"_. Since we focus on the features, _"Inertial Signals"_ will be ignored. So, that leaves us with the 3 text files. _"subject_test.txt"_ contains information about which subject takes each test; _"X_test.txt"_ contains information about the result under each feature for each test; _"y_test.txt"_ tells about which activity it is in each test. Now, we want to match up all the information about each test so that we don't have to open 3 separate files to get the information we need. After that, we also want to merge the information from _"test"_ and _"train"_ together, so that we can gather the data from all the 30 subjects altogher. It's okay because the 30 subjects were randomly divided into 2 groups, which means there were **_no difference_** between them from the beginning.

**We define the measurement on the mean and standard deviation as any features containing the string "mean()" or "std()", which are _case sensitive_**. Details about features are clearly presented in _"features_info.txt"_ under _"UCI HAR Dataset"_. And as you may notice, some features measure weighted average of the frequency, marked as "meanFreq()", and some features use the average as its parameters, like "angle(X,gravityMean)", which all contain the "mean" of some sort. However, we exclude any of these measurements from our tidy dataset, as the idea behind them are different than a pure "mean", which is corresponding to standard deviation in statistics. We believe that mixing these measurement with "mean()" can possibily cause confusion to the future analysis, and thus limit the range of measurement on the mean strictly to the string "mean()" and measurement on the standard deviation strictly to the string "std()". After running the script, we'll know that 66 different features will be selected.

Details abut activities' real names can be found on _"activity_labels.txt"_ under _"UCI HAR Dataset"_. The reason that we want to do this is because otherwise a seperate file is needed to provide the meaning of each activity label, which is really time wasting.

From _"UCI HAR Dataset"_, we can conclude that there are 30 subjects in total, and 6 types of activities. Thus, when we group the data from point 3 by each subject and activity, we get 180 different groups in total. For each group, the mean of each feature will be calculated and marked down and this will be going for 66 rounds as there are 66 different features.
