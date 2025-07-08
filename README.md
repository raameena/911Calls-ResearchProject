# Detroit 911 Calls Research Project

A comprehensive end-to-end data pipeline and analysis of Detroit 911 call records (2018–2025), transforming over 2 million raw calls into insightful, exportable tables and interactive visualizations.

---

## ♡ Project Overview

1. **Data Ingestion**: Raw CSVs from Detroit Open Data Portal loaded into MySQL staging table (`all_calls_staging`).  
2. **Schema Definition**: Robust schema to accommodate noisy text fields and timestamps (see `01_schema_definition.sql`).  
3. **Data Cleaning & Enrichment**: Extract year, standardize call types, map numeric codes to descriptive labels (`02_data_cleaning_and_enrichment.sql`).  
4. **Specialized Modeling**: Generate "baby tables" optimized for specific slices (top locations, call types by area, etc.) via `03_data_modeling.sql`.  
5. **CSV Exports**: Use MySQL `SELECT … INTO OUTFILE` within `secure_file_priv` to dump summary tables for downstream analysis.  
6. **Visualizations & Dashboard**: (Next steps) Produce charts (time-series, geographic maps) and assemble into a Shiny/Dash dashboard or HTML report.

---

## ♡ Tech Stack

- **Database**: MySQL 8.0+ (secure_file_priv export)  
- **SQL Scripting**: Schema, cleaning, modeling in modular `.sql` files  
- **Visualization**: R (ggplot2, dplyr)
- **Version Control**: GitHub (with CI for ETL automation)

---

## ♡ Key Features & Highlights

- **Massive Data Management**: Engineered solutions to efficiently handle and process 2M+ records, showcasing scalable data handling.  
- **Structured Database Design**: Developed a centralized MySQL database, optimizing for complex queries and high-volume data storage.  
- **Advanced Data Preparation**: Implemented intricate SQL logic for data cleansing, standardization, and feature engineering (e.g., year extraction, clear_description mapping).  
- **Iterative Problem-Solving**: Successfully navigated data ingestion challenges by strategically leveraging and transitioning between database tools (SQLite, MySQL, TablePlus).  
- **Foundational for Insights**: Created analysis-ready datasets tailored for statistical modeling and compelling data visualization in R.

---

## ♡ Repository Structure

```text
Detroit911Calls-ResearchProject/
├── Data Import/Export Process/
│   ├── Specialized Tables/             # Exported CSV summaries
│   │   ├── 911CallLocations.csv
│   │   ├── mostCallTypesLocations.csv
│   │   └── mostShootingLocations.csv
│   ├── data_export_process.sql         # SQL scripts for CSV exports
│   └── data_import_process.md          # Documentation of raw data loading
├── Initial Attempts/                   # Early SQLite exploration
│   └── initial_sqlite_attempt.sql      # SQLite-specific ETL notes
├── MySQL/                              # Production MySQL pipelines
│   ├── 01_schema_definition.sql
│   ├── 02_data_cleaning_and_enrichment.sql
│   ├── 03_data_modeling.sql
│   └── 04_analysis_queries.sql         # Analytical queries and reports
├── R/                                  # R scripts for future visualizations
│   └── (e.g., 01_eda_and_viz.Rmd)
├── .gitignore                          # Git ignore rules
└── README.md                           # Project overview and guide
```

---

## ♡ Key Deliverables

- **`911CallLocations`**: Top 50 locations in Wayne County with the most 911 calls
- **`mostShootingLocations`**: Top 50 locations with the most shooting 911 calls
- **`mostCallTypesLocations`**: Top 50 locations sorted by types of calls
  
---

*Authored by Raameen Ahmed | University of Michigan–Dearborn*  
