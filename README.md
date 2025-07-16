# Detroit 911 Calls & Hospital Proximity Research Project

A comprehensive data pipeline and spatial analysis of Detroit 911 call records (2018–2025), exploring the statistical relationship between 911 call density and proximity to hospitals in Wayne County, MI. The project transforms over 2 million raw calls into clean, analysis-ready tables and visualizations, aiming to inform urban healthcare planning.

---

## ♡ Research Question & Hypotheses

**Main Question:**  
Is there a statistical spatial correlation between 911 call density (2018–2025) and proximity to hospitals in Wayne County?

- **Null Hypothesis (H₀):**  
  There is no statistically significant spatial correlation between hospital locations and 911 call density.

- **Alternative Hypothesis (H₁):**  
  There is a positive, statistically significant spatial correlation between 911 call density and hospital locations (i.e., higher 911 call density areas are more likely to have a hospital nearby).

- **Additional Consideration:**  
  Population trends by year will be included to contextualize demand.

---

## ♡ Research Workflow & TODOs

- [x] **Formulate Hypotheses & Research Question**
- [x] **Literature Review**  
  - Key factors in hospital location: environment, demand, population, proximity, competition, government policies, costs ([Wiley article](https://onlinelibrary.wiley.com/doi/10.1155/2021/6682958#:~:text=This%20problem%20depends%20on%20many,problems%20%5B4%E2%80%938%5D.))
  - This project focuses on the *demand* sector, using 911 call data as a proxy.
- [ ] **Data Cleaning**  
  - Prepare and validate 911 call and population datasets.
  - Map Wayne County by zip code ([Detroit ZCTA map](https://data.detroitmi.gov/datasets/detroitmi::city-of-detroit-zip-code-tabulation-areas-zctas/explore?location=42.352506%2C-83.099035%2C10.58&showTable=true))
- [ ] **Statistical Analysis & Visualization**  
  - Create a heatmap of 911 call density by zip code.
  - Overlay hospital locations.
  - Highlight hotspot streets.
  - Annotate with average population data.
- [ ] **Results & Interpretation**
- [ ] **Final Report**

---

## ♡ Data Sources

- **911 Calls (2018–2025):**  
  [Detroit Open Data Portal](https://data.detroitmi.gov/)
- **Population Estimates:**  
  [US Census Bureau 5-Year Estimates (2018–2023)](https://data.census.gov/)
- **Hospital Locations:**  
  (To be added or described in analysis)
- **Wayne County Zip Code Map:**  
  [Detroit ZCTA Map](https://data.detroitmi.gov/datasets/detroitmi::city-of-detroit-zip-code-tabulation-areas-zctas/explore?location=42.352506%2C-83.099035%2C10.58&showTable=true)

---

## ♡ Tech Stack

- **Database:** MySQL 8.0+  
- **ETL & Data Cleaning:** SQL (modular scripts)  
- **Analysis & Visualization:** Python (pandas, matplotlib, numpy), R (planned)  
- **Version Control:** GitHub

---

## ♡ Database Architecture & Data Management

A robust MySQL database is at the heart of this project, serving as the central hub for all raw and processed 911 call data. This approach ensures data integrity, reproducibility, and scalability as new data is acquired or analyses are expanded.

**Key Features:**
- **Centralized Staging Table:**  
  All raw 911 call records (2018–2025) are consolidated into a single `all_calls_staging` table. This table is designed with flexible data types to accommodate inconsistencies and facilitate large-scale imports.
- **Modular SQL Scripts:**  
  - `01_schema_definition.sql`: Defines the staging table schema.
  - `02_data_cleaning_and_enrichment.sql`: Cleans and enriches data (e.g., extracts year, maps codes to descriptions).
  - `03_data_modeling.sql`: Creates specialized “baby tables” for focused analysis (e.g., top call locations, shooting hotspots).
  - `04_analysis_queries.sql`: Provides reusable queries for pattern recognition and reporting.
- **Import Process:**  
  - Raw CSVs for each year are imported using TablePlus, which streamlines the process and handles schema detection for millions of rows.
  - The import process is documented in `Data Import:Export Process/data_import_process.md`.
- **Data Cleaning & Enrichment:**  
  - After import, SQL scripts standardize, enrich, and transform the data for analysis.
  - Human-readable columns and derived features are added for clarity.
- **Export Process:**  
  - Specialized tables are exported to CSV using SQL’s `SELECT ... INTO OUTFILE` for downstream analysis in Python or R.
  - Export scripts are found in `Data Import:Export Process/data_export_process.sql`.
- **Ongoing Data Management:**  
  - The database is designed for easy re-import and export as new data becomes available, ensuring all analyses are based on a single, authoritative source.

**Why this matters:**  
This SQL-first approach keeps all data organized, versioned, and ready for both statistical analysis and visualization, making it easy to update, expand, or reproduce results as the project evolves.

---

## ♡ Repository Structure

```text
911Calls-ResearchProject/
├── Data Import:Export Process/
│   ├── Specialized Tables/
│   │   ├── 911CallLocations.csv
│   │   ├── mostCallTypesLocations.csv
│   │   └── mostShootingLocations.csv
│   ├── data_export_process.sql
│   └── data_import_process.md
├── Initial Attempts/
│   └── initial_sqlite_attempt.sql
├── MySQL/
│   ├── 01_schema_definition.sql
│   ├── 02_data_cleaning_and_enrichment.sql
│   ├── 03_data_modeling.sql
│   └── 04_analysis_queries.sql
├── Python Visuals/
│   ├── 911CallsAnalysis.ipynb
│   └── Datasets/
│       ├── 2022FiveYearEstimate.csv
│       ├── 2023FiveYearEstimate.csv
│       ├── 911CallLocations.csv
│       ├── mostCallTypesLocations.csv
│       └── mostShootingLocations.csv
├── R/
│   └── (future R scripts)
└── README.md
```

---

## ♡ Key Deliverables

- **Cleaned & Modeled Data:**  
  - `911CallLocations`: Top 50 911 call hotspots  
  - `mostShootingLocations`: Top 50 shooting call hotspots  
  - `mostCallTypesLocations`: Top 50 locations by call type
- **Python Notebook:**  
  - Data import, cleaning, and exploratory analysis (`Python Visuals/911CallsAnalysis.ipynb`)
- **Planned Visualizations:**  
  - Heatmaps, hospital overlays, population context

---

## ♡ Notes

- The project is currently focused on Python (pandas, matplotlib, numpy) for analysis and visualization. R visualizations may be added later.
- The analysis acknowledges that hospital location is multifactorial; this work isolates the *demand* aspect via 911 call data.

---

*Authored by Raameen Ahmed | University of Michigan–Dearborn*
