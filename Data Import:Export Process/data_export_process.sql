-- Detroit 911 Call Data Analysis (2018-2025)
-- Data Export Process for Analysis
-- Author: Raameen Ahmed
-- Date: June 29, 2025

-- Exports specialized tables to CSV format for further analysis in R/Python
-- Files are saved to /private/tmp/ for easy access

-- Export top 50 locations by call volume
SELECT *
INTO OUTFILE '/private/tmp/911CallLocations.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM all_911_calls.911CallLocations;

-- Export top 50 shooting incident locations
SELECT *
INTO OUTFILE '/private/tmp/mostShootingLocations.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM all_911_calls.mostShootingLocations;

-- Export top 50 call type and location combinations
SELECT *
INTO OUTFILE '/private/tmp/mostCallTypesLocations.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM all_911_calls.mostCallTypesLocations;