# Brazilian Real Estate Investment Funds (REIT's) Data Pipeline
## Problem
The CVM (Comissão de Valores Mobiliarios) website provides data on Real Estate Investment Funds on the [CVM Open Data Portal](https://dados.cvm.gov.br/dataset/fii-doc-inf_mensal) in monthly .csv tables compressed into .zip format. The dataset provides monthly reports for the last five years. The files will be updated weekly with any resubmissions. 
## Objective
This project establishes an end-to-end data pipeline utilizing Prefect, Google Cloud Storage (GCS), Google Cloud Run, BigQuery, and dbt. The pipeline extracts data from the CVM (Comissão de Valores Mobiliarios)) website regarding Real Estate Investment Funds (REITs) in Brazil.

## Overview

The primary objective of this project is to automate the extraction, transformation, and loading (ETL) process of REIT data from the CVM database into a structured format for further analysis and visualization.
In short, the deployment was registered to run every day at 4pm (America/Chicago time). The flow checks whether there have been any updates to the available data and, if so, the files are downloaded, decompressed, transformed into parquet, uploaded to the GCS (both the parquet data and the raw data) and, from the bucket, the staging tables are created.

## Infrastructure

### Diagram
![diagram-export-15-04-2024-01_41_03](https://github.com/arthurfg/brazilian-reits/assets/62671380/a55959f1-b3f6-4349-a43a-4b08e355afb3)


1. **Prefect**: Orchestrationn
   
2. **Google Cloud Storage (GCS)**: Data Lake
   
3. **Google Cloud Run**: Serverless task's runner
   
4. **BigQuery**: Data Warehouse
   
5. **dbt (data build tool)**: Transformation/Batch processing

6. **Looker Studio**: Dashboard

## Workflow

1. **Data Extraction**: Data is extracted from the CVM open data using python. The extracted data is stored in GCS in its raw and staging format.
   
2. **Data Transformation**: Data preprocessing and cleaning tasks are performed using containerized applications hosted on Google Cloud Run. 
   
3. **Data Loading**: Processed data is loaded into BigQuery tables, organized in a schema suitable for analysis. dbt may be employed here to further refine the data model and create derived datasets.
   
4. **Dashboard Creation**: Finally, the transformed data is utilized to create interactive dashboards for visualizing key insights and performance metrics of REITs in Brazil. 

## Dashboard
https://lookerstudio.google.com/embed/reporting/b97f7247-c3de-4927-b021-a3fe74d671d2/page/1M
<img width="908" alt="Captura de Tela 2024-04-14 às 23 36 39" src="https://github.com/arthurfg/brazilian-reits/assets/62671380/c51596eb-4dcc-4fb3-869b-6f62f1640073">
