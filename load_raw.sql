/*
Program:		insert_table.sql
Author:			Nathan Hayward
Date:			October 4, 2020
Course:			COMP-246
Description:	Script for loading the raw data into the table.
*/

-- Load Dataset1 into raw_climate_data table
LOAD DATA LOCAL INFILE 'one_year.csv' 
INTO TABLE raw_climate_data 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS 
    (station_id, station_name, latitude, longitude, elevation, @rcd_date, 
     @precipitation, @snowfall, @snow_depth, @temp_avg, @temp_max, @temp_min, 
     @wt01, @wt02, @wt03, @wt04, @wt05, @wt06, @wt08, @wt09, @wt11)
SET rcd_date = STR_TO_DATE(@rcd_date, '%d/%m/%Y'), 
    dataset = 1,
    precipitation = CAST(@precipitation AS DECIMAL(5,2)), 
    snow_depth = CAST(@snow_depth AS DECIMAL(5,1)), 
    temp_avg = CAST(@temp_avg AS INTEGER), 
    temp_max = CAST(@temp_max AS INTEGER), 
    temp_min = CAST(@temp_min AS INTEGER), 
    wt01 = IF(CAST(@wt01 AS INTEGER) = 1, 1, 0), 
    wt02 = IF(CAST(@wt02 AS INTEGER) = 1, 1, 0), 
    wt03 = IF(CAST(@wt03 AS INTEGER) = 1, 1, 0),
    wt04 = IF(CAST(@wt04 AS INTEGER) = 1, 1, 0),
	wt05 = IF(CAST(@wt05 AS INTEGER) = 1, 1, 0),
	wt06 = IF(CAST(@wt06 AS INTEGER) = 1, 1, 0),
	wt08 = IF(CAST(@wt08 AS INTEGER) = 1, 1, 0),
	wt09 = IF(CAST(@wt09 AS INTEGER) = 1, 1, 0),
    wt11 = IF(CAST(@wt11 AS INTEGER) = 1, 1, 0);


-- Load Dataset2 into raw_climate_data table
LOAD DATA LOCAL INFILE 'ten_year.csv' 
INTO TABLE raw_climate_data 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS 
    (station_id, station_name, latitude, longitude, elevation, @rcd_date,
     @precipitation, @snowfall, @snow_depth, @temp_max, @temp_min, 
     @wt01, @wt03, @wt04, @wt05, @wt06,@wt11)
SET rcd_date = STR_TO_DATE(@rcd_date, '%d/%m/%Y'), 
    dataset = 2,
    precipitation = CAST(@precipitation AS DECIMAL(5,2)), 
    snowfall = CAST(@snowfall AS DECIMAL(4,1)), 
    snow_depth = CAST(@snow_depth AS DECIMAL(5,1)), 
    temp_max = CAST(@temp_max AS INTEGER), 
    temp_min = CAST(@temp_min AS INTEGER), 
    wt01 = IF(CAST(@wt01 AS INTEGER) = 1, 1, 0), 
    wt03 = IF(CAST(@wt03 AS INTEGER) = 1, 1, 0), 
    wt04 = IF(CAST(@wt04 AS INTEGER) = 1, 1, 0), 
    wt05 = IF(CAST(@wt05 AS INTEGER) = 1, 1, 0), 
    wt06 = IF(CAST(@wt06 AS INTEGER) = 1, 1, 0), 
    wt11 = IF(CAST(@wt11 AS INTEGER) = 1, 1, 0);


-- Load Dataset3 into raw_climate_data table
LOAD DATA LOCAL INFILE '2005Hurricane.csv' 
INTO TABLE raw_climate_data 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS 
    (station_id, station_name, latitude, longitude, elevation, @rcd_date,
     @awnd, @fmtm, @pgtm, @precipitation, @snowfall, @snow_depth, @temp_avg, @temp_max, @temp_min,
     @wdf2, @wdf5, @wesd, @wsf2, @wsf5, @wt01, @wt02, @wt03, @wt04,
	 @wt05, @wt06, @wt07, @wt08, @wt09, @wt10, @wt11, @wt13, @wt14,
	 @wt15, @wt16, @wt17, @wt18, @wt19, @wt21, @wt22)
SET rcd_date = STR_TO_DATE(@rcd_date, '%d/%m/%Y'), 
    dataset = 3,
    precipitation = CAST(@precipitation AS DECIMAL(5,2)), 
    snowfall = CAST(@snowfall AS DECIMAL(4,1)), 
    snow_depth = CAST(@snow_depth AS DECIMAL(5,1)), 
    temp_max = CAST(@temp_max AS INTEGER), 
    temp_min = CAST(@temp_min AS INTEGER), 
    wt01 = IF(CAST(@wt01 AS INTEGER) = 1, 1, 0), 
    wt02 = IF(CAST(@wt02 AS INTEGER) = 1, 1, 0),
    wt03 = IF(CAST(@wt03 AS INTEGER) = 1, 1, 0), 
    wt04 = IF(CAST(@wt04 AS INTEGER) = 1, 1, 0), 
    wt05 = IF(CAST(@wt05 AS INTEGER) = 1, 1, 0), 
    wt06 = IF(CAST(@wt06 AS INTEGER) = 1, 1, 0), 
    wt07 = IF(CAST(@wt07 AS INTEGER) = 1, 1, 0),
    wt08 = IF(CAST(@wt08 AS INTEGER) = 1, 1, 0),
    wt09 = IF(CAST(@wt09 AS INTEGER) = 1, 1, 0),
    wt10 = IF(CAST(@wt10 AS INTEGER) = 1, 1, 0),
    wt11 = IF(CAST(@wt11 AS INTEGER) = 1, 1, 0),
    wt13 = IF(CAST(@wt13 AS INTEGER) = 1, 1, 0),
    wt14 = IF(CAST(@wt14 AS INTEGER) = 1, 1, 0),
    wt15 = IF(CAST(@wt15 AS INTEGER) = 1, 1, 0),
    wt16 = IF(CAST(@wt16 AS INTEGER) = 1, 1, 0),
    wt17 = IF(CAST(@wt17 AS INTEGER) = 1, 1, 0),
    wt18 = IF(CAST(@wt18 AS INTEGER) = 1, 1, 0),
    wt19 = IF(CAST(@wt19 AS INTEGER) = 1, 1, 0),
    wt21 = IF(CAST(@wt21 AS INTEGER) = 1, 1, 0),
    wt22 = IF(CAST(@wt22 AS INTEGER) = 1, 1, 0);

-- load weather types (tab delimited text file) into weather_types table
LOAD DATA LOCAL INFILE 'WTDataset.txt'
INTO TABLE weather_types 
FIELDS TERMINATED BY '\t' 
LINES TERMINATED BY '\r\n'
      (wt_id, description);
