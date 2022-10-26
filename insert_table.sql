/*
Program:		load_raw.sql
Author:			Nathan Hayward
Date:			October 4, 2020
Course:			COMP-246
Description:	Script for inserting the information.
*/

-- load weather stations from raw_climate_data into weather_stations

INSERT INTO weather_stations (
       station_id,
       station_name,
       latitude,
       longitude,
       elevation )
SELECT DISTINCT 
       station_id,
       station_name,
       latitude,
       longitude,
       elevation 
FROM   raw_climate_data; 

-- load air temperature information from raw_climate_data into air_temps

INSERT INTO air_temps (
       station_id,
       at_date,
       dataset,
       temp_avg,
	   temp_max,
       temp_min )
SELECT DISTINCT 
       station_id,
       rcd_date,
       dataset,
       temp_avg,
	   temp_max,
	   temp_min 
FROM   raw_climate_data; 

-- load precipitation information from raw_climate_data into precip
INSERT INTO precip (
       station_id,
       p_date,
       dataset,
       precipitation,
       snowfall,
       snow_depth )
SELECT
       station_id,
       rcd_date,
       dataset,
       precipitation,
       snowfall,
       snow_depth
FROM   raw_climate_data
WHERE  precipitation IS NOT NULL
       OR snowfall IS NOT NULL
       OR snow_depth IS NOT NULL;

-- load wind inforomation from raw_climate_data into wind

INSERT INTO wind (
       station_id,
       wi_date,
       dataset,
       one_min_wind_dir,
		peak_gust_dir,
		peak_gust_speed,
		mile_wind_dir,
		mile_wind_speed)
SELECT DISTINCT 
       station_id,
       rcd_date,
       dataset,
       one_min_wind_dir,
       peak_gust_dir,
		peak_gust_speed,
		mile_wind_dir,
		mile_wind_speed
FROM   raw_climate_data; 


-- load weather information from raw_climate_data into weather
INSERT INTO weather (
       station_id,
       we_date,
       dataset,
       w_type )
SELECT
       station_id,
       rcd_date,
       dataset,
       'WT01'
FROM   raw_climate_data
WHERE  wt01
UNION ALL
SELECT
       station_id,
       rcd_date,
       dataset,
       'WT02'
FROM   raw_climate_data
WHERE  wt02
UNION ALL
SELECT
       station_id,
       rcd_date,
       dataset,
       'WT03'
FROM   raw_climate_data
WHERE  wt03
UNION ALL
SELECT
       station_id,
       rcd_date,
       dataset,
       'WT04'
FROM   raw_climate_data
WHERE  wt04
UNION ALL
SELECT
       station_id,
       rcd_date,
       dataset,
       'WT05'
FROM   raw_climate_data
WHERE  wt05
UNION ALL
SELECT
       station_id,
       rcd_date,
       dataset,
       'WT06'
FROM   raw_climate_data
WHERE  wt06
UNION ALL
SELECT
       station_id,
       rcd_date,
       dataset,
       'WT07'
FROM   raw_climate_data
WHERE  wt07
UNION ALL
SELECT
       station_id,
       rcd_date,
       dataset,
       'WT08'
FROM   raw_climate_data
WHERE  wt08
UNION ALL
SELECT
       station_id,
       rcd_date,
       dataset,
       'WT09'
FROM   raw_climate_data
WHERE  wt09
UNION ALL
SELECT
       station_id,
       rcd_date,
       dataset,
       'WT10'
FROM   raw_climate_data
WHERE  wt10
UNION ALL
SELECT
       station_id,
       rcd_date,
       dataset,
       'WT11'
FROM   raw_climate_data
WHERE  wt11
UNION ALL
SELECT
       station_id,
       rcd_date,
       dataset,
       'WT12'
FROM   raw_climate_data
WHERE  wt12
UNION ALL
SELECT
       station_id,
       rcd_date,
       dataset,
       'WT13'
FROM   raw_climate_data
WHERE  wt13
UNION ALL
SELECT
       station_id,
       rcd_date,
       dataset,
       'WT14'
FROM   raw_climate_data
WHERE  wt14
UNION ALL
SELECT
       station_id,
       rcd_date,
       dataset,
       'WT15'
FROM   raw_climate_data
WHERE  wt15
UNION ALL
SELECT
       station_id,
       rcd_date,
       dataset,
       'WT16'
FROM   raw_climate_data
WHERE  wt16
UNION ALL
SELECT
       station_id,
       rcd_date,
       dataset,
       'WT17'
FROM   raw_climate_data
WHERE  wt17
UNION ALL
SELECT
       station_id,
       rcd_date,
       dataset,
       'WT18'
FROM   raw_climate_data
WHERE  wt18
UNION ALL
SELECT
       station_id,
       rcd_date,
       dataset,
       'WT19'
FROM   raw_climate_data
WHERE  wt19
UNION ALL
SELECT
       station_id,
       rcd_date,
       dataset,
       'WT21'
FROM   raw_climate_data
WHERE  wt21
UNION ALL
SELECT
       station_id,
       rcd_date,
       dataset,
       'WT22'
FROM   raw_climate_data
WHERE  wt22;


