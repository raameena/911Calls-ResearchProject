-- SQLITE INITIAL DATA INGESTION AND CONSOLIDATION ATTEMPT
--
-- Purpose: This script documents an initial attempt to ingest and combine
--          yearly 911 call data from CSV files into a single 'all_calls' table
--          using SQLite.
--
-- Note: Due to limitations encountered with handling very large datasets and
--       specific data manipulation requirements for this project, the
--       primary database solution was later transitioned to MySQL.
--       This file serves to illustrate the initial exploration and process.

-- Set SQLite import mode to CSV and enable header row recognition.
.mode csv
.headers on

-- Import individual yearly 911 call CSV files into separate SQLite tables.
-- Each table (e.g., calls_2018) temporarily holds the data for its respective year.
.import 2018_911.csv calls_2018
.import 2019_911.csv calls_2019
.import 2020_911.csv calls_2020
.import 2021_911.csv calls_2021
.import 2022_911.csv calls_2022
.import 2023_911.csv calls_2023
.import 2024_911.csv calls_2024
.import 2025_911.csv calls_2025

-- Display the schema of each imported table to verify column names and data types.
-- This helps in ensuring consistent structure across all yearly datasets before consolidation.
.schema calls_2018
.schema calls_2019
.schema calls_2020
.schema calls_2021
.schema calls_2022
.schema calls_2023
.schema calls_2024
.schema calls_2025

-- Consolidate all individual yearly call tables into one large 'all_calls' table.
-- UNION ALL is used to combine all rows from each table without removing duplicates,
-- ensuring all 911 call records from 2018-2025 are included.
CREATE TABLE all_calls AS
SELECT
  incident_id,
  incident_location,
  call_description,
  category,
  priority,
  call_group,
  called_at,
  intake_time,
  dispatch_time,
  travel_time,
  on_scene_time,
  total_response_time,
  total_time,
  zip_code,
  precinct
FROM calls_2018
UNION ALL
SELECT
  incident_id,
  incident_location,
  call_description,
  category,
  priority,
  call_group,
  called_at,
  intake_time,
  dispatch_time,
  travel_time,
  on_scene_time,
  total_response_time,
  total_time,
  zip_code,
  precinct
FROM calls_2019
UNION ALL
SELECT
  incident_id,
  incident_location,
  call_description,
  category,
  priority,
  call_group,
  called_at,
  intake_time,
  dispatch_time,
  travel_time,
  on_scene_time,
  total_response_time,
  total_time,
  zip_code,
  precinct
FROM calls_2020
UNION ALL
SELECT
  incident_id,
  incident_location,
  call_description,
  category,
  priority,
  call_group,
  called_at,
  intake_time,
  dispatch_time,
  travel_time,
  on_scene_time,
  total_response_time,
  total_time,
  zip_code,
  precinct
FROM calls_2021
UNION ALL
SELECT
  incident_id,
  incident_location,
  call_description,
  category,
  priority,
  call_group,
  called_at,
  intake_time,
  dispatch_time,
  travel_time,
  on_scene_time,
  total_response_time,
  total_time,
  zip_code,
  precinct
FROM calls_2022
UNION ALL
SELECT
  incident_id,
  incident_location,
  call_description,
  category,
  priority,
  call_group,
  called_at,
  intake_time,
  dispatch_time,
  travel_time,
  on_scene_time,
  total_response_time,
  total_time,
  zip_code,
  precinct
FROM calls_2023
UNION ALL
SELECT
  incident_id,
  incident_location,
  call_description,
  category,
  priority,
  call_group,
  called_at,
  intake_time,
  dispatch_time,
  travel_time,
  on_scene_time,
  total_response_time,
  total_time,
  zip_code,
  precinct
FROM calls_2024
UNION ALL
SELECT
  incident_id,
  incident_location,
  call_description,
  category,
  priority,
  call_group,
  called_at,
  intake_time,
  dispatch_time,
  travel_time,
  on_scene_time,
  total_response_time,
  total_time,
  zip_code,
  precinct
FROM calls_2025
;