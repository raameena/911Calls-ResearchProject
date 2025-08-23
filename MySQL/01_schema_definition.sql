-- File: 01_schema_definition.sql
-- Project: Detroit 911 Call Data Analysis (2018-2025)
-- Author: Raameen Ahmed
-- Date: June 29, 2025

-- Creates the main staging table for consolidating all raw 911 call data
-- All columns use TEXT initially to handle data inconsistencies during import
-- Year column is INT for direct numerical analysis

CREATE TABLE all_calls_staging (
    incident_id TEXT,             -- Unique incident identifier
    incident_location TEXT,       -- Street address or location
    call_description TEXT,        -- Detailed call description
    category TEXT,                -- Abbreviated incident category (e.g., 'SHOTS IP')
    priority TEXT,                -- Call priority level
    call_group TEXT,              -- Call type group (e.g., 'Assault', 'Traffic')
    called_at TEXT,               -- Call timestamp (raw string format)
    intake_time TEXT,             -- Call received time
    dispatch_time TEXT,           -- Emergency services dispatch time
    travel_time TEXT,             -- Travel time to scene
    on_scene_time TEXT,           -- Arrival time on scene
    total_response_time TEXT,     -- Total call-to-arrival time
    total_time TEXT,              -- Total incident duration
    zip_code TEXT,                -- Incident location zip code
    precinct TEXT,                -- Police precinct
    year INT                      -- Extracted year for temporal analysis
);

CREATE TABLE 2022_census (
    category TEXT,
    population_estimate TEXT,
    population_MOE TEXT,
    percent_population TEXT,
    percent_MOE TEXT
);
CREATE TABLE 2023_census (
    category TEXT,
    population_estimate TEXT,
    population_MOE TEXT,
    percent_population TEXT,
    percent_MOE TEXT
);

-- Organize my database
RENAME TABLE `2022_census` TO `census_2022`;
RENAME TABLE `2023_census` TO `census_2023`;
RENAME TABLE `mostCallTypesLocations` TO `spec_mostCallTypesLocations`;
RENAME TABLE `mostShootingLocations` TO `spec_mostShootingLocations`;
RENAME TABLE `911CallLocations` TO `spec_911CallLocations`;
RENAME TABLE `zipCodeCounts` TO `spec_zipcodeCounts`;