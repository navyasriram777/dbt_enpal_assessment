Sales Funnel DBT Project:

This project models sales funnel metrics from Pipedrive CRM. 
It transforms raw CRM data into a clean, structured dataset for monthly reporting, including main funnel steps (1-9) and sub-steps like Sales Call 1 (2.1) and Sales Call 2 (3.1).

Data Flow & Layers:

Raw Layer (public schema):

Contains the raw CSV data loaded as seeds.

Raw data tables include activity, activity_types, deal_changes, fields, stages, users.

Staging Layer (stg_* views in pipedrive_analytics schema):

Cleans and standardizes raw data.

Converts flags to booleans, parses JSON, trims and lowercases text, deduplicates users.

Implemented as views for easier debugging and lightweight transformations.

Intermediate Layer (int_* tables in pipedrive_analytics schema):

Enriches and combines staging tables.

Deduplicates deal stage updates and handles nulls safely.

Implemented as tables to store pre-aggregated, reusable data.

Mart Layer (rep_sales_funnel_monthly table in pipedrive_analytics schema):

Builds the final monthly funnel report with KPIs.

Counts unique deals per funnel step, including sub-steps.

Sorts funnel steps numerically for correct order.

Implemented as a table for reporting and performance.

Key Decisions:

CSV headers are lowercase to avoid Postgres case-sensitivity issues.

ROW_NUMBER() used to deduplicate records in staging/intermediate layers.

COUNT(DISTINCT deal_id) ensures deals aren’t double-counted in the mart layer.

Month stored as date for easier reporting and filtering.

Data tests applied at each layer: not_null, unique, relationships.

How to Run :
dbt seed --full-refresh # load raw CSVs into public schema
dbt run # run models (staging → intermediate → mart)
dbt test # run data quality tests