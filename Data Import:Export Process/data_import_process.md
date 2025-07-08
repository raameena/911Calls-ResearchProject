# Data Import Process: Detroit 911 Call Data (2018-2025)

This document outlines the step-by-step process used to acquire and import the raw 911 call data from the Detroit Open Data Portal into the project's MySQL database. Given the large volume of data (8 CSV files, totaling over 2 million rows), the TablePlus GUI client was strategically utilized to streamline the initial ingestion and consolidation.

## 1. Data Acquisition

* **Source:** The raw data for each year (2018 through 2025) was downloaded as individual CSV files from the [Detroit Open Data Portal](https://data.detroitmi.gov/).
    * *Note:* Specific direct links to the individual yearly datasets may vary over time on the portal. Users can search for "911 Calls for Service" or similar terms to locate the most current data.

## 2. Initial Database Setup and Connection

* A MySQL server instance was established to host the project's database.
* TablePlus, a universal database management tool, was used to connect to the MySQL server and facilitate a user-friendly interface for database operations, including direct data import.

## 3. CSV Import and Data Consolidation via TablePlus

Due to challenges encountered with direct command-line MySQL import configurations for such a large volume of disparate CSV files, TablePlus's robust import functionality was leveraged to efficiently load and consolidate the data.

The process within TablePlus involved importing all 8 individual yearly CSV files (e.g., `2018_911.csv`, `2019_911.csv`, ..., `2025_911.csv`) **directly into a single, comprehensive `all_calls_staging` table** within the MySQL database. TablePlus's import wizard automated the schema detection, data type handling (initially as `TEXT` for flexibility), and the consolidation of all records from the various CSVs into this one large table.

* The schema for the `all_calls_staging` table is defined in the project's `mysql/01_schema_definition.sql` file.

## 4. Post-Import Data Processing

Following the initial data import and consolidation performed by TablePlus, further SQL operations were executed to clean, enrich, and transform the `all_calls_staging` dataset for detailed analysis. These steps are documented in:

* `mysql/02_data_cleaning_and_enrichment.sql` (e.g., adding `year` and `clear_description` columns).
* `mysql/03_specialized_tables.sql` (e.g., creating derived "baby tables" for specific analytical questions).

---