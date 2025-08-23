-- Detroit 911 Call Data Analysis (2018-2025)
-- Specialized Analytical Tables Creation
-- Author: Raameen Ahmed
-- Date: June 29, 2025

-- Creates specialized tables for focused analysis
-- Each table extracts specific data patterns from the main staging table

-- Top 50 locations with highest 911 call volume
CREATE TABLE 911CallLocations AS
SELECT
    incident_location,
    COUNT(*) AS numbers
FROM
    all_calls_staging
GROUP BY
    incident_location
ORDER BY
    numbers DESC
LIMIT 50;

-- Top 50 locations with highest shooting-related calls
CREATE TABLE mostShootingLocations AS
SELECT
    clear_description,
    incident_location,
    COUNT(*) AS am_calls
FROM
    all_calls_staging
WHERE
    clear_description = 'Report of a Shooting/Cutting/Penetrating Wound'
GROUP BY
    clear_description,
    incident_location
ORDER BY
    am_calls DESC
LIMIT 50;

-- Top 50 call type and location combinations
CREATE TABLE mostCallTypesLocations AS
SELECT
    clear_description,
    incident_location,
    COUNT(*) AS am_calls
FROM
    all_calls_staging
GROUP BY
    clear_description,
    incident_location
ORDER BY
    am_calls DESC
LIMIT 50;

-- year count --
SELECT
    year,
    COUNT(*) AS am_calls
FROM
    all_calls_staging
GROUP BY
    year
ORDER BY
    year DESC;