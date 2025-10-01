# 📊 University Marketing Campaign Data Analysis and Visualization

This project focuses on analyzing and visualizing university marketing campaign data to uncover trends, evaluate performance, and generate actionable insights. The workflow followed an end-to-end data pipeline: cleaning → integration → visualization.

🔹 Data Preparation

Cleaned and validated raw datasets using PostgreSQL, applying business rule validation to ensure accuracy and consistency.

Created a master table by joining three datasets:

Applicants Data – applicant profiles and country details.

Outreach Data – call records and outcomes.

Campaign Data – campaign-level information (type, region, status, season).

🔹 Database Management

Loaded all cleaned tables into Supabase, leveraging its scalability and PostgreSQL backbone.

Structured the schema to support joins between applicants, outreach, and campaigns for a unified analysis.

🔹 Visualization

Connected Supabase to Google Looker Studio to build an interactive dashboard.

Dashboard features:

Filters/Controls: Date range, Country, Campaign Region, Season, and Status Category.

Charts Used:

Time Series (call trends over time).

Bar Charts (agent performance, campaign outcomes).

Donut Chart (campaign region distribution).

Geo Map (applicant distribution by country).

KPI Cards (connected calls, disconnected calls, connectivity rate).

🔹 Key Insights

Online Call Campaigns captured region-specific data (~70%) while offline campaigns did not (~30%), highlighting differences in campaign setup.

Significant variation in agent activity and outcomes revealed opportunities for performance improvement.

Applicant data showed wide geographic reach, with distinct regional trends.

Clear visibility into campaign seasonality and status categories supported periodic reviews.

🔹 Outcome

This project demonstrates the complete workflow of data cleaning, database integration, and interactive visualization. The resulting dashboard provides stakeholders with a live, functional tool to evaluate marketing campaign effectiveness and identify areas for strategic improvement.
