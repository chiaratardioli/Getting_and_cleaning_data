---
title: "Getting and cleaning data: Peer Assessment 1"
output: 
  html_document:
    keep_md: true
---

## Download data for the project.
The data for the project have been collected from the accelerometers from the Samsung Galaxy S smartphone. They have been downloaded from the following weblink

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zips](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

## Understanding the data
The [code book](link here) describes the variables names and the data in each files.

## Analysis
The R code [Run analysis](link here) performes an analysis on the data collected on the activity measurements. The goal is to extracts only the variables related to the mean and standard deviation for each measurement and to create a tiny dataset containing the average of variable for each activity and each subject.

## File in this repository:
- `README.md`
- `CodeBook.md` and `CodeBook.Rmd`
- `run_analysis.R`