.mode csv
.headers on
.import 2018_911.csv calls_2018
.import 2019_911.csv calls_2019
.import 2020_911.csv calls_2020
.import 2021_911.csv calls_2021
.import 2022_911.csv calls_2022
.import 2023_911.csv calls_2023
.import 2024_911.csv calls_2024
.import 2025_911.csv calls_2025

.schema calls_2018
.schema calls_2019
.schema calls_2020
.schema calls_2021
.schema calls_2022
.schema calls_2023
.schema calls_2024
.schema calls_2025

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
