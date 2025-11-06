📅 Day 4 — November 6, 2025

🎯 Challenge: Find the 3rd to 7th highest patient satisfaction scores from the patients table, showing patient_id, name, service, and satisfaction. Display only these 5 records.

💻 Challenge Query:

SELECT patient_id, name, service, satisfaction
FROM patients 
ORDER BY satisfaction DESC
LIMIT 5 OFFSET 2;


🧾 Practice Queries:

-- 1. Display the first 5 patients from the patients table
SELECT * FROM patients
LIMIT 5;

-- 2. Show patients 11–20 using OFFSET
SELECT * FROM patients
LIMIT 10 OFFSET 10;

-- 3. Get the 10 most recent patient admissions based on arrival_date
SELECT * FROM patients
ORDER BY arrival_date DESC
LIMIT 10;

🚀 Progress Summary
Day	Date	Challenge Description	Focus Area
1	Nov 3, 2025	Unique hospital services	DISTINCT, SELECT basics
2	Nov 4, 2025	Patients in Surgery with low satisfaction	WHERE, comparison operators
3	Nov 5, 2025	Top 5 weeks with highest patient refusals	ORDER BY, LIMIT, sorting
4	Nov 6, 2025	3rd–7th highest satisfaction scores	LIMIT + OFFSET, ORDER BY

