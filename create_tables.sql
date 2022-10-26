/*
Program:		create_tables.sql
Author:			Nathan Hayward
Date:			October 4, 2020
Course:			COMP-246
Description:	Script for creating the tables.
*/

DROP TABLE IF EXISTS weather;
DROP TABLE IF EXISTS wind;
DROP TABLE IF EXISTS air_temps;
DROP TABLE IF EXISTS precip;
DROP TABLE IF EXISTS weather_types;
DROP TABLE IF EXISTS weather_stations;
DROP TABLE IF EXISTS raw_climate_data;

CREATE TABLE raw_climate_data (
rcd_id             INTEGER auto_increment PRIMARY KEY,
station_id         VARCHAR(17) NOT NULL,
station_name       VARCHAR(50) NOT NULL, 
latitude           DECIMAL(9,5) NOT NULL, 
longitude          DECIMAL(10,5) NOT NULL, 
elevation          DECIMAL(5,1) NOT NULL,
rcd_date           DATE NOT NULL,
dataset            INTEGER NOT NULL,
peak_gust_time     INTEGER,
precipitation      DECIMAL(5,2),
snowfall           DECIMAL(4,1),
snow_depth         DECIMAL(5,1),
temp_avg           INTEGER,
temp_max           INTEGER,
temp_min           INTEGER,
one_min_wind_dir   INTEGER,
peak_gust_dir      INTEGER,
mile_wind_dir      INTEGER,
one_min_wind_speed DECIMAL(5,1),
peak_gust_speed    DECIMAL(5,1),
mile_wind_speed    DECIMAL(5,1),
wt01               BOOLEAN,
wt02               BOOLEAN,
wt03               BOOLEAN,
wt04               BOOLEAN,
wt05               BOOLEAN,
wt06               BOOLEAN,
wt07               BOOLEAN,
wt08               BOOLEAN,
wt09               BOOLEAN,
wt10               BOOLEAN,
wt11               BOOLEAN,
wt12               BOOLEAN,
wt13               BOOLEAN,
wt14               BOOLEAN,
wt15               BOOLEAN,
wt16               BOOLEAN,
wt17               BOOLEAN,
wt18               BOOLEAN,
wt19               BOOLEAN,
wt21               BOOLEAN,
wt22               BOOLEAN
);

CREATE TABLE weather_stations (       
		station_id    VARCHAR(17) NOT NULL PRIMARY KEY,
		station_name  VARCHAR(50),
		latitude      DECIMAL(9,5),
		longitude     DECIMAL(10,5),
		elevation     DECIMAL(5,1)
);

CREATE TABLE weather_types (
		wt_id		VARCHAR(4) PRIMARY KEY,
		DESCRIPTION	VARCHAR(50) NOT NULL
);

CREATE TABLE precip (       
		p_id          INTEGER auto_increment PRIMARY KEY,
		station_id    VARCHAR(17) NOT NULL,
		p_date        DATE NOT NULL,
		dataset       INTEGER NOT NULL,
		precipitation DECIMAL(5,2),
		snowfall      DECIMAL(4,1),
		snow_depth    DECIMAL(5,1),
		FOREIGN KEY (station_id) REFERENCES weather_stations(station_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE air_temps (
		at_id		INTEGER auto_increment PRIMARY KEY,
		station_id	VARCHAR(17) NOT NULL,
		at_date		DATE NOT NULL,
		dataset		INTEGER NOT NULL,
		temp_avg	INTEGER,
		temp_max	INTEGER,
		temp_min	INTEGER,
		FOREIGN KEY (station_id) REFERENCES weather_stations(station_id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE wind (
		wi_id		INTEGER auto_increment PRIMARY KEY,
		station_id	VARCHAR(17) NOT NULL,
		wi_date		DATE NOT NULL,
		dataset		INTEGER NOT NULL,
		one_min_wind_dir INTEGER,
		one_min_wind_speed	INTEGER,
		peak_gust_dir	INTEGER,
		peak_gust_speed	INTEGER,
		mile_wind_dir	INTEGER,
		mile_wind_speed	INTEGER,
		FOREIGN KEY (station_id) REFERENCES weather_stations(station_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE weather (
		we_id		INTEGER auto_increment PRIMARY KEY,
		station_id	VARCHAR(17) NOT NULL,
		we_date		DATE NOT NULL,
		dataset		INTEGER NOT NULL,
		w_type		VARCHAR(4),
		FOREIGN KEY (station_id) REFERENCES weather_stations(station_id) ON DELETE CASCADE ON UPDATE CASCADE,
		FOREIGN KEY (w_type) REFERENCES weather_types(wt_id) ON DELETE CASCADE ON UPDATE CASCADE
);

