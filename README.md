# Detroit 911 Call Data Analysis (2018-2025)

🎯 **Project Overview**  
This project transforms over **2 million** raw 911 call records from the Detroit Open Data Portal (2018-2025) into actionable intelligence. It demonstrates a complete data pipeline, from scalable data ingestion and robust database design to meticulous data cleaning and preparing for powerful statistical visualizations. The ultimate goal is to uncover critical trends in public safety, crime patterns, and emergency response dynamics within Metro Detroit.

---

✨ **Key Features & Highlights**  
- **Massive Data Management**: Engineered solutions to efficiently handle and process 2M+ records, showcasing scalable data handling.  
- **Structured Database Design**: Developed a centralized MySQL database, optimizing for complex queries and high-volume data storage.  
- **Advanced Data Preparation**: Implemented intricate SQL logic for data cleansing, standardization, and feature engineering (e.g., year extraction, clear_description mapping).  
- **Iterative Problem-Solving**: Successfully navigated data ingestion challenges by strategically leveraging and transitioning between database tools (SQLite, MySQL, TablePlus).  
- **Foundational for Insights**: Created analysis-ready datasets tailored for statistical modeling and compelling data visualization in R.

---

🛠️ **Technical Stack**  
This project leverages industry-standard tools and technologies:  
- **Database Systems**: MySQL (Primary), SQLite (Exploration)  
- **Database Client**: TablePlus  
- **Data Languages**: SQL, R (dplyr, ggplot2), Python (Future Plans)  
- **Development Tools**: VS Code, Cursor, R Studio, SQLTools  
- **Version Control**: Git, GitHub

---

📂 **Project Structure**  
```plaintext
Detroit911Calls-ResearchProject/
├── mysql/                            # SQL scripts for MySQL database operations
│   ├── 01_schema_definition.sql      # Defines main 'all_calls_staging' table structure.
│   ├── 02_data_cleaning_and_enrichment.sql # Data transformation and enrichment scripts.
│   └── 03_specialized_tables.sql     # SQL for creating specialized analytical tables.
├── sqlite_experiments/               # Documents initial exploration and setup attempts using SQLite.
│   └── initial_sqlite_attempt.sql    # SQLite-specific commands and notes.
├── r_scripts/                        # R scripts for data analysis and visualization (content to be added).
│   └── (e.g., 01_eda_and_viz.Rmd)
├── data_import_process.md            # Detailed documentation of data acquisition and import steps.
├── .gitignore                        # Specifies files to be ignored by Git.
└── README.md                         # Project overview and guide.
```
---

📊 **Data Source & Acquisition**

This project's foundation is public 911 call data (2018-2025) from the Detroit Open Data Portal.  

**Primary Data Source**: Detroit Open Data Portal  
Note: Specific dataset links may require searching for "911 Calls for Service" on the portal.

**Efficient Data Ingestion Workflow**:  
Given substantial raw CSV file sizes and initial direct MySQL import challenges, the TablePlus GUI client was instrumental. It efficiently imported each yearly CSV directly into the consolidated `all_calls_staging` table in MySQL. TablePlus's wizard automated schema detection and seamless record consolidation.

For a comprehensive, step-by-step guide to the data acquisition and import process, refer to:  
👉 `data_import_process.md`

---

🗄️ **Database Design & Transformation Workflow (ETL/ELT)**  
The project employs a structured data transformation pipeline:  

1. **Schema Definition** (`mysql/01_schema_definition.sql`): Establishes `all_calls_staging` table, using TEXT for initial columns to handle data inconsistencies robustly.  

2. **Data Cleaning & Enrichment** (`mysql/02_data_cleaning_and_enrichment.sql`):  
   - Extracts year from timestamps for robust temporal analysis.  
   - Maps cryptic category codes to `clear_description` for enhanced data interpretability.  

3. **Specialized Data Modeling** (`mysql/03_specialized_tables.sql`): Creates targeted "baby tables" from `all_calls_staging`, optimized for specific analytical questions (e.g., crime type breakdowns, average response times).

---

📈 **Analysis & Visualization (Next Steps)**  
1. **Create Specialized Tables**: Run `mysql/03_specialized_tables.sql` to generate focused subsets (e.g., `drug_overdose`, `fire_calls`) from `all_calls_staging`.  
2. **Export to CSV**: Use `SELECT * FROM <specialized_table>` with `INTO OUTFILE` (MySQL) or `sqlite3` CSV mode to dump each subset to `data/clean/<table_name>.csv`.  
3. **Load into R**: In RStudio, read each CSV with `readr::read_csv()` and combine as needed.  
4. **Exploratory Data Analysis**: Apply `dplyr` for summary statistics and `ggplot2` for visualizations (time series, category comparisons, response-time distributions).  
5. **Iterate & Refine**: Based on initial plots, refine SQL filters or R transformations to highlight emerging trends.  

---

*Last updated: 2025-06-29*  
