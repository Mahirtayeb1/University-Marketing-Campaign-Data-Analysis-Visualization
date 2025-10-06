# 🎓 University Marketing Campaign Data Analysis & Visualization (Supabase + Looker Studio)

> In today’s competitive education landscape, marketing campaigns play a crucial role in reaching prospective students across regions. This project analyzes university marketing campaign data, integrates it into a scalable database, and builds an interactive dashboard to uncover insights about applicant demographics, campaign performance, and agent activity.

---

## 📂 Dataset

- Sources: University outreach & applicant datasets (Applicants, Outreach Calls, Campaigns)

- Rows: ~38,000

- Columns: 15+ across multiple tables

- Contents: Applicant profiles, call outcomes, campaign details (type, region, season, status), agent activities

---

## 🎯 Project Goals

- ✅ Clean and validate raw datasets using PostgreSQL

- ✅ Create a master table by joining applicants, outreach, and campaign data

- ✅ Load structured data into Supabase for scalability and integration

- ✅ Build an interactive Looker Studio dashboard for stakeholders

- ✅ Provide insights on campaign reach, performance, and applicant demographics

---
  
## 🛠️ Challenges & Solutions
### 1. ⚠️ Data Cleaning & Business Rule Validation

Problem: Raw datasets contained inconsistencies (duplicate records, missing regions, invalid statuses).

Solution: Applied SQL cleaning & business rule validation in PostgreSQL before integration.

---


### 2. 🔄 Master Table Creation

Problem: Data was split across three different tables (Applicants, Outreach, Campaigns).

Solution: Designed SQL joins to create a single master_table (materialized view) in **Supabase** for easier analysis.

---

### 3. 📊 Visualization with Looker Studio

Problem: Needed real-time, interactive visualization directly from Supabase.

Solution: Connected Looker Studio to Supabase, applied custom SQL queries, and optimized refresh times for large datasets.

---

## 📊 Dashboard Overview

The Looker Studio dashboard includes:

- 📈 Time Series: Call trends over time (with campaign season drill-down)

- 🧑‍💼 Agent Performance: Bar chart showing caller activity & outcomes

- 🌍 Geographic Analysis: Geo map of applicant distribution by country

- 🟢 Campaign Insights: Donut/Bar charts for campaign regions & types

- 📌 Filters/Controls: Date range, Country, Campaign Region, Campaign Season, Status Category

- 📊 KPI Metrics: Connected Calls, Disconnected Calls, Connectivity Rate

---

## 🌟 Key Insights

| Insight                    | Detail                                                                                     |
| -------------------------- | ------------------------------------------------------------------------------------------ |
| 🌍 Reach                   | Applicants came from multiple countries, showing global reach                              |
| 🟢 Campaign Region vs Type | Distribution showed ~70% online (with regions) vs 30% offline (no region)                  |
| 📞 Connectivity            | Clear difference between connected vs disconnected calls, impacting campaign effectiveness |
| 🧑‍💼 Agent Activity       | Some agents showed much higher call volumes and success rates, suggesting performance gaps |
| 📅 Seasonality             | Campaigns varied by season, highlighting opportunities for better scheduling               |

---

## 💡 Recommendations

📌 Standardize campaign data entry to reduce missing regions

📌 Improve agent training & resource allocation based on performance analysis

📌 Focus on regions with higher applicant engagement for future campaigns

📌 Enhance call strategies to improve connectivity rates

📌 Monitor seasonality to time campaigns more effectively

---

## 🔗 Demo & Files

- <a href="https://github.com/Mahirtayeb1/University-Marketing-Campaign-Data-Analysis-Visualization/blob/main/Dashboard/University%20Marketing%20Campaign%20Data%20Visualization%20Dashboard.pdf"> [📊 Looker Studio Dashboard Screenshots]</a>

- <a href="https://github.com/Mahirtayeb1/University-Marketing-Campaign-Data-Analysis-Visualization/blob/main/SQL_queries/Data%20Preprocessing_EDA/Master%20table.sql"> [📄 SQL Queries for Master Table]</a>

- <a href="https://github.com/Mahirtayeb1/University-Marketing-Campaign-Data-Analysis-Visualization/blob/main/Project%20Report/University%20Marketing%20Campaign%20Data%20Analysis%20and%20Visualization%20Report.pdf"> [📂 Project Documentation]</a>

---

## 🧠 What I Learned

- Data cleaning & validation with **PostgreSQL**

- Creating materialized views for scalable analytics

- Using **Supabase** for database hosting & real-time integration

- Designing interactive dashboards in **Looker Studio**

- Turning raw data into insights for decision-making

---

## 🛠️ Tech Stack

<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/postgresql/postgresql-original.svg" alt="PostgreSQL" width="60" height="60"/>

<img src="https://avatars.githubusercontent.com/u/54469796?s=200&v=4" alt="Supabase" width="60" height="60"/>

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Google_Data_Studio_logo.png/240px-Google_Data_Studio_logo.png" alt="Looker Studio" width="60" height="60"/>

---

## 💼 This project highlights my skills in data engineering, SQL, and visualization using cloud databases and BI tools. It demonstrates the complete workflow from 
- ### raw data → Data Cleaning → database integration → Finding Insights → Data Validation → dashboard storytelling
