# Basic ETL Pipeline with Bash and PostgreSQL
This is a singular demonstration of my basic knowledge of using bash scripts to create an ETL pipeline for web-server log data.

## Overview

This repository contains a simple ETL (Extract, Transform, Load) pipeline implemented using Bash scripting and PostgreSQL. The pipeline is designed to process web server access logs, extract relevant data, perform necessary transformations, and load the cleaned data into a PostgreSQL database for further analysis.

## Prerequisites

- Bash shell
- PostgreSQL


## ETL Process

### Extract

The extraction phase begins with downloading a gzip-compressed web server access log file using wget. The file is then decompressed using gunzip to obtain the raw text data.

### Transform

Transformation involves using cut to extract specific columns from the log file—namely, timestamp, latitude, longitude, and visitor ID. A simple tr command is then used to replace hash # delimiters with commas, converting the data into a CSV format suitable for database ingestion.

### Load

The loading phase utilizes PostgreSQL's COPY command to import the transformed CSV data into the access_log table within the template1 database. The script ensures that the data is accurately loaded by running a verification SQL query to retrieve and display the imported data.


## Script Screen


<img width="1401" alt="Script Screen" src="https://github.com/justint42/third-grade-ETL-project/assets/106895220/3c795202-d1af-4e69-a268-7d00630e74db">

## Output Screen

<img width="818" alt="Table Screen" src="https://github.com/justint42/third-grade-ETL-project/assets/106895220/bbdfda5b-1c34-475e-b83b-e18d32ad27fa">
