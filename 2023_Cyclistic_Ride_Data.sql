## 2023_Cyclistic_Ride_Data by Nathaniel Castillo

## Creating Master Table to Load Data

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

## Alternative method that runs slower
## Creating Master Table from Union

# DROP TABLE IF EXISTS 2023_ride_data;

# CREATE TABLE 2023_ride_data AS
# SELECT *
# FROM 202301_divvy_tripdata
# UNION
# SELECT *
# FROM 202302_divvy_tripdata
# UNION
# SELECT *
# FROM 202303_divvy_tripdata
# UNION
# SELECT *
# FROM 202304_divvy_tripdata
# UNION
# SELECT *
# FROM 202305_divvy_tripdata
# UNION
# SELECT *
# FROM 202306_divvy_tripdata
# UNION
# SELECT *
# FROM 202307_divvy_tripdata
# UNION
# SELECT *
# FROM 202308_divvy_tripdata
# UNION
# SELECT *
# FROM 202309_divvy_tripdata
# UNION
# SELECT *
# FROM 202310_divvy_tripdata
# UNION
# SELECT *
# FROM 202311_divvy_tripdata
# UNION
# SELECT *
# FROM 202312_divvy_tripdata
# ;

## Loading Data into Master Table

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

## Deleting rows with NULL or blank values

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

## Cleaning Station Names

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

# Deleting rides with "Test" in Station names

DELETE 
FROM 2023_ride_data
WHERE start_station_name LIKE "%Test%" OR end_station_name LIKE "%Test%"
;

## Setting Ride ID to 16 characters

UPDATE 2023_ride_data
SET ride_id = LEFT(ride_id, 16);

## Trimming all columns

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

## Dropping start_station_id and end_station_id columns

ALTER TABLE 2023_ride_data
DROP COLUMN start_station_id,
DROP COLUMN end_station_id
;

## Creating Temporary Table with Window function to add row number to duplicates

SELECT 
            ride_id, rideable_type, started_at, ended_at, start_station_name, end_station_name, start_lat, start_lng, end_lat, end_lng, member_casual,
            ROW_NUMBER() OVER (PARTITION BY ride_id, rideable_type, started_at, ended_at, start_station_name, end_station_name ORDER BY member_casual DESC) AS row_num
FROM 2023_ride_data
ORDER BY ride_id
;

DROP TABLE IF EXISTS member_row;
CREATE TEMPORARY TABLE member_row
SELECT 
            ride_id, rideable_type, started_at, ended_at, start_station_name, end_station_name, start_lat, start_lng, end_lat, end_lng, member_casual,
            ROW_NUMBER() OVER (PARTITION BY ride_id, rideable_type, started_at, ended_at, start_station_name, end_station_name ORDER BY member_casual DESC) AS row_num
FROM 2023_ride_data
ORDER BY ride_id
;

## "Deleting" duplicates prioritzing member rides

TRUNCATE TABLE 2023_ride_data; 
-- ALTER TABLE 2023_ride_data
-- ADD row_num VARCHAR(50);
INSERT INTO 2023_ride_data  
SELECT ride_id, rideable_type, started_at, ended_at, start_station_name, end_station_name, start_lat, start_lng, end_lat, end_lng, member_casual
FROM member_row
WHERE row_num = 1
ORDER BY ride_id
;

## Deleting rides with trip durations over 1 day or under negative ride duration

DELETE
FROM 2023_ride_data
WHERE TIMESTAMPDIFF (YEAR, started_at, ended_at) > 0
OR TIMESTAMPDIFF (MONTH, started_at, ended_at) > 0
OR TIMESTAMPDIFF (DAY, started_at, ended_at) > 0
OR TIMESTAMPDIFF (MINUTE, started_at, ended_at) < 0
;

## Deleting rides with same start and end station and ride_durations under 1 minute 

DELETE
FROM 2023_ride_data
WHERE start_station_name = end_station_name AND TIMESTAMPDIFF (MINUTE, started_at, ended_at) < 1
ORDER BY ride_id
;

## Column Additions for analysis

## Adding column route

ALTER TABLE 2023_ride_data
ADD COLUMN ride_route VARCHAR(255) AS (CONCAT(start_station_name, ' - ', end_station_name))
;

## Adding column trip duration

ALTER TABLE 2023_ride_data
ADD COLUMN ride_duration_min INT AS (TIMESTAMPDIFF(MINUTE, started_at, ended_at))
;

## Exporting Output File

SELECT 'ride_id', 'rideable_type', 'started_at', 'ended_at', 'start_station_name', 'end_station_name', 'start_lat', 'start_lng', 'end_lat', 'end_lng', 'member_casual', 'ride_route', 'ride_duration_min'
UNION ALL
SELECT 'ride_id', 'rideable_type', 'started_at', 'ended_at', 'start_station_name', 'end_station_name', 'start_lat', 'start_lng', 'end_lat', 'end_lng', 'member_casual', 'ride_route', 'ride_duration_min'
INTO OUTFILE '/Users/MySQL Import_Export/2023_ride_data_export.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
FROM 2023_ride_data;
