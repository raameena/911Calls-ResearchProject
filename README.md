# Detroit 911 Calls & Hospital Proximity Research Project

A comprehensive analysis of Detroit 911 call records (2018–2025) exploring the relationship between emergency call patterns and hospital locations in Wayne County, MI. This research reveals critical insights about violence patterns and the effectiveness of intervention programs.

---

## ♡ Research Question

**Main Question:**  
Is there a connection between where 911 calls happen most frequently and where hospitals are located in Wayne County?

**Hypotheses:**
- **Null Hypothesis:** There is no significant relationship between 911 call hotspots and hospital locations
- **Alternative Hypothesis:** Areas with more 911 calls are more likely to have hospitals nearby

---

## ♡ Key Findings

### Most Dangerous Locations Identified
- **Leisure St & W Outer Dr:** 5,000+ total calls with 1,000+ shooting-related calls - the most dangerous location
- **Grand Blvd & Lincoln St:** 5,000+ total calls
- **Moross Rd & Northdeuft Blvd:** Second highest with 699 shooting calls
- **Mac Ave & Beaubien St:** "Safest" of the four with 334 shooting calls

### Critical Discovery: Violence Pattern Shift
**The data reveals a significant transformation in emergency call patterns:**

- **Shooting Calls:** Decreased by **44.5%** after 2021 HVIPs funding implementation
- **Assault & Battery Calls:** Increased by **4.3%** annually, resulting in a **497.5% total increase** from 2,261 calls in 2018 to 13,509 calls in 2024

### Hospital Proximity Analysis
- **High-Call Areas with Hospitals:** Locations like Grand Blvd & Lincoln St have hospitals due to demand and efficient government spending
- **High-Call Areas without Hospitals:** Warwick St & Plymouth Rd (98 shooting calls) and Chapel St & W McNichols Rd (108 shooting calls) lack nearby hospitals
- **Potential for Intervention:** Strategic hospital placement between high-call areas could reduce crime rates through HVIPs programs

---

## ♡ Impact & Policy Implications

### Success of Violence Prevention Programs
**2021 Michigan Funding Initiative:** Governor Gretchen Whitmer's $30 million investment in:
- Hospital Violence Intervention Programs (HVIPs)
- Mental Health Services
- Substance Abuse and Sexual Assault Services
- Wraparound Services for High-Risk Youth

**Results:** The 44.5% reduction in shooting calls demonstrates these programs work.

### Critical Policy Gap Identified
**While shooting violence decreased, assault and battery surged:**
- **497.5% increase** in assault calls over 6 years
- Current programs successfully address gun violence but miss other violence types
- Need for expanded intervention strategies beyond just shooting prevention

### Economic Impact
**HVIPs Cost Savings:** Programs like "Caught in the Crossfire" show:
- 70% reduction in arrests among participants
- 60% reduction in criminal involvement
- $1.5 million annual savings per hospital
- Potential for exponential crime rate reduction through generational intervention

### Strategic Recommendations
1. **Expand Funding:** Address assault and battery prevention, not just shootings
2. **Targeted Hospital Placement:** Build facilities in high-call areas without hospitals
3. **HVIPs Expansion:** Implement programs in underserved high-violence areas
4. **Youth Programs:** Focus on breaking generational crime cycles through education

---

## ♡ Data Sources

- **911 Calls (2018-2025):** [Detroit Open Data Portal](https://data.detroitmi.gov/)
  - Over 2 million emergency call records
- **Population Data:** [US Census Bureau](https://data.census.gov/)
  - Annual population estimates by zip code
- **Hospital Locations:** Various healthcare databases
  - Hospital coordinates across Wayne County
- **Geographic Boundaries:** [Detroit ZCTA Map](https://data.detroitmi.gov/datasets/detroitmi::city-of-detroit-zip-code-tabulation-areas-zctas/explore?location=42.352506%2C-83.099035%2C10.58&showTable=true)

---

## ♡ Process Overview

### Data Collection
- Gathered 2+ million 911 call records from Detroit's open data
- Collected population data and hospital location information
- Mapped all data to zip code boundaries for analysis

### Analysis Methods
- **Spatial Analysis:** Mapped call density and hospital locations
- **Statistical Testing:** Analyzed correlation between call hotspots and hospital proximity
- **Pattern Recognition:** Identified recurring call types and locations
- **Population Normalization:** Adjusted for population differences across areas

### Technology Used
- **Database:** MySQL for storing and organizing call data
- **Python:** For data cleaning and geocoding addresses
- **R Studio:** For creating maps and visualizations

---

## ♡ Key Deliverables

### Maps & Visualizations
- Heatmaps showing 911 call density across Detroit
- Hospital location overlays on call patterns
- Interactive dashboards for exploring the data

### Data Products
- Top 50 call hotspot locations with coordinates
- Shooting incident concentration areas
- Call type analysis by geographic area
- Statistical correlation results

### Reports
- Comprehensive analysis of findings
- Policy recommendations for emergency planning
- Technical methodology documentation

---

## ♡ Repository Structure

```text
911Calls-ResearchProject/
├── Data Import/Export Process/
│   └── Specialized Tables/
├── MySQL/
│   └── SQL scripts for data processing
├── Python/
│   └── Data analysis notebooks
├── R/
│   └── Visualization and mapping files
└── README.md
```

---

*Authored by Raameen Ahmed | University of Michigan–Dearborn*
