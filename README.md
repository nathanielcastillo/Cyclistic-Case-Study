# Cyclistic-Case-Study


# Introduction

Cyclistic is a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships.
Therefore, your team wants to understand how casual riders and annual memebers use Cyclistic bikes differently.
From these insights, your team will design a new maketing strategy to convert casual riders into annual members.
But first, Cyclistic excutives must approve your recommendations, so they must be backed up with compelling data insights and professional data visualizations.

# Ask
### Main Business Task

* Analyze how members and casual riders use Cyclistic bikes differently. 

* Provide reccomendations to convert casual riders into annual members based on the findings.

### Stakeholders

* Lily Moreno: Director of marketing 

* Cyclistic Executive Team: Will decide whether to appove the reccomended marketing program

* Cyclistc Marketing Analytics Team: Team of data analysts reposonsible for guiding Cyclistic marketing strategey

# Prepare
### Data Source

Data is downloaded from [
](https://divvy-tripdata.s3.amazonaws.com/index.html)

Trip data is organized into 1 CSV file per month for a total of 12 CSVs for the year 2023

Data deemed as credible and passes ROCCC method

- [x] Reliable - High Sample Size, over 5 million rows of data    
- [x] Original - Public Dataset provided by Motivate International Inc. 
- [x] Comprehensive - 5 million rows with 13 columns of relevant data
- [x] Current - Data is from 2023
- [x] Cited - Motivate International Inc.

Note that data-privacy issues prevent access from rider's personally identifiable information.
Only individual ride information is collected, information about the riders themselves is not.
Therefore, unable to determine things like if casual riders live within Cyclistic service areas or if they purchased multiple single passes.

Data needs to be cleaned before further analysis due to data quality issues such as null values.

The 12 CSVs of data will be used

202301-divvy-tripdata.csv - 190301 rows of data  
202302-divvy-tripdata.csv - 190445 rows of data   
202303-divvy-tripdata.csv - 258678 rows of data  
202304-divvy-tripdata.csv - 426590 rows of data  
202305-divvy-tripdata.csv - 604827 rows of data  
202306-divvy-tripdata.csv - 719618 rows of data  
202307-divvy-tripdata.csv - 767650 rows of data  
202308-divvy-tripdata.csv - 771693 rows of data  
202309-divvy-tripdata.csv - 666371 rows of data  
202310-divvy-tripdata.csv - 537113 rows of data  
202311-divvy-tripdata.csv - 362518 rows of data  
202312-divvy-tripdata.csv - 224073 rows of data  


# Process
### Data Cleaning SQL

Data cleaning will be done in MySQL as there are a total of over 5 million rows of data that need to be cleaned  
which is too much for Microsoft Excel to process efficiently

### Creating Master Table to hold data

``` MySQL
DROP TABLE IF EXISTS 2023_ride_data;
CREATE TABLE 2023_ride_data
(
  ride_id VARCHAR(255),
  rideable_type VARCHAR(255),
  started_at VARCHAR(255),
  ended_at VARCHAR(255),
  start_station_name VARCHAR(255),
  start_station_id VARCHAR(255),
  end_station_name VARCHAR(255),
  end_station_id VARCHAR(255),
  start_lat VARCHAR(255),
  start_lng VARCHAR(255),
  end_lat VARCHAR(255),
  end_lng VARCHAR(255),
  member_casual VARCHAR(255)
)
;
```

### Load data into 2023_ride_data
LOAD DATA INFILE is used for performance

``` MySQL

LOAD DATA INFILE '/Users/MySQL Import_Export/Trip Data Formatted/202301-divvy-tripdata.csv'
INTO TABLE 2023_ride_data
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS; -- Skip the header row if present
;
LOAD DATA INFILE '/Users/MySQL Import_Export/Trip Data Formatted/202302-divvy-tripdata.csv'
INTO TABLE 2023_ride_data
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS; -- Skip the header row if present
;
LOAD DATA INFILE '/Users/MySQL Import_Export/Trip Data Formatted/202303-divvy-tripdata.csv'
INTO TABLE 2023_ride_data
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS; -- Skip the header row if present
;
LOAD DATA INFILE '/Users/MySQL Import_Export/Trip Data Formatted/202304-divvy-tripdata.csv'
INTO TABLE 2023_ride_data
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS; -- Skip the header row if present
;
LOAD DATA INFILE '/Users/MySQL Import_Export/Trip Data Formatted/202305-divvy-tripdata.csv'
INTO TABLE 2023_ride_data
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS; -- Skip the header row if present
;
LOAD DATA INFILE '/Users/MySQL Import_Export/Trip Data Formatted/202306-divvy-tripdata.csv'
INTO TABLE 2023_ride_data
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS; -- Skip the header row if present
;
LOAD DATA INFILE '/Users/MySQL Import_Export/Trip Data Formatted/202307-divvy-tripdata.csv'
INTO TABLE 2023_ride_data
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS; -- Skip the header row if present
;
LOAD DATA INFILE '/Users/MySQL Import_Export/Trip Data Formatted/202308-divvy-tripdata.csv'
INTO TABLE 2023_ride_data
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS; -- Skip the header row if present
;
LOAD DATA INFILE '/Users/MySQL Import_Export/Trip Data Formatted/202309-divvy-tripdata.csv'
INTO TABLE 2023_ride_data
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS; -- Skip the header row if present
;
LOAD DATA INFILE '/Users/MySQL Import_Export/Trip Data Formatted/202310-divvy-tripdata.csv'
INTO TABLE 2023_ride_data
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS; -- Skip the header row if present
;
LOAD DATA INFILE '/Users/MySQL Import_Export/Trip Data Formatted/202311-divvy-tripdata.csv'
INTO TABLE 2023_ride_data
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS; -- Skip the header row if present
;
LOAD DATA INFILE '/Users/MySQL Import_Export/Trip Data Formatted/202312-divvy-tripdata.csv'
INTO TABLE 2023_ride_data
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS; -- Skip the header row if present
;
```

# Analyze
## Data Analysis SQL / Tableuau

# Share
## Data Visualization Tabeau

# Act
## Reccomendations


