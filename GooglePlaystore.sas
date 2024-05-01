/* Importing the CSV file */
PROC IMPORT DATAFILE='path_to_your_file/googleplaystore.csv'
            OUT=apps
            DBMS=CSV REPLACE;
RUN;

/* Creating a copy of the dataset */
DATA df;
    SET apps;
RUN;

/* Displaying the first few rows of the dataset */
PROC PRINT DATA=df(OBS=5);
RUN;

/* Displaying the column names */
PROC CONTENTS DATA=df;
RUN;

/* Displaying the number of rows and columns */
PROC CONTENTS DATA=df NOPRINT;
    TITLE 'Number of Rows and Columns';
RUN;

/* Displaying detailed information about the dataset */
PROC CONTENTS DATA=df;
RUN;

/* Displaying descriptive statistics for numerical columns */
PROC MEANS DATA=df;
    VAR _NUMERIC_;
RUN;

/* Checking for missing values in each column */
PROC FREQ DATA=df;
    TABLES _MISSING_ / NOPRINT OUT=missing_counts(KEEP=TableVar Count);
RUN;

/* Sorting missing value counts in descending order */
PROC SORT DATA=missing_counts;
    BY descending Count;
RUN;

/* Displaying the counts of missing values in each column */
PROC PRINT DATA=missing_counts;
    TITLE 'Count of Missing Values in Each Column';
RUN;

/* Computing summary statistics for the 'Rating' column */
PROC UNIVARIATE DATA=df;
    VAR Rating;
    OUTPUT OUT=rating_stats
           MEAN=Mean
           STD=Std
           MIN=Min
           P25=P25
           MEDIAN=Median
           P75=P75
           MAX=Max;
RUN;

/* Printing the statistical summary */
PROC PRINT DATA=rating_stats;
    TITLE 'Statistical Summary for Rating Column';
RUN;





