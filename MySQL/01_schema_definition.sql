-- File: 01_schema_definition.sql
-- Project: Detroit 911 Call Data Analysis (2018-2025)
-- Author: Raameen Ahmed
-- Date: June 29, 2025

-- Purpose: Defines the schema for the 'all_calls_staging' table. This table
--          serves as the primary landing zone for consolidating all raw 911
--          call data from various yearly CSV files.
--
-- Rationale for Data Types:
-- All columns are initially set to TEXT to ensure maximum compatibility and
-- avoid data import errors due to inconsistencies or unexpected formats
-- within the raw CSV data. This allows for flexible handling of mixed data
-- types or dirty data, with more specific type casting and cleaning
-- to be performed in subsequent data transformation steps.
--
-- The 'year' column is explicitly defined as INT for direct numerical storage,
-- as its data is clean and consistent from extraction.

CREATE TABLE all_calls_staging (
    incident_id TEXT,             -- Unique identifier for each incident
    incident_location TEXT,       -- Street address or location of the incident
    call_description TEXT,        -- Detailed description of the call
    category TEXT,                -- Abbreviated category of the incident (e.g., 'SHOTS IP')
    priority TEXT,                -- Priority level of the call
    call_group TEXT,              -- Group or type of calls (e.g., 'Assault', 'Traffic')
    called_at TEXT,               -- Timestamp when the call was made (raw string format)
    intake_time TEXT,             -- Time the call was received/logged
    dispatch_time TEXT,           -- Time emergency services were dispatched
    travel_time TEXT,             -- Time taken to travel to the scene
    on_scene_time TEXT,           -- Time emergency services arrived on scene
    total_response_time TEXT,     -- Total time from call to on-scene
    total_time TEXT,              -- Total duration of the incident handling
    zip_code TEXT,                -- Zip code of the incident location
    precinct TEXT,                -- Police precinct related to the incident
    year INT                      -- Extracted year of the incident, used for temporal analysis
);
