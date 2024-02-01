# Y2S1-CPT103 Database Project - Pandemic Monitoring & Management System (PMMS)

## Overview

This repository contains the SQL schema and data manipulation scripts for a pandemic monitoring and management system designed for the CPT103 course. This system is intended to monitor the spread of a pandemic by tracking citizens' test results and travel history.

## Database Schema

The schema comprises several tables that capture citizen details, test results, sample types, tracking information, and district risk levels.

### Tables

- `citizen`: Stores personal information of each citizen including name, age, gender, and mobile number.
- `testresult`: Holds the test results for each citizen, with references to the `citizen` and `SampleType` tables.
- `SampleType`: Contains different types of test samples and their descriptions.
- `doctor_name`: Lists the names of doctors and their associated hospital names.
- `tracking`: Tracks the movement of citizens, with references to the `basetower` table.
- `basetower`: Represents base towers that track citizen movements, linked to districts.
- `district`: Defines districts within the kingdom, including their risk levels.

### ER Diagram
![image](https://github.com/LCQck/Y2S1-Database/assets/128359137/4e085001-7007-4119-b0f7-4ea558e8df6b)
