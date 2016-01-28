# Readme

This file is a readme for the assignment within the 'Getting and Cleaning Data' course from Coursera.

Other than this readme file, the project comprises two others:

1. CodeBook.md - a detailed description of the data sets being analysed and the transformation steps used to produce cleaned versions.
2. run_analysis.R - a script to take the input data sets described in the codebook and produce the two clean versions.

Within the run_analysis.R script, each step as described in the codebook is highlighted.

In order to produce the clean data, firstly download the source data from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> and then run the entire run_analysis.R script, ensuring that the working directory is set to the top level folder containing the data (i.e. the working directory should contain the 'train' and 'test' folders).

Two output tables will be produced:

1. all_data_mean_std - a cleaned version of the source test and training data comprising only columns relating to mean and standard deviation values.
2. all_data_mean_std_avg - a cleaned version of the source test and training data comprising average values for the mean and standard deviation values, grouped by subject and activity type.

Last updated: 28/01/2016