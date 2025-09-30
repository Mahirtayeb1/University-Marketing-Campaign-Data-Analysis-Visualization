create table ApplicantData(
	App_ID Text,
	Country Text,
	University Text,
	Phone_Number Text	
);

copy ApplicantData 
from 'E:\Data Analysis\Excelerate Internship\Week 1\Resource\Csv_files\ApplicantData.csv' 
WITH (FORMAT csv, HEADER true);

select * from ApplicantData
where Length(Phone_Number) > 20;

-- finding missing & null values:
SELECT
    COUNT(*) AS total_rows,
    COUNT(*) FILTER (WHERE App_ID IS NULL OR TRIM(App_ID) = '') AS app_id_nulls,
    COUNT(*) FILTER (WHERE Country IS NULL OR TRIM(Country) = '') AS country_nulls,
    COUNT(*) FILTER (WHERE University IS NULL OR TRIM(University) = '') AS university_nulls,
    COUNT(*) FILTER (WHERE Phone_Number IS NULL OR TRIM(Phone_Number) = '') AS phone_number_nulls
FROM ApplicantData;

Select Count(*) As Total_Duplicates 
From (
	SELECT App_ID, COUNT(*) AS occurrences
	FROM ApplicantData
	GROUP BY App_ID
	HAVING COUNT(*) > 1);




SELECT
    COUNT(*) FILTER (WHERE Phone_Number ~ '[,\/.\-]') AS inconsistent,
	COUNT(*) FILTER (WHERE Length(Phone_Number) > 20) AS Invalid_PhoneNumber,
    COUNT(*) FILTER (WHERE NOT (Phone_Number ~ '[,\/.\-]')) AS clean
FROM ApplicantData;

SELECT
    COUNT(*) FILTER (WHERE App_ID ~ '[,\/.\-]') AS inconsistent_AppID,
    COUNT(*) FILTER (WHERE NOT (App_ID ~ '[,\/.\-]')) AS clean_AppID
FROM ApplicantData;

-- finding top 10 most appeared countries:
SELECT 
    Country, 
    COUNT(*) AS total_appeared
FROM ApplicantData
WHERE Country IS NOT NULL 
	AND TRIM(Country) <> '' 
	AND TRIM(Country) <> '-'
GROUP BY Country
ORDER BY total_appeared DESC
LIMIT 10;



create table OutreachData(
	Reference_ID Text,
	Recieved_At Text,
	University Text,
	Caller_Name Text,
	Outcome_1 Text,
	Remark text,
	Campaign_ID text,
	Escalation_Required Text	
);

copy OutreachData 
from 'E:\Data Analysis\Excelerate Internship\Week 1\Resource\Csv_files\OutreachData.csv' 
WITH (FORMAT csv, HEADER true);

-- finding inconsistent_Reference_ID's from OutreachData
SELECT
    COUNT(*) FILTER (WHERE Reference_ID ~ '[,\/.\-]') AS inconsistent_Reference_ID,
    COUNT(*) FILTER (WHERE NOT (Reference_ID ~ '[,\/.\-]')) AS clean_ReferenceID
FROM OutreachData;


-- creating clean dataset

DROP TABLE IF EXISTS CleanApplicantData;
create table CleanApplicantData(
	App_ID Bigint,
	Country Varchar(56),
	University Varchar(255),
	Phone_Number Text
);

copy CleanApplicantData 
from 'E:\Data Analysis\Excelerate Internship\Week 1\Resource\Cleaned_Csv_files\CleanApplicantData.csv' 
WITH (FORMAT csv, HEADER true);

Select * from CleanApplicantData;


DROP TABLE IF EXISTS Cleaned_CampaignData;
create table Cleaned_CampaignData(
	ID Text,
	Name Varchar(255),
	Category Varchar(56),
	Intake Varchar(20),
	University Varchar(255),
	Status Varchar(20),
	Start_Date timestamp,
	Season Varchar(20),
	Campaign_Type Varchar(20),
	Campaign_Region Varchar(56),
	Campaign_Status Varchar(255)
);

set datestyle to MDY;
copy Cleaned_CampaignData 
from 'E:\Data Analysis\Excelerate Internship\Week 1\Resource\Cleaned_Csv_files\Cleaned_CampaignData.csv' 
WITH (FORMAT csv, HEADER true);

Select * from Cleaned_CampaignData;


DROP TABLE IF EXISTS Cleaned_OutreachData;
create table Cleaned_OutreachData(
	Outreach_ID int,
	Reference_ID Bigint,
	Recieved_At timestamp,
	University varchar(255),
	Celler_Name varchar(20),
	Outcome_1 Text,
	Remark Text,
	Campaign_ID Varchar(20),
	Escalation_Required Varchar(20),
	Date timestamp,
	Year Varchar(10),
	Time Time,
	Hour int,
	Weekday Varchar(20),
	Month Varchar(20)	
);

set datestyle to MDY;
copy Cleaned_OutreachData 
from 'E:\Data Analysis\Excelerate Internship\Week 1\Resource\Cleaned_Csv_files\Cleaned_OutreachData.csv' 
WITH (FORMAT csv, HEADER true);

Select * from OutreachData;

-- checking Cleaned data is actually cleaned or not
-- CleanApplican
SELECT
    COUNT(*) FILTER (WHERE Phone_Number ~ '[,\/.\-]') AS inconsistent,
	COUNT(*) FILTER (WHERE Length(Phone_Number) > 20) AS Invalid_PhoneNumber,
    COUNT(*) FILTER (WHERE NOT (Phone_Number ~ '[,\/.\-]')) AS clean
FROM CleanApplicantData;

SELECT
    COUNT(*) FILTER (WHERE App_ID ~ '[,\/.\-]') AS inconsistent,
    COUNT(*) FILTER (WHERE NOT (App_ID ~ '[,\/.\-]')) AS clean
FROM CleanApplicantData;


SELECT * FROM "CleanApplicantData"
WHERE "Country" = 'India';

SELECT * FROM "Cleaned_CampaignData";

select * from "Cleaned_OutreachData";

DROP MATERIALIZED VIEW IF EXISTS master_table;
CREATE MATERIALIZED VIEW master_table AS
SELECT 
    -- o."Outreach_ID",
    o."Reference_ID" AS app_id,
    a."Country",
    a."University" AS Applicant_University,
    a."Phone_Number",
    o."Recieved_At",
    o."Caller_Name",
    o."Outcome_1",
    o."Remark",
    o."Campaign_ID",
    c."Name" AS Campaign_Name,
    c."Category" AS Campaign_Category,
	c."Season" AS Campaign_Season,
    c."Campaign_Type",
    c."Campaign_Region",
    c."Status" AS Campaign_Status,
    c."Status_Category",
    c."Deposit_Status",
    c."Completion_Status",
    c."Start_Date" AS Campaign_Start_Date,
    o."Date" AS Call_Date,
    o."Time" AS Call_Time,
    o."Hour" AS Call_Hour,
    o."Weekday" AS Call_Weekday,
    o."Month" AS Call_Month
FROM "Cleaned_OutreachData" o
LEFT JOIN "CleanApplicantData" a 
    ON o."Reference_ID" = a."App_ID"
LEFT JOIN "Cleaned_CampaignData" c 
    ON o."Campaign_ID" = c."ID";


select * from master_table;




