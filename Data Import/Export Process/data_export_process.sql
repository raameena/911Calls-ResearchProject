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

-- Cleaned 2022 Census
SELECT *
INTO OUTFILE '/private/tmp/2022_census.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM all_911_calls.2022_census;

-- Cleaned 2022 Census
SELECT *
INTO OUTFILE '/private/tmp/2023_census.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM all_911_calls.2023_census;

-- Zipcode Counts
SELECT *
INTO OUTFILE '/private/tmp/zipcodeCounts.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM all_911_calls.spec_zipcodeCounts;

SELECT *
INTO OUTFILE '/private/tmp/zipcodeCounts.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM all_911_calls.spec_zipcodeCounts;

SELECT 'year', 'shots_fired', 'assault_battery' -- Header row as string literals
UNION ALL
SELECT
    CAST(year AS CHAR), -- Cast year to CHAR to match header string type for UNION ALL
    CAST(COUNT(CASE WHEN clear_description = 'Shots Fired, In Progress' THEN 1 ELSE NULL END) AS CHAR), -- Cast counts to CHAR
    CAST(COUNT(CASE WHEN clear_description = 'Domestic Violence Assault & Battery, In Progress or Just Happened' THEN 1 ELSE NULL END) AS CHAR)
INTO OUTFILE '/tmp/yearlyStats.csv' -- This path is on the MySQL server's file system
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM
    all_calls_staging
WHERE
    clear_description IN ('Shots Fired, In Progress', 'Domestic Violence Assault & Battery, In Progress or Just Happened')
GROUP BY
    year
ORDER BY
    year DESC;