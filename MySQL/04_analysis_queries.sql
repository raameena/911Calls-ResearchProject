-- Detroit 911 Call Data Analysis (2018-2025)
-- Analysis Queries for Pattern Recognition
-- Author: Raameen Ahmed
-- Date: June 29, 2025

-- Data analysis queries for identifying patterns and trends
-- These queries help understand call distribution and hotspot identification

-- Top shooting incident locations (used for identifying high-crime areas)
SELECT
    clear_description,
    incident_location,
    COUNT(*) AS numbers
FROM
    all_calls_staging
WHERE
    clear_description = 'Report of a Shooting/Cutting/Penetrating Wound'
GROUP BY
    clear_description,
    incident_location
ORDER BY
    numbers DESC;

-- Most common call types by location (reveals patterns like hospitals near high-call areas)
SELECT
    clear_description,
    incident_location,
    COUNT(*) AS numbers
FROM
    all_calls_staging
GROUP BY
    clear_description,
    incident_location
ORDER BY
    numbers DESC; 

-- Top locations by total 911 call volume (identifies hotspots)
SELECT
    incident_location,
    COUNT(*) AS numbers
FROM
    all_calls_staging
GROUP BY
    incident_location
ORDER BY
    numbers DESC;

-- Call patterns by precinct and type (shows precinct-specific trends)
SELECT
    precinct,
    clear_description,
    COUNT(*) AS numbers
FROM
    all_calls_staging
GROUP BY
    precinct,
    clear_description
ORDER BY
    numbers DESC;

-- Remove clear_description column from mostShootingLocations table
ALTER TABLE mostShootingLocations
  DROP COLUMN clear_description;