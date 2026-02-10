## Setup

1. Download Docker Desktop (if you don’t have installed) using the official website, install and launch.
2. Fork this Github project to you Github account. Clone the forked repo to your device.
3. Open your Command Prompt or Terminal, navigate to that folder, and run the command `docker compose up`.
4. Now you have launched a local Postgres database with the following credentials:
 ```
    Host: localhost
    User: admin
    Password: admin
    Port: 5432 
```
5. Connect to the db via a preferred tool (e.g. DataGrip, Dbeaver etc)
6. Install dbt-core and dbt-postgres using pip (if you don’t have) on your preferred environment.
7. Now you can run `dbt run` with the test model and check public_pipedrive_analytics schema to see the dbt result (with one test model)

## Project
1. Remove the test model once you make sure it works
2. Dive deep into the Pipedrive CRM source data to gain a thorough understanding of all its details. (You may also research the Pipedrive CRM tool terms).
3. Define DBT sources and build the necessary layers organizing the data flow for optimal relevance and maintainability.
4. Build a reporting model (rep_sales_funnel_monthly) with monthly intervals, incorporating the following funnel steps (KPIs):  
  &nbsp;&nbsp;&nbsp;Step 1: Lead Generation  
  &nbsp;&nbsp;&nbsp;Step 2: Qualified Lead  
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Step 2.1: Sales Call 1  
  &nbsp;&nbsp;&nbsp;Step 3: Needs Assessment  
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Step 3.1: Sales Call 2  
  &nbsp;&nbsp;&nbsp;Step 4: Proposal/Quote Preparation  
  &nbsp;&nbsp;&nbsp;Step 5: Negotiation  
  &nbsp;&nbsp;&nbsp;Step 6: Closing  
  &nbsp;&nbsp;&nbsp;Step 7: Implementation/Onboarding  
  &nbsp;&nbsp;&nbsp;Step 8: Follow-up/Customer Success  
  &nbsp;&nbsp;&nbsp;Step 9: Renewal/Expansion
5. Column names of the reporting model: `month`, `kpi_name`, `funnel_step`, `deals_count`
6. “Git commit” all the changes and create a PR to your forked repo (not the original one). Send your repo link to us.

### **------------------SOLUTION PRCOESS FLOW---------------------**
# Sales Funnel DBT Project

## Overview
This project models sales funnel metrics from Pipedrive CRM. It transforms raw CRM data into a clean, structured dataset for monthly reporting, including main funnel steps (1-9) and sub-steps like Sales Call 1 (2.1) and Sales Call 2 (3.1).

---

## Data Flow & Layers

1. **Raw Layer (`public` schema)**  
   - Contains the raw CSV data loaded as seeds.  
   - Raw data tables include `activity`, `activity_types`, `deal_changes`, `fields`, `stages`, `users`.  

2. **Staging Layer (`stg_*` views in dedicated schema)**  
   - Cleans and standardizes raw data.  
   - Converts flags to booleans, parses JSON, trims and lowercases text, deduplicates users.  
   - Implemented as **views** for easier debugging and lightweight transformations.

3. **Intermediate Layer (`int_*` tables in dedicated schema)**  
   - Enriches and combines staging tables.  
   - Deduplicates deal stage updates and handles nulls safely.  
   - Implemented as **tables** to store pre-aggregated, reusable data.

4. **Mart Layer (`rep_sales_funnel_monthly` table in dedicated schema)**  
   - Builds the final monthly funnel report with KPIs.  
   - Counts unique deals per funnel step, including sub-steps.  
   - Sorts funnel steps numerically for correct order.  
   - Implemented as a **table** for reporting and performance.

---

## Key Decisions
- CSV headers are lowercase to avoid Postgres case-sensitivity issues.  
- `ROW_NUMBER()` used to deduplicate records in staging/intermediate layers.  
- `COUNT(DISTINCT deal_id)` ensures deals aren’t double-counted in the mart layer.  
- Month stored as date for easier reporting and filtering.  
- Data tests applied at each layer: `not_null`, `unique`, `relationships`.  

---

## How to Run
```bash
dbt seed --full-refresh    # load raw CSVs into public schema
dbt run                     # run models (staging → intermediate → mart)
dbt test                    # run data quality tests
