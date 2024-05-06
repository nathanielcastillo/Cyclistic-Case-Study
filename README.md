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

Total - 5719877 rows of data

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

### Deleting rows with NULL or blank values

``` MySQL
DELETE 
FROM 2023_ride_data
WHERE 
ride_id = '' OR ride_id IS NULL
OR
rideable_type = '' OR rideable_type IS NULL
OR
started_at = '' OR started_at IS NULL
OR
ended_at = '' OR ended_at IS NULL
OR
start_station_name = '' OR start_station_name IS NULL
OR
start_station_id = '' OR start_station_id IS NULL
OR
end_station_name = '' OR end_station_name IS NULL
OR
end_station_id = '' OR end_station_id IS NULL
OR
start_lat = '' OR start_lat IS NULL
OR
start_lng = '' OR start_lng IS NULL
OR
end_lat = '' OR end_lat  IS NULL
OR
end_lng = '' OR end_lng IS NULL
OR
member_casual = '' OR member_casual IS NULL
;
```

### Cleaning Station names
``` MySQL
UPDATE 2023_ride_data
SET 
    start_station_name = REPLACE(start_station_name, 'Public Rack - ', ''),
    start_station_name = REPLACE(start_station_name, ' (Temp)', ''),
    start_station_name = REPLACE(start_station_name, '*', ''),
    start_station_name = REPLACE(start_station_name, '/', ' & '),
	start_station_name = REPLACE(start_station_name, 'Buckingham - Fountain', 'Buckingham Fountain'),
    start_station_name = REPLACE(start_station_name, 'Senka "Edward Duke"" Park"', 'Senka "Edward Duke" Park'),
    
    end_station_name = REPLACE(end_station_name, 'Public Rack - ', ''),
    end_station_name = REPLACE(end_station_name, ' (Temp)', ''),
    end_station_name = REPLACE(end_station_name, '*', ''),
    end_station_name = REPLACE(end_station_name, '/', ' & '),
	end_station_name = REPLACE(end_station_name, 'Buckingham - Fountain', 'Buckingham Fountain'),
    end_station_name = REPLACE(end_station_name, 'Senka "Edward Duke"" Park"', 'Senka "Edward Duke" Park')
;
```
### Deleting rides with "Test" in Station names
``` MySQL
DELETE 
FROM 2023_ride_data
WHERE start_station_name LIKE "%Test%" OR end_station_name LIKE "%Test%"
;
```


### Setting Ride ID to 16 characters

``` MySQL
UPDATE 2023_ride_data
SET ride_id = LEFT(ride_id, 16);
```

### Trim all columns

``` MySQL
UPDATE 2023_ride_data
SET
ride_id = TRIM(ride_id),
rideable_type = TRIM(rideable_type),
started_at = TRIM(started_at),
ended_at = TRIM(ended_at),
start_station_name = TRIM(start_station_name),
start_station_id = TRIM(start_station_id),
end_station_name = TRIM(end_station_name),
end_station_id = TRIM(end_station_id),
start_lat = TRIM(start_lat),
start_lng = TRIM(start_lng),
end_lat = TRIM(end_lat),
end_lng = TRIM(end_lng),
member_casual = TRIM(member_casual)
;
```

### Drop start ids and end ids

``` MySQL
ALTER TABLE 2023_ride_data
DROP COLUMN start_station_id,
DROP COLUMN end_station_id
;
```

# Analyze
## Data Analysis SQL / Tableuau

# Share
## Data Visualization Tabeau

# Act
## Reccomendations


