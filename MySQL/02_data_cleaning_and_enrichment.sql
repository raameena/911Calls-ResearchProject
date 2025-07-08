-- Detroit 911 Call Data Analysis (2018-2025)
-- Data Cleaning and Enrichment Script
-- Author: Raameen Ahmed
-- Date: June 29, 2025

-- Performs data transformation and enrichment on the staging table
-- Extracts year from timestamps and creates human-readable category descriptions

-- IMPORTANT: Replace 'your_database_name' with your actual database name
USE your_database_name;

-- Extract year from timestamp for temporal analysis
UPDATE all_calls_staging
SET `year` = YEAR(STR_TO_DATE(LEFT(called_at, 19), '%Y/%m/%d %H:%i:%s'));

-- Add clear_description column for human-readable categories
ALTER TABLE all_calls_staging
ADD COLUMN clear_description TEXT;

-- Map abbreviated category codes to full descriptions
UPDATE all_calls_staging SET clear_description =
CASE TRIM(category)
    WHEN 'SHOTS IP' THEN 'Shots Fired, In Progress'
    WHEN 'FA IP' THEN 'Felonious Assault, In Progress'
    WHEN 'DV A/B' THEN 'Domestic Violence Assault & Battery, In Progress or Just Happened'
    WHEN 'UNKPROB' THEN 'Unknown Problem'
    WHEN 'WEAPON' THEN 'Report of a Person with a Weapon'
    WHEN 'AO' THEN 'Assist Other Agency'
    WHEN 'INVPERS' THEN 'Investigate a Suspicious Person'
    WHEN 'HI1 I/P' THEN 'Home Invasion (Occupied Residence), In Progress'
    WHEN 'RNAIP' THEN 'Robbery (Not Armed), In Progress'
    WHEN 'ACCINJ' THEN 'Vehicle or Pedestrian Accident with Injuries'
    WHEN 'MNTLNARM' THEN 'Mental Health Crisis (Violent, Not Armed)'
    WHEN 'DISTURB' THEN 'General Disturbance'
    WHEN 'AB IP/JH' THEN 'Assault & Battery, In Progress or Just Happened'
    WHEN 'HRUNK' THEN 'Hit & Run Accident, Unknown Injuries'
    WHEN 'MISCTRAF' THEN 'Miscellaneous Traffic Complaint'
    WHEN 'ACCUNK' THEN 'Vehicle Accident, Unknown Injuries or Impaired Driver'
    WHEN 'GSWCUT' THEN 'Shooting, Cutting, or Penetrating Wound'
    WHEN 'FA JH' THEN 'Felonious Assault, Just Happened'
    WHEN 'FELONY' THEN 'Person Wanted on a Felony Warrant'
    WHEN 'HI2IP' THEN 'Home Invasion (Unoccupied), In Progress'
    WHEN 'PANIC' THEN 'Panic or Duress Alarm'
    WHEN 'RNAREPT' THEN 'Report of a Robbery (Not Armed)'
    WHEN 'HOLDUP' THEN 'Hold Up Alarm (e.g., at a business)'
    WHEN 'MNTLARM' THEN 'Mental Health Crisis (Violent and Armed)'
    WHEN 'OD' THEN 'Person Down, Possible Drug Overdose'
    WHEN 'RAIP' THEN 'Robbery (Armed), In Progress'
    WHEN 'VERALRM' THEN 'Verified Alarm / Person without security code'
    WHEN 'FA RPT' THEN 'Report of a Felonious Assault'
    WHEN 'UDAAIP' THEN 'Unlawful Driving Away of Automobile (Stolen Car), In Progress'
    WHEN 'VICANML' THEN 'Vicious Animal Complaint'
    WHEN 'HI3' THEN 'Burglary, Other (e.g., shed, garage)'
    WHEN 'SUICIP' THEN 'Suicide, In Progress'
    WHEN 'WBC' THEN 'Check on the Well Being of a Person'
    WHEN 'DV F/A R' THEN 'Report of a Domestic Violence Felonious Assault'
    WHEN 'TRAFF1' THEN 'Major Traffic Incident (High Priority)'
    WHEN 'RAPE' THEN 'Rape, In Progress or Just Happened'
    WHEN 'LARCENY' THEN 'Larceny/Theft, In Progress or Just Happened'
    WHEN 'PPOIP' THEN 'Personal Protection Order Violation, In Progress'
    WHEN 'HRINJ' THEN 'Hit & Run Accident with Injuries'
    WHEN 'SHOTS JH' THEN 'Shots Fired, Just Happened (with evidence found)'
    WHEN 'MISSRPT' THEN 'Report of a Missing Person'
    WHEN 'BBUGIP' THEN 'Business Burglary, In Progress'
    WHEN 'SUICTHRT' THEN 'Threat of Suicide'
    WHEN 'TRAFF2' THEN 'Traffic Incident with Injuries'
    WHEN 'FRAUDIP' THEN 'Fraud, In Progress'
    WHEN 'MISSSER' THEN 'Serious Missing Person (e.g., child, endangered adult)'
    WHEN 'BEAUTO' THEN 'Breaking & Entering into a Vehicle, In Progress'
    WHEN 'ABRPT' THEN 'Report of an Assault & Battery'
    WHEN 'ASLT2' THEN 'Dangerous or Serious Assault (Medical Priority)'
    WHEN 'ABUSE' THEN 'Report of Child or Adult Abuse'
    WHEN 'OVR' THEN 'Person Slumped Over the Wheel of a Car'
    WHEN 'EXPLSION' THEN 'Report of an Explosion'
    WHEN 'INVAUTO' THEN 'Investigate a Suspicious Vehicle'
    WHEN 'ACCREPT' THEN 'Report of a Vehicle Accident'
    WHEN 'PARK' THEN 'Parking Complaint'
    WHEN 'RAJH' THEN 'Robbery (Armed), Just Happened'
    WHEN 'LITTER' THEN 'Littering, In Progress'
    WHEN 'MDPIP' THEN 'Malicious Destruction of Property, In Progress'
    WHEN 'PRS WEAP' THEN 'Domestic Violence, Person with Weapon, In Progress/Just Happened'
    WHEN 'HOMEALNE' THEN 'Report of Child(ren) Home Alone'
    WHEN 'RECAUTO' THEN 'Recover a Stolen Vehicle'
    WHEN 'HI2RPT' THEN 'Report of a Home Invasion (Unoccupied)'
    WHEN 'HI2JH' THEN 'Home Invasion (Unoccupied), Just Happened'
    WHEN 'AIDMOTOR' THEN 'Assist Motorist, Child Locked Inside Vehicle'
    WHEN 'ABUSERPT' THEN 'Report of Child or Adult Abuse'
    WHEN 'MENTPPRS' THEN 'Mental Health Crisis (Not Violent)'
    WHEN 'OOBVDEAD' THEN 'Observation of a Dead Person'
    WHEN 'SUICATT' THEN 'Report of an Attempted Suicide'
    WHEN 'VRM' THEN 'Verify a Missing Person has Returned'
    WHEN 'BBURGJH' THEN 'Business Burglary, Just Happened'
    WHEN 'LARCREPT' THEN 'Report of a Larceny/Theft'
    WHEN 'KIDNAP' THEN 'Report of a Kidnapping'
    WHEN 'ARSNREPT' THEN 'Report of an Arson'
    WHEN 'UDAAREPT' THEN 'Report of a Stolen Vehicle'
    WHEN 'ASSTPERS' THEN 'Assist Other Emergency Personnel'
    WHEN 'HI1 REPT' THEN 'Report of a Home Invasion (Occupied Residence)'
    WHEN 'BMBTHRT' THEN 'Report of a Bomb Threat'
    WHEN 'ENTRY' THEN 'Medical EMS Call for Trouble/Forced Entry'
    WHEN 'ANMLCOMP' THEN 'Animal Complaint'
    WHEN 'ARSON' THEN 'Arson, In Progress'
    WHEN 'RAPERPT' THEN 'Report of a Rape'
    WHEN 'NARCIP' THEN 'Narcotics Activity, In Progress'
    WHEN 'VEH' THEN 'Vehicle Fire'
    WHEN 'MISDEMEA' THEN 'Person Wanted on a Misdemeanor Warrant'
    WHEN 'FRAUDRPT' THEN 'Report of Fraud'
    WHEN 'HRREPT' THEN 'Vehicle or Pedestrian Hit & Run Report'
    WHEN 'HOLDPERS' THEN 'Citizen Holding a Suspect'
    WHEN 'RECAUTOF' THEN 'Recover a Stolen Vehicle (Felony)'
    WHEN 'AIDMOTR' THEN 'Assist Motorist, Miscellaneous'
    WHEN 'GSWRPT' THEN 'Report of a Shooting/Cutting/Penetrating Wound'
    WHEN 'RECPROP' THEN 'Recovered or Found Property'
    WHEN 'FNDPERS' THEN 'A Missing Person has been Found'
    WHEN 'SEXRPT' THEN 'Report of a Sex Crime'
    WHEN 'OTHERSEX' THEN 'Sex Crime, In Progress'
    WHEN 'BANKALRM' THEN 'Bank Alarm'
    WHEN 'DV AB RP' THEN 'Report of a Domestic Violence Assault & Battery'
    WHEN 'RESD' THEN 'Residential Fire'
    WHEN 'MDPRPT' THEN 'Report of Malicious Destruction of Property'
    WHEN 'MAULING' THEN 'Animal Mauling (High Priority Medical)'
    WHEN 'SCRP IP' THEN 'Scrappers Stripping a Building, In Progress'
    WHEN 'SENIOR' THEN 'Assist a Senior Citizen'
    WHEN 'KIDNAPRP' THEN 'Report of a Kidnapping'
    WHEN 'MOLEST' THEN 'Molestation'
    WHEN 'ASTCITZ' THEN 'Assist a Citizen'
    WHEN 'SQDISTB' THEN 'Disturbance involving Squatters'
    WHEN 'HAZCON' THEN 'Hazardous Conditions'
    WHEN 'OVER1' THEN 'Overdose (High Priority Medical)'
    WHEN 'TRAFF3' THEN 'Traffic Accident with Minor Injuries'
    WHEN 'RARPT' THEN 'Report of an Armed Robbery'
    WHEN 'ATMALRM' THEN 'ATM Alarm'
    WHEN 'VIPIP' THEN 'Threats against a VIP, In Progress'
    WHEN 'BITE' THEN 'Possible Dangerous Animal Bite'
    WHEN 'TROUBLE' THEN 'Emergency Personnel in Trouble'
    WHEN 'SICK1' THEN 'Sick Person (High Priority Medical)'
    WHEN 'DDOT' THEN 'Trouble involving a DDOT (Detroit Dept. of Transportation) Bus'
    WHEN 'BBURGRPT' THEN 'Report of a Business Burglary'
    WHEN 'SUSPPACK' THEN 'Suspicious Package'
    WHEN 'GSW1' THEN 'Shot or Stabbed (High Priority Medical)'
    WHEN 'BEAUTORP' THEN 'Report of Breaking & Entering a Vehicle'
    WHEN 'HI3RPT' THEN 'Report of other Burglary (shed, garage)'
    WHEN 'DPDA' THEN 'Detroit Police Department Assist'
    WHEN 'WPNRPT' THEN 'Report of a Person with a Weapon'
    WHEN 'BUSN' THEN 'Commercial/Business Fire'
    WHEN 'WIRES' THEN 'Power Lines Down'
    WHEN 'GRASS' THEN 'Grass Fire'
    WHEN 'ACTVSHTR' THEN 'Active Shooter or Mass Attack'
    WHEN 'SCRP JH' THEN 'Scrappers Stripping a Building, Just Happened'
    WHEN 'MISCACCD' THEN 'Miscellaneous Accident'
    WHEN 'OVER2' THEN 'Overdose, Not Alert or Unknown Status'
    WHEN 'NARCRPT' THEN 'Report of Narcotics Activity'
    WHEN 'ANMLFITE' THEN 'Animal Fight'
    WHEN 'PSYCH2' THEN 'Suicide Threat or Abnormal Behavior'
    WHEN 'NOISE' THEN 'Noise Complaint'
    WHEN 'ALRUNK' THEN 'Alarm, Unknown Cause'
    WHEN 'GSW2' THEN 'Shot/Stabbed, Unknown or Obvious Death'
    WHEN 'ASLT3' THEN 'Non-Dangerous Assault'
    WHEN 'TRF STOP' THEN 'Officer Initiated Traffic Stop'
    WHEN 'PPOREPT' THEN 'Report of a Personal Protection Order Violation'
    WHEN 'PSYCH3' THEN 'Mental Health, Non-Suicidal or Threatening'
    WHEN 'EXTIP' THEN 'Extortion, In Progress'
    WHEN 'AB IP' THEN 'Assault & Battery, In Progress'
    WHEN 'AB JH' THEN 'Assault & Battery, Just Happened'
    WHEN 'OSD STRU' THEN 'Other Outside Structure Fire'
    WHEN 'SCH J/H' THEN 'School Threats, Just Happened or Report'
    WHEN 'SHOTSPT' THEN 'Gunshot detection system alert'
    ELSE NULL
END;

-- Remove clear_description column from mostShootingLocations table
ALTER TABLE mostShootingLocations
  DROP COLUMN clear_description;

SELECT
    zip_code,
    COUNT(*) AS numbers
FROM
    all_calls_staging
GROUP BY
    zip_code
ORDER BY
    numbers DESC;


SELECT
    clear_description,
    COUNT(*) AS numbers
FROM
    all_calls_staging
GROUP BY
    clear_description
ORDER BY
    numbers DESC;

SELECT
    clear_description,
    year,
    COUNT(*) AS numbers
FROM
    all_calls_staging
GROUP BY
    clear_description,
    year
ORDER BY
    numbers DESC;